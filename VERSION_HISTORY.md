# QHD Invoice Generator - Complete Version History

This document provides a comprehensive record of all versions and changes made to the QHD Invoice Generator project from inception through the current version.

---

## Version Overview

| Version | Release Date | Type | Key Changes |
|---------|--------------|------|-------------|
| v2.5.4 | 2025-11-29 | Bug Fix | Packing list TOTALS row and print pagination fixes |
| v2.5.3 | 2025-11-24 | Bug Fix | Packing list totals calculation fix |
| v2.5.2 | 2025-11-24 | Enhancement | Packing list UI simplification |
| v2.5.1 | 2025-11-08 | Bug Fix | PDF filename printing issue fix |
| v2.5.0 | 2025-11-08 | Bug Fix | PDF text copy-paste functionality fix |
| v2.4.0 | 2025-11-08 | Maintenance | File consolidation and organization |
| v2.3.0 | 2025-01-31 | Feature | Invoice-Packing data separation, price precision enhancement |
| v2.2.0 | 2025-10-30 | Feature | Table optimization, package quantity, bug fixes |
| v2.1.0 | 2025-10-22 | Bug Fix | HS CODE wrapping issue fix |
| v2.0 | 2024 | Major Release | Initial PWA version with core features |

---

## v2.5.4 - 2025-11-29

### Type
Bug Fix Release

### Summary
Fixed two critical bugs in packing list print layouts: missing NET WT. column in TOTALS row and print pagination issues causing content duplication/truncation.

### Changes

#### Fixed

**Bug #1: Missing NET WT. Column in TOTALS Row**
- **Issue**: The TOTALS footer row was missing the total net weight column
- **Before**: TOTALS row only showed 2 values (Gross WT. + Volume)
- **After**: TOTALS row now shows all 3 values (Net WT. + Gross WT. + Volume)
- **Root cause**: HTML template used `colspan="7"` which incorrectly merged the NET WT. column
- **Fix**: Changed colspan from 7 to 6, added `<td data-target="pl-total-net">` element
- **Impact**: Users can now see total net weight in printed packing lists

**Bug #2: Print Pagination Issues**
- **Issue**: Page breaks could occur in middle of table rows, causing:
  - Package headers separated from their item rows
  - Item descriptions truncated or duplicated
  - TOTALS row orphaned on new page
  - Visual artifacts in printed PDFs
- **Root cause**: No CSS page-break control rules defined for print media
- **Fix**: Added comprehensive CSS rules in `@media print` section:
  - `page-break-inside: avoid` for table rows
  - `page-break-after: avoid` for package headers
  - `break-inside: avoid` for tbody/tfoot elements
- **Impact**: Cleaner print layouts, no content duplication

#### Technical Details

**Bug #1 Modifications:**
- Files: `index.html`, `invoice_generator_v2.5.4.html`
- Lines: 799-804
- Changed HTML structure:
  ```html
  <!-- Before -->
  <td colspan="7">TOTALS</td>
  <td data-target="pl-total-gross">0.00</td>
  <td data-target="pl-total-volume">0.000</td>

  <!-- After -->
  <td colspan="6">TOTALS</td>
  <td data-target="pl-total-net">0.00</td>
  <td data-target="pl-total-gross">0.00</td>
  <td data-target="pl-total-volume">0.000</td>
  ```

**Bug #2 Modifications:**
- Files: `index.html`, `invoice_generator_v2.5.4.html`
- Lines: index.html (2252-2274), invoice_generator_v2.5.4.html (2235-2257)
- Added new CSS rules in `@media print`:
  ```css
  .preview-table tr { page-break-inside: avoid; }
  .preview-table tbody tr { break-inside: avoid; }
  .preview-table tfoot { page-break-inside: avoid; }
  .preview-table tr.font-semibold { page-break-after: avoid; }
  ```

#### Backward Compatibility
- ✅ Fully backward compatible with v2.5.3 and earlier
- ✅ No data migration required
- ✅ Existing documents display correctly

#### Files Modified
- `index.html` (Electron app) - 2 locations
- `invoice_generator_v2.5.4.html` (web version) - 2 locations
- `package.json` - version number updated

---

## v2.5.3 - 2025-11-24

### Type
Bug Fix Release

### Summary
Fixed critical bug where packing list totals were incorrectly calculated by summing orphaned DOM elements.

### Changes

