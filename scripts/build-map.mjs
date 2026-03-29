#!/usr/bin/env node

/**
 * build-map.mjs - Build pipeline to package TSTL output into a WC3 .w3x map.
 *
 * Pipeline:
 * 1. Run TSTL to transpile TypeScript → Lua (dist/tstl_output.lua)
 * 2. Copy the bundled Lua into the map's war3map.lua slot
 * 3. Package everything into the final .w3x archive
 *
 * Usage:
 *   node scripts/build-map.mjs [--base-map <path>] [--output <path>]
 *
 * Options:
 *   --base-map   Path to base.w3x template (default: maps/base.w3x)
 *   --output     Output .w3x path (default: dist/IslandTrollTribes.w3x)
 *   --skip-tstl  Skip TSTL transpilation (use existing dist/tstl_output.lua)
 *
 * Requirements:
 * - Node.js >= 18
 * - TSTL installed (via npm)
 * - A base.w3x map file with terrain, object data, and triggers stub
 *
 * The base.w3x should contain:
 * - war3map.w3e (terrain)
 * - war3map.w3u, war3map.w3t, war3map.w3a, war3map.w3h (object data)
 * - war3map.w3r (regions/rects)
 * - war3map.w3s (sounds)
 * - war3mapUnits.doo (preplaced units)
 * - war3map.wts (trigger strings)
 * - war3mapMisc.txt (gameplay constants)
 */

import { execSync } from "node:child_process";
import { existsSync, mkdirSync, copyFileSync, readFileSync, writeFileSync } from "node:fs";
import { join, resolve, dirname } from "node:path";

// ─── Configuration ───────────────────────────────────────────────────────

const ROOT_DIR = resolve(dirname(new URL(import.meta.url).pathname), "..");
const DEFAULT_BASE_MAP = join(ROOT_DIR, "base.w3x");
const DEFAULT_OUTPUT = join(ROOT_DIR, "dist", "IslandTrollTribes.w3x");
const TSTL_OUTPUT = join(ROOT_DIR, "dist", "tstl_output.lua");

// ─── Parse Arguments ─────────────────────────────────────────────────────

const args = process.argv.slice(2);
let baseMapPath = DEFAULT_BASE_MAP;
let outputPath = DEFAULT_OUTPUT;
let skipTstl = false;

for (let i = 0; i < args.length; i++) {
  switch (args[i]) {
    case "--base-map":
      baseMapPath = resolve(args[++i]);
      break;
    case "--output":
      outputPath = resolve(args[++i]);
      break;
    case "--skip-tstl":
      skipTstl = true;
      break;
    case "--help":
      console.log(`
Usage: node scripts/build-map.mjs [options]

Options:
  --base-map <path>   Path to base.w3x template (default: maps/base.w3x)
  --output <path>     Output .w3x path (default: dist/IslandTrollTribes.w3x)
  --skip-tstl         Skip TSTL transpilation step
  --help              Show this help message
`);
      process.exit(0);
  }
}

// ─── Build Steps ─────────────────────────────────────────────────────────

console.log("╔══════════════════════════════════════════╗");
console.log("║  Island Troll Tribes - Map Build         ║");
console.log("╚══════════════════════════════════════════╝");
console.log();

// Step 1: TSTL Transpilation
if (!skipTstl) {
  console.log("▸ Step 1: Transpiling TypeScript → Lua...");
  try {
    execSync("npx tstl -p tsconfig.json", {
      cwd: ROOT_DIR,
      stdio: "inherit",
    });
    console.log("  ✓ TSTL transpilation complete");
  } catch (err) {
    console.error("  ✗ TSTL transpilation failed!");
    process.exit(1);
  }
} else {
  console.log("▸ Step 1: Skipped (--skip-tstl)");
}

// Step 2: Verify output
console.log("▸ Step 2: Verifying Lua output...");
if (!existsSync(TSTL_OUTPUT)) {
  console.error(`  ✗ Expected Lua bundle not found: ${TSTL_OUTPUT}`);
  console.error("    Run 'npm run build' first or remove --skip-tstl");
  process.exit(1);
}

const luaContent = readFileSync(TSTL_OUTPUT, "utf-8");
const luaLines = luaContent.split("\n").length;
console.log(`  ✓ Lua bundle: ${luaLines} lines (${(luaContent.length / 1024).toFixed(1)} KB)`);

// Step 3: Check base map
console.log("▸ Step 3: Checking base map...");
if (!existsSync(baseMapPath)) {
  console.warn(`  ⚠ Base map not found: ${baseMapPath}`);
  console.warn("    To create a complete .w3x, place your base map at maps/base.w3x");
  console.warn("    For now, outputting standalone Lua bundle only.");
  console.log();

  // Ensure dist directory exists
  mkdirSync(dirname(outputPath), { recursive: true });

  // Copy Lua to a war3map.lua file for manual injection
  const war3mapLuaPath = join(dirname(outputPath), "war3map.lua");
  copyFileSync(TSTL_OUTPUT, war3mapLuaPath);
  console.log(`  ✓ Lua bundle copied to: ${war3mapLuaPath}`);
  console.log("    Manually inject this into your .w3x using a MPQ editor.");
  console.log();
  console.log("Build complete (Lua only - no .w3x packaging).");
  process.exit(0);
}

// Step 4: Package into .w3x
console.log("▸ Step 4: Packaging .w3x...");

// Check for Ceres (WC3 map packaging tool)
let hasCeres = false;
try {
  execSync("ceres --version", { stdio: "pipe" });
  hasCeres = true;
} catch {
  hasCeres = false;
}

if (hasCeres) {
  // Use Ceres for packaging
  console.log("  Using Ceres for map packaging...");
  try {
    // Copy Lua to the expected location for Ceres
    const ceresLuaDir = join(ROOT_DIR, "target", "map");
    mkdirSync(ceresLuaDir, { recursive: true });
    copyFileSync(TSTL_OUTPUT, join(ceresLuaDir, "war3map.lua"));

    execSync(`ceres build --map "${baseMapPath}" --output "${outputPath}"`, {
      cwd: ROOT_DIR,
      stdio: "inherit",
    });
    console.log(`  ✓ Map packaged: ${outputPath}`);
  } catch (err) {
    console.error("  ✗ Ceres packaging failed!");
    console.error("    " + err.message);
    process.exit(1);
  }
} else {
  // Fallback: manual MPQ-less approach
  // Copy base map and instruct user to inject Lua manually
  console.warn("  ⚠ Ceres not found in PATH.");
  console.warn("    Install Ceres: https://github.com/ceres-wc3/ceres");
  console.warn("    Or use an MPQ editor to inject war3map.lua into the .w3x");
  console.log();

  mkdirSync(dirname(outputPath), { recursive: true });
  copyFileSync(baseMapPath, outputPath);

  const war3mapLuaPath = join(dirname(outputPath), "war3map.lua");
  copyFileSync(TSTL_OUTPUT, war3mapLuaPath);

  console.log(`  ✓ Base map copied to: ${outputPath}`);
  console.log(`  ✓ Lua bundle at: ${war3mapLuaPath}`);
  console.log("    Use an MPQ editor (e.g., MPQEditor) to inject war3map.lua into the .w3x");
}

console.log();
console.log("╔══════════════════════════════════════════╗");
console.log("║  Build Complete!                         ║");
console.log("╚══════════════════════════════════════════╝");
