/**
 * Patches war3-transformer to support buff (w3h) file loading and saving.
 * Run via: node scripts/patch-war3-transformer.js
 *
 * The upstream war3-transformer omits w3h (buff) files from its
 * loadObjectData/saveObjectData functions. This patch adds them.
 */

const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '..', 'node_modules', 'war3-transformer', 'dist', 'objectdata.js');

if (!fs.existsSync(filePath)) {
  console.log('war3-transformer not installed, skipping patch');
  process.exit(0);
}

let content = fs.readFileSync(filePath, 'utf8');

// Check if already patched
if (content.includes('war3map.w3h')) {
  console.log('war3-transformer already patched for w3h support');
  process.exit(0);
}

// Patch 1: Add w3h loading after w3a loading
content = content.replace(
  'objectData.load(mapFiles);',
  `// Load in the map buff modifications if it has any.
        var w3h = loadFile("".concat(mapDir, "/war3map.w3h"), file_2.default);
        if (w3h) {
            mapFiles.w3h = w3h;
        }
        var w3hSkin = loadFile("".concat(mapDir, "/war3mapSkin.w3h"), file_2.default);
        if (w3hSkin) {
            mapFiles.w3hSkin = w3hSkin;
        }
        objectData.load(mapFiles);`
);

// Patch 2: Add w3h to save destructuring
content = content.replace(
  'w3a = _a.w3a, w3aSkin = _a.w3aSkin;',
  'w3a = _a.w3a, w3aSkin = _a.w3aSkin, w3h = _a.w3h, w3hSkin = _a.w3hSkin;'
);

// Patch 3: Add w3h saving after w3a saving
content = content.replace(
  /(\s*if \(w3aSkin\) \{[^}]+\}\n\})/,
  `$1\n    if (w3h) {\n        (0, fs_1.writeFileSync)("".concat(outputDir, "/war3map.w3h"), w3h.save());\n    }\n    if (w3hSkin) {\n        (0, fs_1.writeFileSync)("".concat(outputDir, "/war3mapSkin.w3h"), w3hSkin.save());\n    }`
);

fs.writeFileSync(filePath, content);
console.log('Patched war3-transformer for w3h (buff) support');