#### Fixed
- **Packing list totals calculation bug**: Totals now correctly sum only visible package cards
  - Root cause: Global selector `QA('.package-card')` was capturing all package-card elements in the entire document
  - This included orphaned, hidden, or duplicate elements outside the main form container
  - Fixed by scoping selectors to only search within `items-container` element
  - Three locations fixed:
    1. Preview update totals calculation (line ~1937)
    2. Package data collection when saving revisions (line ~2450)
    3. Package renumbering after deletion (line ~2779)

#### Technical Details
- Changed from: `QA('.package-card').forEach(...)`
- Changed to: `D('items-container').querySelectorAll('.package-card').forEach(...)`
- Prevents accumulation of incorrect values from DOM elements outside the active form
- Totals now accurately reflect only the packages currently in the form

#### Example Issue
Before fix:
- 1 visible crate with weight 407 kg and volume 0.703 CBM
- TOTALS row showed: 1,007.00 kg and 11.770 CBM (incorrect)

After fix:
- 1 visible crate with weight 407 kg and volume 0.703 CBM
- TOTALS row shows: 407.00 kg and 0.703 CBM (correct)

#### Files Modified
- `index.html` (Electron app)
- `invoice_generator_v2.5.4.html` (web version)

---

## v2.5.2 - 2025-11-24

### Type
Enhancement Release

### Summary
Streamlined packing list interface by removing redundant displays while maintaining calculation accuracy.

### Changes

#### Enhanced

1. **Simplified Packing List Display**
   - Removed individual crate volume (CBM) display from form
   - Removed individual crate "Total" display (gross weight + volume per crate)
   - Volume calculation still runs automatically in background (stored in hidden input)
   - Cleaner, less cluttered interface focused on essential data entry

2. **Improved Weight Display Precision**
   - Changed gross weight display from 2 decimals to 1 decimal place
   - Applies to: form inputs, preview display, and totals
   - Format change: `407.00 KG` → `407.0 KG`
   - Better readability for typical freight weights

#### Technical Details
- Removed CBM display elements from package card UI
- Removed "Total" display showing calculated weight/volume per crate
- Volume input field changed to hidden input (still calculated and stored)
- Updated weight formatter: `toFixed(2)` → `toFixed(1)`
- Calculation logic unchanged - all math still accurate

#### Business Value
- ✅ Reduced visual clutter in packing list form
- ✅ Faster data entry (fewer fields to review)
- ✅ Weight precision matches industry standards (1 decimal for freight)
- ✅ Volume still calculated for exports/totals (just not displayed during input)

#### Backward Compatibility
- ✅ Fully compatible with existing packing list data
- ✅ Hidden volume field still saves/loads correctly
- ✅ No data migration required

#### Files Modified
- `invoice_generator_v2.5.4.html` (web version)
- `index.html` (Electron app)

---

## v2.5.1 - 2025-11-08

### Type
Bug Fix Release

### Summary
Fixed critical bug where PDF filenames could not automatically appear when printing to PDF.

### Changes

#### Fixed
- **PDF filename printing issue**: Document title now properly set for PDF generation
  - Added explicit `document.title` assignment after writing HTML to print window
  - Document title correctly reflects invoice type and full invoice number
  - When users select "Print to PDF", filename automatically uses invoice/packing list number
  - Example: "Commercial Invoice QHD-INV-20251108-01-A.pdf"

#### Technical Details
- Modified print window handler at lines 2991-2993
- Added title assignment: `printWindow.document.title = documentTitle`
- Document title format: `${invoiceType} ${fullInvoiceNo}`
- Title set after `document.close()` to ensure proper browser propagation

#### Files Modified
- `index.html` (Electron app)
- `invoice_generator_v2.4.html` (web version)
- `CHANGELOG.md`

---

## v2.5.0 - 2025-11-08

### Type
Bug Fix Release

### Summary
Fixed critical issue where text in generated PDF files could not be copied and pasted correctly.

### Changes

#### Fixed
- **PDF text copy-paste functionality**: Text now properly selectable and copyable in PDFs
  - Added PDF-friendly font declarations with proper Unicode support
  - Implemented comprehensive font stack for Chinese/English text support
  - Changed font smoothing from `antialiased` to `subpixel-antialiased`
  - Added `text-rendering: optimizeLegibility` for better text selection
  - Fonts: "Microsoft YaHei", "PingFang SC", "Heiti SC", "SimSun", Arial, "Arial Unicode MS", sans-serif

#### Technical Details
- Modified `@media print` section at line 2175
- Updated print view template at line 2110
- Added universal selector with PDF-optimized font settings
- Text now renders as selectable text rather than vector paths
- Cross-platform font support for Windows and macOS

#### Files Modified
- `index.html` (Electron app)
- `invoice_generator_v2.4.html` (web version)

---

## v2.4.0 - 2025-11-08

