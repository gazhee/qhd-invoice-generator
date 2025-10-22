# Changelog

All notable changes to the QHD Invoice Generator project will be documented in this file.

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
