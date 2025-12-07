# Changelog

All notable changes to the QHD Invoice Generator project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [3.0.1] - 2025-12-07

### Changed
- Updated manifest.json to use `index.html` instead of versioned HTML file references
- Project cleanup and maintenance release

### Removed
- Deleted outdated file `invoice_generator_v2.5.4.html` (consolidated into `index.html`)
- Deleted outdated release notes: `RELEASE_NOTES_v2.5.3.md`, `RELEASE_NOTES_v2.5.4.md`
- Deleted `ROADMAP_v3.0.md` (outdated planning document for unrealized features)
- Removed `dist/` build artifacts (should be regenerated on build)

---

## [3.0.0] - 2025-12-03

### Added
- **Electron native PDF generation**: Replaced browser `window.print()` with Electron's native PDF export
- **Unified PDF export**: Consistent PDF generation behavior across Windows and macOS platforms
- **Edit historical revisions**: Users can now edit previously saved revisions instead of being locked out

### Fixed
- **PL mode field visibility**: Fixed bug where Commercial Invoice-only fields incorrectly appeared in Packing List mode
- **Print pagination**: Table headers now correctly appear on all pages when printing multi-page documents

### Changed
- **PL weight/CBM calculations**: Improved packing list weight and volume calculation logic
- **PL terminology**: Renamed "Unit Gross WT" to "Total Gross WT" in packing lists for clarity

### Removed
- Removed `setEditingLocked()` function - all revisions are now editable

---

## [2.5.4] - 2025-11-29

### Fixed
- **Packing list TOTALS row**: Added missing NET WT. column to totals footer
  - Before: TOTALS row only showed 2 values (Gross WT. + Volume)
  - After: TOTALS row shows all 3 values (Net WT. + Gross WT. + Volume)
  - Root cause: HTML template used incorrect `colspan="7"`, changed to `colspan="6"`
- **Print pagination issues**: Added CSS page-break control rules to prevent content duplication
  - Package headers no longer separated from their item rows
  - Item descriptions no longer truncated or duplicated across pages
  - TOTALS row no longer orphaned on new page
  - Added: `page-break-inside: avoid`, `page-break-after: avoid`, `break-inside: avoid`

---

## [2.5.3] - 2025-11-24

### Fixed
- **Packing list totals calculation**: Fixed critical bug where totals incorrectly summed orphaned DOM elements
  - Root cause: Global selector `QA('.package-card')` captured hidden/duplicate elements outside main form
  - Fix: Scoped selectors to only search within `items-container` element
  - Three locations fixed: preview updates, revision saving, package renumbering
  - Example: 1 crate with 407 kg now correctly shows 407 kg total (not 1,007 kg)

---

## [2.5.2] - 2025-11-24

### Changed
- **Simplified packing list display**: Removed individual crate volume (CBM) display from form
  - Volume calculation still runs automatically in background (stored in hidden input)
  - Removed individual crate "Total" display (gross weight + volume per crate)
  - Cleaner, less cluttered interface focused on essential data entry
- **Improved weight precision**: Changed gross weight display from 2 decimals to 1 decimal place
  - Format change: `407.00 KG` → `407.0 KG`
  - Better readability for typical freight weights

---

## [2.5.1] - 2025-11-08

### Fixed
- **PDF filename printing**: Document title now properly set for PDF generation
  - Added explicit `document.title` assignment after writing HTML to print window
  - When users select "Print to PDF", filename automatically uses invoice/packing list number
  - Example: "Commercial Invoice QHD-INV-20251108-01-A.pdf"

---

## [2.5.0] - 2025-11-08

### Fixed
- **PDF text copy-paste**: Text in generated PDFs now properly selectable and copyable
  - Added PDF-friendly font declarations with proper Unicode support
  - Implemented comprehensive font stack for Chinese/English text support
  - Changed font smoothing from `antialiased` to `subpixel-antialiased`
  - Added `text-rendering: optimizeLegibility` for better text selection
  - Font stack: "Microsoft YaHei", "PingFang SC", "Heiti SC", "SimSun", Arial, "Arial Unicode MS", sans-serif

---

## [2.4.0] - 2025-11-08

### Changed
- **File consolidation**: Maintenance release bringing together v2.2 and v2.3 features
- **Documentation**: Added comprehensive build and release notes
- Created version comparison documentation

---

## [2.3.0] - 2025-01-31

### Added
- **Invoice-Packing List data separation**: Invoice items no longer include packaging-related fields
  - Invoices focus on: description, HS Code, net weight, quantity, unit price, amount
  - Packing lists retain complete packaging information
  - Cleaner data model preventing field confusion

### Changed
- **Price precision enhancement**: Increased decimal precision for financial accuracy
  - Unit price: 4 decimals → 5 decimals (e.g., 0.12345)
  - Amount: 2 decimals → 5 decimals (e.g., 123.45678)
  - Total amount calculation: 5 decimal precision
  - Input field step: 0.00001