### Type
Maintenance Release

### Summary
File consolidation and organization update bringing together v2.2 and v2.3 features.

### Changes

#### Added
- Consolidated documentation from v2.2 and v2.3
- Added comprehensive build and release notes
- Created version comparison documentation

#### Files Added/Modified
- `BUILD_SUMMARY_v2.2.md`
- `CHANGELOG_v2.2.md`
- `CHANGELOG_v2.3.md`
- `INSTALLATION_GUIDE.md`
- `RELEASE_NOTES_v2.2.md`
- `RELEASE_SUMMARY_v2.3.0.md`
- `VERSION_COMPARISON.md`
- `WINDOWS7_BUILD_SUMMARY.md`
- `WINDOWS7_README.md`
- `WINDOWS_RELEASE_v2.3.0.md`
- `invoice_generator_v2.2.html`
- `invoice_generator_v2.3.html`
- `invoice_generator_v2.4.html`
- `index.html`
- `manifest.json`
- `package.json`

---

## v2.3.0 - 2025-01-31

### Type
Feature Release

### Summary
Major structural improvement separating invoice and packing list data, and enhancing price precision to 5 decimal places.

### Changes

#### New Features

1. **Invoice-Packing List Data Separation**
   - Invoice items no longer include packaging-related fields
   - Removed: package type, packages, dimensions, gross weight, volume
   - Invoices focus on: description, HS Code, net weight, quantity, unit price, amount
   - Packing lists retain complete packaging information
   - Cleaner data model preventing field confusion

2. **Price Precision Enhancement**
   - Unit price precision: 4 decimals → 5 decimals (0.12345)
   - Amount precision: 2 decimals → 5 decimals (123.45678)
   - Total amount calculation: 5 decimal precision
   - Input field step: 0.00001
   - Number formatter: 5 decimal places

#### Fixed
- **Total amount auto-calculation**: Added `updateItemsAndTotals()` call after adding items
- Items now automatically recalculate totals when added

#### Data Structure Changes

**Invoice Item (v2.2 → v2.3):**
```diff
{
  "description": "Product",
  "hs-code": "1234567890",
  "qty": 100,
  "uom": "PCS",
- "packageType": "Carton",
- "packages": 10,
- "dimensions": "120×80×100",
- "grossWt": "500.00",
- "volume": "0.960",
  "netWt": "450.00",
- "unitPrice": "1.2345",    // 4 decimals
- "amount": "123.45"        // 2 decimals
+ "unitPrice": "1.23456",   // 5 decimals
+ "amount": "123.45678"     // 5 decimals
}
```

**Packing List Package (unchanged):**
```json
{
  "packageType": "Carton",
  "packages": 10,
  "dimensions": "120×80×100",
  "grossWt": "50.00",
  "cbm": "0.096",
  "items": [...]
}
```

#### Backward Compatibility
- ✅ Packing lists fully compatible
- ✅ Existing packing list data requires no migration
- ⚠️ Old invoice data may contain deprecated packaging fields (ignored)
- ✅ Profile management unaffected
- ✅ Revision system works normally

#### Code Cleanup
- Removed unused variables: `packageTypeOptions`, packaging-related variables
- Removed packaging field event listeners
- Optimized `collectFormData()` for invoice items
- Simplified `addNewItem()` function logic

#### Files Modified
- `invoice_generator_v2.3.html`
- `index.html`
- `package.json`

---

## v2.2.0 - 2025-10-30

### Type
Feature Release

### Summary
Major update optimizing table layouts, adding package quantity functionality, and fixing critical bugs.

### Changes

#### New Features

1. **Table Column Width Optimization**
   - Fixed number wrapping issue in NET WT. and QTY. columns
   - Reduced DESCRIPTION column width to provide more space for numbers
   - Font size reduced: 0.75rem → 0.7rem

**Invoice Table Column Adjustments:**
| Column | v2.1 | v2.2 | Change |
|--------|------|------|--------|
| # | 5% | 4% | -1% |
| DESCRIPTION | 45% | 32% | -13% |
| HS CODE | 12% | 11% | -1% |
| NET WT. | 8% | 10% | +2% |
| QTY. | 8% | 12% | +4% |
| UOM | 8% | 7% | -1% |
| UNIT PRICE | 10% | 10% | 0% |
| AMOUNT | 14% | 14% | 0% |

