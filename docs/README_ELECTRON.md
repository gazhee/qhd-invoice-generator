# QHD Invoice Generator - Electron Desktop App

Desktop application version of the QHD Invoice Generator, built with Electron.

## Features

- Native desktop application for Windows and macOS
- All features from the web version
- Offline-first with local data storage
- Native menu bar and keyboard shortcuts
- No internet connection required

## Development

### Prerequisites

- Node.js (v16 or higher)
- npm or yarn

### Installation

```bash
# Install dependencies
npm install
```

### Running in Development

```bash
# Start the app in development mode
npm start
```

## Building

### Build for Current Platform

```bash
# Build for your current OS
npm run build
```

### Build for Specific Platform

```bash
# Build for Windows only
npm run build:win

# Build for macOS only
npm run build:mac
```

### Build Output

Built applications will be in the `dist/` folder:

- **Windows**: `dist/QHD Invoice Generator Setup 2.0.0.exe` (installer) and portable .exe
- **macOS**: `dist/QHD Invoice Generator-2.0.0.dmg` (installer) and .app bundle

## Application Structure

```
.
├── main.js          # Electron main process
├── preload.js       # Preload script for secure IPC
├── index.html       # Application UI (copied from invoice_generator_v2.0.html)
├── package.json     # Node.js dependencies and build config
└── dist/            # Build output (generated)
```

## Keyboard Shortcuts

- **Ctrl/Cmd + N**: New Invoice
- **Ctrl/Cmd + Shift + N**: New Packing List
- **Ctrl/Cmd + P**: Print
- **Ctrl/Cmd + Q**: Quit Application

## Data Storage

All data is stored locally using browser localStorage API (same as web version). Data location:

- **Windows**: `%APPDATA%\qhd-invoice-generator\`
- **macOS**: `~/Library/Application Support/qhd-invoice-generator/`

## Notes

- The original web version (`invoice_generator_v2.0.html`) remains unchanged and can still be used as a PWA
- Service worker is disabled in Electron (not needed for desktop apps)
- All existing functionality and data persistence works identically to the web version

## Developer

**Xuan Zhang**
Email: xuan.zhang@qhdpv.com

## Version

2.0.0
