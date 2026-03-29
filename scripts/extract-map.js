#!/usr/bin/env node

/**
 * extract-map.mjs - Extract WC3 .w3x map files to JSON.
 *
 * Uses StormLib to read the MPQ archive and wc3maptranslator to
 * convert binary formats to JSON.
 *
 * Output: map-data/ directory with JSON files for each map component.
 */

const { Archive } = require("stormlib-node-bindings");
const {
  ObjectsTranslator,
  RegionsTranslator,
  UnitsTranslator,
  StringsTranslator,
  InfoTranslator,
} = require("wc3maptranslator");
const fs = require("fs");
const path = require("path");

const MAP_PATH = path.resolve(__dirname, "..", "base.w3x");
const OUTPUT_DIR = path.resolve(__dirname, "..", "map-data");

// Map files we want to extract and their translators
const EXTRACT_FILES = [
  // Object data
  { mpqPath: "war3map.w3u", outName: "units.json", type: "units" },
  { mpqPath: "war3map.w3t", outName: "items.json", type: "items" },
  { mpqPath: "war3map.w3a", outName: "abilities.json", type: "abilities" },
  { mpqPath: "war3map.w3h", outName: "buffs.json", type: "buffs" },
  { mpqPath: "war3map.w3d", outName: "doodads-obj.json", type: "doodads" },
  { mpqPath: "war3map.w3q", outName: "upgrades.json", type: "upgrades" },
  // Regions
  { mpqPath: "war3map.w3r", outName: "regions.json", type: "regions" },
  // Preplaced units
  { mpqPath: "war3mapUnits.doo", outName: "placed-units.json", type: "placed-units" },
  // Strings
  { mpqPath: "war3map.wts", outName: "strings.json", type: "strings" },
  // Map info
  { mpqPath: "war3map.w3i", outName: "info.json", type: "info" },
  // Gameplay constants
  { mpqPath: "war3mapMisc.txt", outName: "misc.txt", type: "raw" },
  { mpqPath: "war3mapSkin.txt", outName: "skin.txt", type: "raw" },
];

// Object type enum matching wc3maptranslator
const ObjectType = {
  units: "units",
  items: "items",
  abilities: "abilities",
  buffs: "buffs",
  doodads: "destructables",
  upgrades: "upgrades",
};

function main() {
  console.log("╔══════════════════════════════════════════╗");
  console.log("║  WC3 Map Data Extractor                  ║");
  console.log("╚══════════════════════════════════════════╝");
  console.log();

  if (!fs.existsSync(MAP_PATH)) {
    console.error(`Map not found: ${MAP_PATH}`);
    process.exit(1);
  }

  // Create output directory
  fs.mkdirSync(OUTPUT_DIR, { recursive: true });

  // Open the MPQ archive
  console.log(`Opening: ${MAP_PATH}`);
  const archive = new Archive(MAP_PATH);

  let extracted = 0;
  let failed = 0;

  for (const file of EXTRACT_FILES) {
    process.stdout.write(`  ${file.mpqPath} → ${file.outName} ... `);

    try {
      // Extract file from MPQ to temp location, then read it
      const tempPath = path.join(OUTPUT_DIR, "_temp_" + file.outName);
      archive.extractFile(file.mpqPath, tempPath);
      const buffer = fs.readFileSync(tempPath);
      fs.unlinkSync(tempPath);

      if (!buffer || buffer.length === 0) {
        console.log("(empty/missing)");
        failed++;
        continue;
      }

      const outPath = path.join(OUTPUT_DIR, file.outName);

      if (file.type === "raw") {
        // Write raw text files directly
        fs.writeFileSync(outPath, buffer);
        console.log(`${buffer.length} bytes`);
      } else if (["units", "items", "abilities", "buffs", "doodads", "upgrades"].includes(file.type)) {
        // Use ObjectsTranslator for object data files
        const result = ObjectsTranslator.warToJson(ObjectType[file.type], buffer);
        fs.writeFileSync(outPath, JSON.stringify(result, null, 2));
        const count = (result.custom || []).length + (result.original || []).length;
        console.log(`${count} objects`);
      } else if (file.type === "regions") {
        const result = RegionsTranslator.warToJson(buffer);
        fs.writeFileSync(outPath, JSON.stringify(result, null, 2));
        console.log(`${(result || []).length} regions`);
      } else if (file.type === "placed-units") {
        const result = UnitsTranslator.warToJson(buffer);
        fs.writeFileSync(outPath, JSON.stringify(result, null, 2));
        console.log(`${(result || []).length} placed units`);
      } else if (file.type === "strings") {
        const result = StringsTranslator.warToJson(buffer);
        fs.writeFileSync(outPath, JSON.stringify(result, null, 2));
        console.log(`${Object.keys(result || {}).length} strings`);
      } else if (file.type === "info") {
        const result = InfoTranslator.warToJson(buffer);
        fs.writeFileSync(outPath, JSON.stringify(result, null, 2));
        console.log("ok");
      }

      extracted++;
    } catch (err) {
      console.log(`FAILED: ${err.message}`);
      failed++;
    }
  }

  // Also try to list all files in the archive for reference
  try {
    process.stdout.write("  (listing archive contents) ... ");
    const listPath = path.join(OUTPUT_DIR, "_archive_contents.txt");
    // StormLib doesn't always have listFiles, try it
    if (typeof archive.listFiles === "function") {
      const files = archive.listFiles();
      fs.writeFileSync(listPath, files.join("\n"));
      console.log(`${files.length} files`);
    } else {
      console.log("(listFiles not available)");
    }
  } catch (err) {
    console.log(`(skipped: ${err.message})`);
  }

  archive.close();

  console.log();
  console.log(`Extracted: ${extracted}/${EXTRACT_FILES.length} files`);
  if (failed > 0) {
    console.log(`Failed: ${failed} (some files may not exist in this map)`);
  }
  console.log(`Output: ${OUTPUT_DIR}/`);
}

main();
