# QHD Invoice Generator v2.5.4 Release Notes

**Release Date**: November 29, 2025
**Release Type**: Bug Fix Release

---

## 🐛 Critical Bug Fixes

### Packing List Print Layout Issues Fixed

This release addresses two critical bugs in the packing list print view that affected data display and readability.

---

### Bug #1: Missing NET WT. Column in TOTALS Row

**Issue**: The TOTALS footer row was missing the total net weight column, only showing gross weight and volume.

**Example**:
- **Before**: TOTALS row showed only 2 values (Gross WT. + Volume)
  ```
  TOTALS    2,380.00    8.471
           (毛重)      (体积)
  ```
- **After**: TOTALS row now shows all 3 values (Net WT. + Gross WT. + Volume)
  ```
  TOTALS    1,470.00    2,380.00    8.471
           (净重)      (毛重)      (体积)
  ```

**Root Cause**: The HTML template used `colspan="7"` which incorrectly merged the NET WT. column into the "TOTALS" label. JavaScript code already calculated `totalNet` correctly, but the HTML didn't display it.

**Fix**:
- Changed `colspan` from 7 to 6
- Added `<td data-target="pl-total-net">` to display total net weight
- Now correctly shows: NET WT. | GROSS WT. | MEAS. (CBM)

**Files Modified**:
- `index.html` (lines 799-804)
- `invoice_generator_v2.5.4.html` (lines 799-804)

---

### Bug #2: Print Pagination Issues (Content Duplication/Truncation)

**Issue**: When printing packing lists with multiple packages, page breaks could occur in the middle of table rows, causing:
- Package headers separated from their item rows
- Item descriptions being truncated or duplicated
- TOTALS row appearing orphaned on a new page
- Visual artifacts in the red-boxed area of printed PDFs

**Example**:
- **Before**: Page breaks could split package headers from items, duplicate content at page boundaries ❌
- **After**: Package headers stay with their items, clean page breaks, no content duplication ✅

**Root Cause**: No CSS page-break control rules were defined for print media, allowing browsers to arbitrarily split table content across pages.

**Fix**: Added comprehensive CSS rules in `@media print` section:
```css
/* Prevent page breaks inside table rows */
.preview-table tr {
  page-break-inside: avoid;
  break-inside: avoid;
}

/* Keep package headers with their items */
.preview-table tbody tr {
  page-break-inside: avoid;
  break-inside: avoid;
}

/* Prevent orphaned TOTALS row */
.preview-table tfoot {
  page-break-inside: avoid;
  break-inside: avoid;
}

/* Prevent breaks after package headers (semibold rows) */
.preview-table tr.font-semibold {
  page-break-after: avoid;
  break-after: avoid;
}
```

**Files Modified**:
- `index.html` (lines 2252-2274)
- `invoice_generator_v2.5.4.html` (lines 2235-2257)

---

## 📦 What's Included in This Release

### Windows Applications
- **QHD Invoice Generator Setup 2.5.4.exe** (115 MB)
  - Full installer with desktop shortcuts
  - Supports Windows 7/8/10/11 (32-bit and 64-bit)
  - Customizable installation directory

- **QHD Invoice Generator 2.5.4.exe** (115 MB)
  - Portable version - no installation required
  - Run directly from USB or network drive
  - Perfect for users without admin rights

### macOS Application
- **QHD Invoice Generator-2.5.4-mac.zip** (84 MB)
  - Compatible with Intel Macs
  - Works on Apple Silicon Macs via Rosetta 2
  - Extract and drag to Applications folder

---

## 🔄 Recent Changes (v2.5.3 → v2.5.4)

### v2.5.4 (Current)
- ✅ Fixed missing NET WT. column in packing list TOTALS row
- ✅ Fixed print pagination issues (content duplication/truncation)
- ✅ Added CSS page-break control for cleaner print layouts

### v2.5.3 (Previous)
- ✅ Fixed packing list totals calculation bug

### v2.5.2
- ✅ Simplified packing list interface
- ✅ Improved weight precision to 1 decimal place

### v2.5.1
- ✅ Fixed PDF filename auto-generation

### v2.5.0
- ✅ Fixed PDF text copy-paste functionality

---

## 💿 Installation Instructions

### Windows

**Option 1: Full Installer (Recommended)**
1. Download `QHD Invoice Generator Setup 2.5.4.exe`
2. Double-click to run the installer
3. Follow the installation wizard
4. Launch from Start Menu or Desktop shortcut

**Option 2: Portable Version**
1. Download `QHD Invoice Generator 2.5.4.exe`
2. Place in any folder
3. Double-click to run directly

**Note**: Windows may show SmartScreen warning. Click "More info" → "Run anyway"

### macOS

1. Download `QHD Invoice Generator-2.5.4-mac.zip`
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
- 🖨️ Print-optimized layouts (now with better pagination!)
- 🌐 Bilingual interface (Chinese/English)
- 📱 Works offline as desktop app

---

## 🔧 Technical Details

### Fixed Locations

**Bug #1 (TOTALS Row):**
- HTML template: lines 799-804 in both files
- Changed colspan from 7 to 6
- Added `<td data-target="pl-total-net">` element

**Bug #2 (Pagination):**
- CSS `@media print` section
- index.html: lines 2252-2274
- invoice_generator_v2.5.4.html: lines 2235-2257

### Changed Code

**Bug #1:**
```html
<!-- Before -->
<td colspan="7" ...>TOTALS</td>
<td data-target="pl-total-gross">0.00</td>
<td data-target="pl-total-volume">0.000</td>

<!-- After -->
<td colspan="6" ...>TOTALS</td>
<td data-target="pl-total-net">0.00</td>        <!-- ✅ NEW -->
<td data-target="pl-total-gross">0.00</td>
<td data-target="pl-total-volume">0.000</td>
```

**Bug #2:**
```css
/* NEW: Prevent table row splits during printing */
.preview-table tr {
  page-break-inside: avoid;
  break-inside: avoid;
}
/* ...additional rules for tbody, tfoot, headers */
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
- 🚀 v3.0 Roadmap: `ROADMAP_v3.0.md`

---

## 🙏 Credits

**Developed by**: Xuan Zhang & gazhee
**AI Assistant**: Claude Code (Anthropic)
**License**: MIT

---

## 📝 Complete Changelog

For complete version history, see [VERSION_HISTORY.md](VERSION_HISTORY.md)

### v2.5.4 - 2025-11-29
- **Fixed**: Missing NET WT. column in packing list TOTALS row (critical)
- **Fixed**: Print pagination issues causing content duplication/truncation (critical)
- **Enhanced**: Added CSS page-break controls for cleaner print layouts

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
Windows Installer: [To be generated after build]
Windows Portable:  [To be generated after build]
macOS ZIP:         [To be generated after build]
```

---

© 2024-2025 QHD Company. All rights reserved.
