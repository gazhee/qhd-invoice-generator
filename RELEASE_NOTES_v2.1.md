# QHD Invoice Generator v2.1.0 - Release Notes

**Release Date:** October 22, 2025

## What's New in v2.1.0

### Bug Fixes
- **Fixed HS CODE wrapping issue**: HS CODE cells in both invoices and packing lists now display on a single line without wrapping in print views
  - Applied `white-space: nowrap` styling to prevent line breaks
  - Reduced font size to 0.7rem for better fit
  - Optimized cell padding for maximum space utilization

### Technical Details
- Added `.hs-code-cell` CSS class with specialized styling
- Updated table cell rendering for both invoice and packing list modes
- Maintains print quality and professional appearance

---

## Download & Installation

### Windows

**Installer (Recommended):**
- File: `QHD Invoice Generator Setup 2.1.0.exe` (73 MB)
- Features: Full installation wizard with desktop shortcut
- Installation location can be customized

**Portable Version:**
- File: `QHD Invoice Generator 2.1.0.exe` (73 MB)
- No installation required
- Can run directly from USB drive or any folder

### macOS

**Intel Macs (x64):**
- DMG: `QHD Invoice Generator-2.1.0.dmg` (94 MB)
- ZIP: `QHD Invoice Generator-2.1.0-mac.zip` (91 MB)

**Apple Silicon Macs (M1/M2/M3 - arm64):**
- DMG: `QHD Invoice Generator-2.1.0-arm64.dmg` (89 MB)
- ZIP: `QHD Invoice Generator-2.1.0-arm64-mac.zip` (86 MB)

### Installation Instructions

#### Windows
1. Download `QHD Invoice Generator Setup 2.1.0.exe`
2. Run the installer
3. Follow the setup wizard
4. Launch from desktop shortcut or Start menu

#### macOS
1. Download the appropriate DMG file for your Mac
2. Open the DMG file
3. Drag "QHD Invoice Generator" to Applications folder
4. Launch from Applications

**Note:** On first launch, macOS may show a security warning because the app is not signed with an Apple Developer certificate. To open:
- Right-click the app and select "Open"
- Click "Open" in the security dialog

---

## System Requirements

### Windows
- Windows 10 or later
- 64-bit processor
- 150 MB disk space

### macOS
- macOS 10.12 (Sierra) or later
- Intel or Apple Silicon processor
- 150 MB disk space

---

## Features

- **Multiple Document Types:**
  - Standard Invoice
  - Commercial Invoice
  - Proforma Invoice
  - Packing List

- **Profile Management:**
  - Save and reuse Shipper information
  - Save and reuse Consignee information
  - Save and reuse Bill-to information

- **Document Revision System:**
  - Alphabetical versioning (A, B, C, etc.)
  - Revision history tracking
  - Load and compare previous revisions

- **Auto-Generation:**
  - Date-based document numbering
  - Sequential numbering per day
  - Automatic calculations for totals

- **Print-Optimized:**
  - Professional print layouts
  - Automatic pagination
  - Print-ready formatting

- **Data Persistence:**
  - All data saved locally
  - No internet connection required
  - Privacy-focused (no cloud storage)

- **Bilingual Interface:**
  - Chinese/English labels throughout
  - Suitable for international trade

---

## Build Information

- **Version:** 2.1.0
- **Build Date:** October 22, 2025
- **Electron Version:** 28.3.3
- **Node.js Version:** Built with electron-builder 24.13.3

---

## Previous Releases

### v2.0.0
- Initial public release
- Single-page PWA architecture
- Full feature set for invoice and packing list generation

---

## Support

For issues, questions, or feature requests:
- Contact: Xuan Zhang (xuan.zhang@qhdpv.com)
- Check the User Manual: `USER_MANUAL.md`

---

## License

MIT License

Copyright (c) 2025 QHD Company

---

**Download Location:**
All build files are located in: `dist/`