**Packing List Table Column Adjustments:**
| Column | v2.1 | v2.2 | Change |
|--------|------|------|--------|
| # | 4% | 4% | 0% |
| DESCRIPTION | 32% | 26% | -6% |
| HS CODE | 10% | 10% | 0% |
| QTY. | 8% | 12% | +4% |
| UOM | 6% | 6% | 0% |
| DIMS (cm) | 12% | 12% | 0% |
| NET WT. | 9% | 10% | +1% |
| GROSS WT. | 9% | 10% | +1% |
| MEAS. (CBM) | 10% | 10% | 0% |

2. **Package Quantity Feature**
   - Added "Quantity" field for each package (default: 1)
   - Added "Total" display showing aggregated gross weight and volume
   - Label improvements: "毛重" → "单箱毛重", "体积" → "单箱体积"
   - Real-time calculation: Total Gross Weight = Unit Weight × Quantity
   - Real-time calculation: Total Volume = Unit Volume × Quantity
   - Package header shows quantity: "Carton (5 packages)"
   - Print view displays calculated totals

**New Package Card Layout:**
```
📦 包装 Package #1                          [✖]
┌────────────────────────────────────────────┐
│ [Qty: 5] [Type: Carton▼] [Dims: 120×80×100] [Unit GW: 50.00]
│ [Unit Vol: 0.960 CBM] [Total: GW 250.00 KG | Vol 4.800 CBM]
│ Items in this Package:
│ ...
└────────────────────────────────────────────┘
```

**Business Value:**
- ✅ Reduce repetitive operations (5 identical boxes = 1 package entry)
- ✅ Matches real business practices (export often has multiple identical packages)
- ✅ Automatic calculation prevents manual errors
- ✅ Data persisted in localStorage
- ✅ Historical data correctly restored

#### Fixed
- **Document mode switching while locked**: Users can now switch between invoice and packing list modes even when form is locked
  - Added exception rule in `setEditingLocked()` for document-mode radio buttons
  - Switching automatically unlocks form and resets revision state
  - Data independence maintained

#### Technical Details

**CSS Changes:**
```css
.preview-table {
    font-size: 0.7rem; /* from 0.75rem */
}
```

**JavaScript Changes:**
1. `addNewPackage()` - Added packages field and total display
2. `updateItemsAndTotals()` - Modified to multiply by packages quantity
3. `collectFormData()` - Added packages field persistence
4. `setEditingLocked()` - Added document-mode exception:
   ```javascript
   // Allow document-mode switching even when locked
   if (el.name === 'document-mode') return;
   ```

#### Data Compatibility
- ✅ Fully backward compatible with v2.1 and v2.0 data
- ✅ Old package data automatically sets packages = 1
- ✅ Existing saved revisions unaffected

#### Files Modified
- `invoice_generator_v2.2.html`
- `manifest.json`
- `sw.js`

---

## v2.1.0 - 2025-10-22

### Type
Bug Fix Release

### Summary
Fixed critical HS CODE wrapping issue in print views.

### Changes

#### Fixed
- **HS CODE wrapping in print views**: HS CODE cells now display on single line without wrapping
  - Added `hs-code-cell` CSS class with `white-space: nowrap`
  - Reduced font size to 0.7rem for optimal fit
  - Adjusted padding to maximize available space
  - Applied to both invoice and packing list tables

#### Technical Details
- Modified CSS at line 137:
  ```css
  .preview-table td.hs-code-cell {
      white-space: nowrap;
      font-size: 0.7rem;
  }
  ```
- Updated invoice item rendering at line 1913: Added `class="hs-code-cell"`
- Updated packing list item rendering at line 1983: Added `class="hs-code-cell text-center"`

#### Files Modified
- `invoice_generator_v2.1.html`

---

## v2.0 - 2024

### Type
Major Release - Initial PWA Version

### Summary
Initial release of QHD Invoice Generator as a Progressive Web Application.

### Core Features

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
- Profile storage: `invoiceShippers_v3`, `invoiceConsignees_v1`, `invoiceBillTo_v1`
- Document storage: `invoice_<coreId>` with multiple revisions
- Sequence tracking: `invoice_seq_<YYYYMMDD>_<docType>`, `packing_seq_<YYYYMMDD>`

#### Print Features
- Print-optimized layouts
- Automatic multi-page pagination
- Computer-generated label: "This is a computer-generated invoice and requires no signature"
- Opens in new window for printing

#### Technical Stack
- Single-page PWA application
- Monolithic single-file architecture (~2900 lines)
- Tailwind CSS for styling
- Service worker for offline capability
- No backend required
- Bilingual interface (Chinese/English)

#### Business Rules
- Date-based invoice number generation with manual override support
- Auto-calculation of totals with manual override capability
- Independent shipper and bill-to information (no auto-mapping)
- Computer-generated label on all printed documents

