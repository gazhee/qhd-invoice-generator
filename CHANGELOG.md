# Changelog

All notable changes to the QHD Invoice Generator project will be documented in this file.

## [v2.5.0] - 2025-11-08

### Fixed
- **PDF text copy-paste functionality**: Fixed issue where text in generated PDF files could not be copied and pasted correctly
  - Added PDF-friendly font declarations using system fonts with proper Unicode support for both Chinese and English text
  - Disabled antialiased font smoothing in print media (`-webkit-font-smoothing: subpixel-antialiased`)
  - Added `text-rendering: optimizeLegibility` for better text selection in PDFs
  - Implemented comprehensive font stack: "Microsoft YaHei", "PingFang SC", "Heiti SC", "SimSun", Arial, "Arial Unicode MS", sans-serif
  - Applied fixes to both `index.html` (Electron app) and `invoice_generator_v2.4.html` (web version)

### Technical Details
- Modified `@media print` section (index.html:2175, invoice_generator_v2.4.html:2175): Added font-family, font-smoothing, and text-rendering properties
- Updated print view template (index.html:2110, invoice_generator_v2.4.html:2110): Added universal selector with PDF-optimized font settings
- Changed from antialiased to subpixel-antialiased font smoothing to ensure text renders as selectable text rather than vector paths
- Fonts selected for optimal PDF embedding and Chinese character support across Windows and macOS

---

## [v2.1] - 2025-10-22

### Fixed
- **HS CODE wrapping issue in print views**: HS CODE cells now display on a single line without wrapping in both invoice and packing list print outputs
  - Added `hs-code-cell` CSS class with `white-space: nowrap` to prevent line breaks
  - Reduced font size to 0.7rem for HS CODE cells to ensure proper fit
  - Adjusted padding to maximize available space
  - Applied fix to both invoice table (invoice_generator_v2.1.html:1913) and packing list table (invoice_generator_v2.1.html:1983)

### Technical Details
- Modified CSS (line 137): Added `.preview-table td.hs-code-cell` styling
- Updated invoice item rendering: Added `class="hs-code-cell"` to HS CODE table cells
- Updated packing list item rendering: Added `class="hs-code-cell text-center"` to HS CODE table cells

---

## [v2.0] - Previous Release

### Features
- Single-page PWA for creating and managing invoices and packing lists
- Support for multiple document types:
  - Standard Invoice
  - Commercial Invoice
  - Proforma Invoice
  - Packing List
- Profile management for Shipper, Consignee, and Bill-to parties
- Document revision system with alphabetical versioning (A, B, C, etc.)
- Auto-incrementing document numbers with date-based formatting
- Print-optimized layouts with automatic pagination
- Offline-capable PWA with service worker
- LocalStorage-based data persistence (no backend required)
- Bilingual interface (Chinese/English)
- Responsive design with Tailwind CSS
