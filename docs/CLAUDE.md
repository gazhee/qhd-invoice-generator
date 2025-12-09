# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

QHD Invoice Generator is a software for creating and managing commercial invoices, proforma invoices, and packing lists.

**Key characteristic**: This is a monolithic single-file application (`src/index.html`) containing all HTML, CSS, and JavaScript in one ~2900 line file.

## Running the Application

### Development Server

**macOS/Linux:**
```bash
scripts/install.command
# Or manually:
python3 -m http.server 8080
# Then open: http://localhost:8080/src/index.html
```

**Windows:**
```cmd
scripts\install.bat
# Or manually:
python -m http.server 8080
# Then open: http://localhost:8080/src/index.html
```

The application requires a web server (cannot be opened as `file://`) due to service worker and PWA requirements.

### PWA Installation

Users can install as a desktop/mobile app via browser's "Install" button when accessing through HTTP(S).

## Architecture

### Project Structure

```
invoice_generator/
├── src/                      # Application source code
│   ├── index.html           # Main application (~2900 lines)
│   ├── manifest.json        # PWA manifest
│   └── sw.js                # Service worker
├── electron/                 # Electron desktop app
│   ├── main.js              # Main process
│   └── preload.js           # Preload script
├── assets/                   # Static resources
│   └── icons/               # App icons
├── scripts/                  # Install/build scripts
│   ├── install.command      # macOS installer
│   └── install.bat          # Windows installer
├── docs/                     # Documentation
└── package.json
```

### Single-File Structure

The entire application is contained in `src/index.html`:
- **Lines 1-733**: HTML structure with Tailwind CSS styling
- **Lines 734-2183**: Main JavaScript application logic
- **Lines 2184-2915**: Print view generation logic
- **Lines 2916-2930**: Service worker registration

### Data Storage Pattern

All data is stored in browser localStorage with specific key patterns:

- **Profiles (Templates)**:
  - `invoiceShippers_v3`: Shipper information profiles
  - `invoiceConsignees_v1`: Consignee information profiles
  - `invoiceBillTo_v1`: Bill-to party information profiles

- **Document Revisions**:
  - Format: `invoice_<coreId>` where coreId is the invoice/packing list number
  - Each key stores an object with multiple revision versions (A, B, C, etc.)
  - Example: `invoice_QHD-INV-20240102-01` contains all revisions for that document

- **Sequence Tracking**:
  - Format: `invoice_seq_<YYYYMMDD>_<docType>` or `packing_seq_<YYYYMMDD>`
  - Tracks auto-incrementing sequence numbers per date and document type

### Document Modes

The application operates in two modes controlled by radio buttons:

1. **Invoice Mode** (`document-mode="invoice"`):
   - Sub-types: Standard Invoice, Commercial Invoice, Proforma Invoice
   - Fields: Invoice number, date, order number, line items with pricing
   - Auto-generates invoice numbers: `QHD-INV-YYYYMMDD-NN-V`

2. **Packing List Mode** (`document-mode="packing"`):
   - Package-based structure with items nested within packages
   - Fields: Package type, dimensions, weight, CBM calculations
   - Auto-generates packing list numbers: `QHD-PL-YYYYMMDD-NN-V`

### Revision System

Documents use a two-level versioning system:
- **Core ID**: Base identifier (e.g., `QHD-INV-20240102-01`)
- **Revision Letters**: A, B, C, etc. for each confirmed version
- Users must "Confirm Revision" (Step 1) before generating print view (Step 2)
- Form is locked after confirmation; users click "Start New Revision" to create next version

### Key JavaScript Functions

- `getDocumentMode()`: Returns 'invoice' or 'packing'
- `confirmActiveRevision()`: Saves current form state as new revision
- `saveRevisionToLocalStorage(coreId, revisionKey, dataObj)`: Stores revision
- `getNextSequenceForDateSegment(segment, docType)`: Auto-increment logic
- `ProfileManager`: Object with methods to manage shipper/consignee/billto profiles
- `populateSavedInvoices()`: Scans localStorage for existing documents (used in packing list reference field)
- `generatePrintableHTML(html)`: Opens new window with print-optimized layout

### Profile Management System

Three independent profile managers (modals) for:
1. Shipper (发货方) - includes bank details
2. Consignee (收货人)
3. Bill To (付款方)

Each has add/edit/delete functionality with dropdown selection in main form. Profiles have a display name and address/details fields.

## Important Business Rules

1. **Invoice Number Generation**: Defaults to date-based format but manual override is allowed
2. **Price Calculation**: Auto-calculates totals but supports manual override
3. **No Auto-Mapping**: Shipper and Bill-to information remain independent (no automatic linking)
4. **Computer-Generated Label**: All printed documents include "This is a computer-generated invoice and requires no signature"
5. **Pagination**: Print view automatically handles multi-page documents

## Supporting Files

- `src/manifest.json`: PWA manifest defining app name, icons, shortcuts
- `src/sw.js`: Service worker for offline caching (caches HTML, manifest, icons)
- `assets/icons/`: App icons (icon-192.png, icon-512.png, icon.svg)
- `docs/features.md`: Chinese requirements document (all requirements marked complete)
- `docs/USER_MANUAL.md`: Bilingual (Chinese/English) end-user documentation

## Development Notes

### Modifying the Application

Since this is a single-file application, all changes go into `src/index.html`:
- HTML structure changes: Lines 1-733
- Form logic and data handling: Lines 734-2183
- Print layout generation: Lines 2184-2915

### Helper Functions

The codebase defines three shorthand DOM selectors at the top of the script:
```javascript
const D = id => document.getElementById(id);
const Q = sel => document.querySelector(sel);
const QA = sel => document.querySelectorAll(sel);
```

### Tailwind CSS

The application uses Tailwind CSS via CDN. All styling is inline using Tailwind utility classes.

### LocalStorage Data Model

When reading/writing data, be aware:
- Profile objects: `{ profileName: { name, address, [bank] } }`
- Revision objects: `{ revisionKey: { ...formData } }`
- Always use JSON.parse/stringify when accessing localStorage

### Testing Changes

1. Start the local server
2. Open browser DevTools → Application → Local Storage to inspect data
3. Clear localStorage during testing: `localStorage.clear()` in console
4. Test PWA features require HTTPS or localhost
5. Test print view in Step 2 opens in new tab (popup blocker may interfere)

## Bilingual Content

The application interface is bilingual (Chinese/English). When modifying labels or adding features, maintain both languages in the format: `中文 English`.
