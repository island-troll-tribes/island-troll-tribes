#!/usr/bin/env node

/**
 * build-map.mjs - Build pipeline to package TSTL output into a WC3 .w3x map.
 *
 * Pipeline:
 * 1. Run TSTL to transpile TypeScript → Lua + generate Object Editor data
 * 2. Copy base.w3x → dist/output.w3x
 * 3. Inject war3map.lua + war3map.w3u/w3t/w3a/w3h into the .w3x via StormLib
 *
 * Usage:
 *   node scripts/build-map.mjs [--skip-tstl]
 */

import { execSync } from "node:child_process";
import { existsSync, mkdirSync, copyFileSync, readFileSync, readdirSync, statSync } from "node:fs";
import { join, resolve, dirname } from "node:path";

const ROOT_DIR = resolve(dirname(new URL(import.meta.url).pathname), "..");
const BASE_MAP = join(ROOT_DIR, "base.w3x");
const DIST_DIR = join(ROOT_DIR, "dist");
const OBJ_DIR = join(DIST_DIR, "IslandTrollTribes.w3x"); // war3-transformer output dir
const TSTL_OUTPUT = join(DIST_DIR, "tstl_output.lua");
const OUTPUT_MAP = join(DIST_DIR, "IslandTrollTribes.w3x.map"); // final .w3x file

const skipTstl = process.argv.includes("--skip-tstl");

console.log("╔══════════════════════════════════════════╗");
console.log("║  Island Troll Tribes - Map Build         ║");
console.log("╚══════════════════════════════════════════╝\n");

// ─── Step 1: TSTL Transpilation ─────────────────────────────────────────

if (!skipTstl) {
  console.log("▸ Step 1: Transpiling TypeScript → Lua + Object Data...");
  mkdirSync(OBJ_DIR, { recursive: true });
  try {
    execSync("npx tstl -p tsconfig.json", { cwd: ROOT_DIR, stdio: "inherit" });
    console.log("  ✓ TSTL complete");
  } catch {
    console.error("  ✗ TSTL failed!");
    process.exit(1);
  }
} else {
  console.log("▸ Step 1: Skipped (--skip-tstl)");
}

// ─── Step 2: Verify outputs ─────────────────────────────────────────────

console.log("▸ Step 2: Verifying outputs...");

if (!existsSync(TSTL_OUTPUT)) {
  console.error(`  ✗ Lua bundle not found: ${TSTL_OUTPUT}`);
  process.exit(1);
}

const luaContent = readFileSync(TSTL_OUTPUT, "utf-8");
console.log(`  ✓ Lua bundle: ${luaContent.split("\n").length} lines (${(luaContent.length / 1024).toFixed(0)} KB)`);

// List generated object data files
const objFiles = existsSync(OBJ_DIR)
  ? readdirSync(OBJ_DIR).filter(f => f.endsWith(".w3u") || f.endsWith(".w3t") || f.endsWith(".w3a") || f.endsWith(".w3h"))
  : [];
console.log(`  ✓ Object data files: ${objFiles.join(", ") || "(none)"}`);

// ─── Step 3: Check base map ─────────────────────────────────────────────

console.log("▸ Step 3: Checking base map...");
if (!existsSync(BASE_MAP)) {
  console.error(`  ✗ Base map not found: ${BASE_MAP}`);
  console.error("    Place your base.w3x at the repository root.");
  process.exit(1);
}
console.log(`  ✓ Base map: ${BASE_MAP} (${(statSync(BASE_MAP).size / 1024 / 1024).toFixed(1)} MB)`);

// ─── Step 4: Package .w3x ───────────────────────────────────────────────

console.log("▸ Step 4: Packaging .w3x...");

// Copy base map to output
copyFileSync(BASE_MAP, OUTPUT_MAP);
console.log(`  ✓ Copied base map → ${OUTPUT_MAP}`);

// Try StormLib injection
let stormlib;
try {
  stormlib = await import("stormlib-node-bindings");
} catch {
  stormlib = null;
}

if (stormlib) {
  const { Archive } = stormlib;
  console.log("  Using StormLib for MPQ injection...");

  try {
    const archive = new Archive(OUTPUT_MAP, true); // open for writing

    // Inject Lua bundle as war3map.lua
    archive.addFile(TSTL_OUTPUT, "war3map.lua");
    console.log("  ✓ Injected war3map.lua");

    // Inject generated object data files
    for (const file of objFiles) {
      const filePath = join(OBJ_DIR, file);
      archive.addFile(filePath, file);
      console.log(`  ✓ Injected ${file}`);
    }

    archive.close();
    console.log(`  ✓ Map packaged: ${OUTPUT_MAP}`);
  } catch (err) {
    console.error(`  ✗ StormLib injection failed: ${err.message}`);
    console.log("  Falling back to manual instructions...");
    printManualInstructions();
  }
} else {
  console.log("  ⚠ StormLib not available.");
  printManualInstructions();
}

function printManualInstructions() {
  console.log("\n  To complete packaging manually:");
  console.log("  1. Open the .w3x in an MPQ editor (e.g., MPQEditor by Ladik)");
  console.log(`  2. Inject ${TSTL_OUTPUT} as 'war3map.lua'`);
  for (const file of objFiles) {
    console.log(`  3. Inject ${join(OBJ_DIR, file)} as '${file}'`);
  }
}

console.log("\n╔══════════════════════════════════════════╗");
console.log("║  Build Complete!                         ║");
console.log("╚══════════════════════════════════════════╝");
