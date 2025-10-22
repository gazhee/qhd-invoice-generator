const { contextBridge, ipcRenderer } = require('electron');

// Expose protected methods that allow the renderer process to use
// ipcRenderer without exposing the entire object
contextBridge.exposeInMainWorld('electron', {
  platform: process.platform,
  isElectron: true,
  // Add any IPC communication methods here if needed in the future
  onNewInvoice: (callback) => ipcRenderer.on('new-invoice', callback),
  onNewPackingList: (callback) => ipcRenderer.on('new-packing-list', callback)
});