### Fixed
- **Total amount auto-calculation**: Added `updateItemsAndTotals()` call after adding items
  - Items now automatically recalculate totals when added

### Removed
- Removed packaging fields from invoice items: package type, packages, dimensions, gross weight, volume
- Removed unused variables: `packageTypeOptions`, packaging-related variables
- Optimized `collectFormData()` and `addNewItem()` functions

---

## [2.2.0] - 2025-10-30

### Added
- **Package quantity feature**: Added "Quantity" field for each package (default: 1)
  - Added "Total" display showing aggregated gross weight and volume
  - Real-time calculation: Total Gross Weight = Unit Weight × Quantity
  - Real-time calculation: Total Volume = Unit Volume × Quantity
  - Package header shows quantity: "Carton (5 packages)"
  - Reduces repetitive operations (5 identical boxes = 1 package entry)

### Changed
- **Table column width optimization**: Fixed number wrapping in NET WT. and QTY. columns
  - Reduced DESCRIPTION column width to provide more space for numeric columns
  - Font size reduced: 0.75rem → 0.7rem
  - Invoice DESCRIPTION: 45% → 32% (-13%)
  - Invoice NET WT.: 8% → 10% (+2%)
  - Invoice QTY.: 8% → 12% (+4%)
  - Packing list DESCRIPTION: 32% → 26% (-6%)
  - Packing list QTY.: 8% → 12% (+4%)

### Fixed
- **Document mode switching**: Users can now switch between invoice and packing list modes even when form is locked
  - Added exception rule in `setEditingLocked()` for document-mode radio buttons
  - Switching automatically unlocks form and resets revision state

---

## [2.1.0] - 2025-10-22

### Added
- **Electron desktop packaging**: Application now available as native desktop app
- Windows build support with NSIS installer

### Fixed
- **HS CODE wrapping in print views**: HS CODE cells now display on single line without wrapping
  - Added `hs-code-cell` CSS class with `white-space: nowrap`
  - Reduced font size to 0.7rem for optimal fit
  - Adjusted padding to maximize available space

---

## [2.0.0] - 2024

### Added
Initial release of QHD Invoice Generator as a Progressive Web Application (PWA).

#### Document Types
- Standard Invoice
- Commercial Invoice
- Proforma Invoice
- Packing List

#### Profile Management
- Shipper (发货方) profiles with bank details
- Consignee (收货人) profiles
- Bill To (付款方) profiles
- Add/Edit/Delete functionality for all profile types
- Dropdown selection in main form

#### Document Management
- Revision system with alphabetical versioning (A, B, C, etc.)
- Two-level versioning: Core ID + Revision letter
- "Confirm Revision" workflow (Step 1)
- "Generate Print View" (Step 2)
- Form locking after confirmation
- "Start New Revision" to create next version

#### Auto-numbering
- Date-based invoice numbers: `QHD-INV-YYYYMMDD-NN-V`
- Date-based packing list numbers: `QHD-PL-YYYYMMDD-NN-V`
- Sequence tracking per date and document type
- Manual override allowed

#### Data Management
- LocalStorage-based persistence (no backend required)
- Profile storage with versioned keys
- Document storage with multiple revisions per core ID
- Sequence tracking with date-based keys

#### Print Features
- Print-optimized layouts
- Automatic multi-page pagination
- Computer-generated label on all documents
- Opens in new window for printing

#### Technical Stack
- Single-page PWA application
- Monolithic single-file architecture (~2900 lines)
- Tailwind CSS for styling
- Service worker for offline capability
- No backend required
- Bilingual interface (Chinese/English)

---

## Version Timeline

```
2024-xx-xx  v2.0.0   Initial PWA Release
2025-10-22  v2.1.0   HS CODE Fix + Electron Desktop
2025-10-30  v2.2.0   Table Optimization + Package Quantity
2025-01-31  v2.3.0   Data Separation + Price Precision
2025-11-08  v2.4.0   File Consolidation
2025-11-08  v2.5.0   PDF Copy-Paste Fix
2025-11-08  v2.5.1   PDF Filename Fix
2025-11-24  v2.5.2   Packing List UI Simplification
2025-11-24  v2.5.3   Packing List Totals Fix
2025-11-29  v2.5.4   TOTALS Row + Print Pagination Fixes
2025-12-03  v3.0.0   Electron PDF + Edit Historical Revisions
2025-12-07  v3.0.1   Project Cleanup (current)
```

---

## Contributors

- **Xuan Zhang** (xuan.zhang@qhdpv.com) - Product Owner, Requirements, Testing
- **gazhee** - Development, Implementation

---

© 2024-2025 QHD Company. All rights reserved.