#### Files Structure
- `invoice_generator_v2.0.html` - Main application file
  - Lines 1-733: HTML structure
  - Lines 734-2183: JavaScript application logic
  - Lines 2184-2915: Print view generation
  - Lines 2916-2930: Service worker registration
- `manifest.json` - PWA manifest
- `sw.js` - Service worker
- `icon-192.png`, `icon-512.png`, `icon.svg` - PWA icons
- `features.md` - Requirements document (Chinese)
- `USER_MANUAL.md` - User documentation (bilingual)

---

## Development Timeline

```
2024
  └─ v2.0 ────────────── Initial PWA Release

2025-10-22
  └─ v2.1.0 ──────────── HS CODE Wrap Fix

2025-10-30
  └─ v2.2.0 ──────────── Table Optimization + Package Quantity

2025-01-31
  └─ v2.3.0 ──────────── Data Separation + Price Precision

2025-11-08
  ├─ v2.4.0 ──────────── File Consolidation
  ├─ v2.5.0 ──────────── PDF Copy-Paste Fix
  └─ v2.5.1 ──────────── PDF Filename Fix

2025-11-24
  ├─ v2.5.2 ──────────── Packing List UI Simplification
  └─ v2.5.3 ──────────── Packing List Totals Fix

2025-11-29
  └─ v2.5.4 ──────────── TOTALS Row + Print Pagination Fixes (CURRENT)
```

---

## Current Active Files

As of v2.5.4, the following are the active application files:

### Production Files
- `invoice_generator_v2.5.4.html` - Latest web version (v2.5.4)
- `index.html` - Latest Electron version (v2.5.4)

### Archived Version Files (Historical Reference Only)
- `invoice_generator_v2.0.html` - v2.0 baseline
- `invoice_generator_v2.1.html` - v2.1 with HS CODE fix
- `invoice_generator_v2.2.html` - v2.2 with table optimization
- `invoice_generator_v2.3.html` - v2.3 with data separation
- `invoice_generator_v2.4.html` - v2.4 with file consolidation

### Support Files
- `manifest.json` - PWA manifest
- `sw.js` - Service worker
- `main.js` - Electron main process
- `preload.js` - Electron preload script
- `package.json` - Project configuration

---

## Migration Notes

### Upgrading Between Versions

**v2.0 → v2.1:**
- Automatic, no data migration needed
- HS CODE display improved

**v2.1 → v2.2:**
- Automatic, no data migration needed
- Old packages get default quantity = 1
- Table layouts auto-adjust

**v2.2 → v2.3:**
- Automatic for packing lists
- Invoice data: packaging fields ignored (no impact)
- Recommend re-confirming invoice revisions

**v2.3 → v2.4:**
- Automatic, no changes needed

**v2.4 → v2.5.0:**
- Automatic, no data migration needed
- PDF text now properly copyable

**v2.5.0 → v2.5.1:**
- Automatic, no data migration needed
- PDF filenames now auto-generated

**v2.5.1 → v2.5.2:**
- Automatic, no data migration needed
- Packing list UI simplified (volume still calculated)

**v2.5.2 → v2.5.3:**
- Automatic, no data migration needed
- Packing list totals now calculate correctly

**v2.5.3 → v2.5.4:**
- Automatic, no data migration needed
- TOTALS row now displays total net weight
- Print layouts improved (no content duplication)

### Data Compatibility Matrix

| Version | v2.0 | v2.1 | v2.2 | v2.3 | v2.4 | v2.5.0 | v2.5.1 | v2.5.2 | v2.5.3 | v2.5.4 |
|---------|------|------|------|------|------|--------|--------|--------|--------|--------|
| v2.0 data | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| v2.1 data | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| v2.2 data | ✅ | ✅ | ✅ | ⚠️* | ⚠️* | ⚠️* | ⚠️* | ⚠️* | ⚠️* | ⚠️* |
| v2.3 data | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| v2.4 data | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| v2.5.0 data | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| v2.5.1 data | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| v2.5.2 data | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| v2.5.3 data | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| v2.5.4 data | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

*⚠️ v2.2 invoice data may contain packaging fields which are ignored in v2.3+

---

## Contributors

- **Xuan Zhang** (xuan.zhang@qhdpv.com) - Product Owner, Requirements, Testing
- **gazhee** - Development, Implementation
- **Claude Code** - AI Assistant, Documentation, Implementation Support

---

## Document Information

**Created**: 2025-11-08
**Last Updated**: 2025-11-29
**Current Version**: v2.5.4
**Purpose**: Complete historical record of all version changes

---

© 2024-2025 QHD Company. All rights reserved.
