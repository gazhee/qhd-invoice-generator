# QHD Invoice Generator v2.5.3 Release Notes

**Release Date**: November 24, 2025
**Release Type**: Bug Fix Release

---

## 🐛 Critical Bug Fix

### Packing List Totals Calculation Fixed

**Issue**: Packing list totals were showing incorrect values, summing up hidden/orphaned DOM elements instead of only visible package cards.

**Example**:
- **Before**: 1 visible crate (407 kg, 0.703 CBM) → TOTALS showed 1,007 kg and 11.770 CBM ❌
- **After**: 1 visible crate (407 kg, 0.703 CBM) → TOTALS shows 407 kg and 0.703 CBM ✅

**Root Cause**: Global DOM selector `QA('.package-card')` was capturing all package-card elements in the entire document, including orphaned elements from previous operations.

**Fix**: Scoped selectors to only search within the `items-container` element, ensuring only visible packages are counted.

---

## 📦 What's Included in This Release

### Windows Applications
- **QHD Invoice Generator Setup 2.5.3.exe** (115 MB)
  - Full installer with desktop shortcuts
  - Supports Windows 7/8/10/11 (32-bit and 64-bit)
  - Customizable installation directory

- **QHD Invoice Generator 2.5.3.exe** (115 MB)
  - Portable version - no installation required
  - Run directly from USB or network drive
  - Perfect for users without admin rights

### macOS Application
- **QHD Invoice Generator-2.5.3-mac.zip** (84 MB)
  - Compatible with Intel Macs
  - Works on Apple Silicon Macs via Rosetta 2
  - Extract and drag to Applications folder

---

## 🔄 Recent Changes (v2.5.2 → v2.5.3)

### v2.5.3 (Current)
- ✅ Fixed packing list totals calculation bug
- ✅ Corrected DOM selector scope to prevent orphaned element accumulation

### v2.5.2 (Included)
- ✅ Simplified packing list interface
- ✅ Removed redundant volume display (still calculated in background)
- ✅ Improved weight precision to 1 decimal place

### v2.5.1 (Included)
- ✅ Fixed PDF filename auto-generation

### v2.5.0 (Included)
- ✅ Fixed PDF text copy-paste functionality

---

## 💿 Installation Instructions

### Windows

**Option 1: Full Installer (Recommended)**
1. Download `QHD Invoice Generator Setup 2.5.3.exe`
2. Double-click to run the installer
3. Follow the installation wizard
4. Launch from Start Menu or Desktop shortcut

**Option 2: Portable Version**
1. Download `QHD Invoice Generator 2.5.3.exe`
2. Place in any folder
3. Double-click to run directly

**Note**: Windows may show SmartScreen warning. Click "More info" → "Run anyway"

### macOS

1. Download `QHD Invoice Generator-2.5.3-mac.zip`
2. Extract the ZIP file
3. Drag `QHD Invoice Generator.app` to Applications folder
4. First launch: Right-click → Open (to bypass Gatekeeper)
5. Subsequent launches: Double-click normally

**Note**: App is not code-signed. You may need to allow it in System Preferences → Security & Privacy

---

## ✨ Key Features

### Document Types
- Standard Invoice
- Commercial Invoice
- Proforma Invoice
- Packing List

### Core Functionality
- 📝 Profile management (Shipper, Consignee, Bill To)
- 📋 Revision system with version control (A, B, C, etc.)
- 🔢 Auto-numbering with date-based format
- 💾 Local storage - no internet required
- 🖨️ Print-optimized layouts
- 🌐 Bilingual interface (Chinese/English)
- 📱 Works offline as desktop app

---

## 🔧 Technical Details

### Fixed Locations
1. Preview update totals calculation (line ~1937)
2. Package data collection when saving revisions (line ~2450)
3. Package renumbering after deletion (line ~2779)

### Changed Code
```javascript
// Before (incorrect)
QA('.package-card').forEach((packageCard) => { ... })

// After (correct)
const itemsContainer = D('items-container');
const packageCards = itemsContainer.querySelectorAll('.package-card');
packageCards.forEach((packageCard) => { ... })
```

---

## 📊 Version Compatibility

✅ Fully backward compatible with all previous versions
✅ Existing packing list data works without modification
✅ No data migration required
✅ All saved profiles and documents remain accessible

---

## 🆘 Support

### Issues or Questions?
- 📧 Email: xuan.zhang@qhdpv.com
- 🐛 Report bugs: [GitHub Issues](https://github.com/gazhee/invoice_generator/issues)

### Documentation
- 📖 User Manual: `USER_MANUAL.md`
- 📝 Version History: `VERSION_HISTORY.md`
- ⚙️ Project Instructions: `CLAUDE.md`

---

## 🙏 Credits

**Developed by**: Xuan Zhang & gazhee
**AI Assistant**: Claude Code (Anthropic)
**License**: MIT

---

## 📝 Changelog

For complete version history, see [VERSION_HISTORY.md](VERSION_HISTORY.md)

### v2.5.3 - 2025-11-24
- Fixed: Packing list totals calculation bug (critical)

### v2.5.2 - 2025-11-24
- Enhanced: Simplified packing list UI
- Improved: Weight display precision (1 decimal)

### v2.5.1 - 2025-11-08
- Fixed: PDF filename auto-generation

### v2.5.0 - 2025-11-08
- Fixed: PDF text copy-paste functionality

---

**SHA256 Checksums** (for verification):
```
Windows Installer: [To be generated after upload]
Windows Portable:  [To be generated after upload]
macOS ZIP:         [To be generated after upload]
```

---

© 2024-2025 QHD Company. All rights reserved.
