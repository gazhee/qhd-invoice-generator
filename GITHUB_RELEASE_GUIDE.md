# GitHub Release 创建指南 / GitHub Release Guide

本文档说明如何在GitHub上创建v2.5.3版本的Release并上传应用程序供用户下载。

This document explains how to create a v2.5.3 release on GitHub and upload the applications for users to download.

---

## 📋 准备工作 / Prerequisites

✅ 已完成 / Completed:
- [x] 代码已提交 / Code committed
- [x] 版本号已更新 / Version numbers updated
- [x] Git tag已创建并推送 / Git tag created and pushed (v2.5.3)
- [x] 构建文件已生成 / Build files generated

📦 待上传文件 / Files to Upload:
位于 / Located in: `dist/` 目录
1. `QHD Invoice Generator Setup 2.5.3.exe` (115 MB) - Windows安装程序
2. `QHD Invoice Generator 2.5.3.exe` (115 MB) - Windows便携版
3. `QHD Invoice Generator-2.5.3-mac.zip` (84 MB) - macOS应用

---

## 🚀 方法一: 使用GitHub网页界面 / Method 1: Using GitHub Web Interface

### 步骤 / Steps:

1. **访问GitHub仓库 / Visit GitHub Repository**
   ```
   https://github.com/gazhee/qhd-invoice-generator
   ```

2. **进入Releases页面 / Navigate to Releases**
   - 点击右侧边栏的 "Releases" / Click "Releases" in the right sidebar
   - 或者直接访问 / Or go directly to:
     ```
     https://github.com/gazhee/qhd-invoice-generator/releases
     ```

3. **创建新Release / Create New Release**
   - 点击 "Draft a new release" 按钮 / Click "Draft a new release" button

4. **选择Tag / Choose Tag**
   - 在 "Choose a tag" 下拉菜单中选择 `v2.5.3` / Select `v2.5.3` from "Choose a tag" dropdown
   - Tag应该已经存在（刚才推送的）/ Tag should already exist (just pushed)

5. **填写Release标题 / Fill Release Title**
   ```
   QHD Invoice Generator v2.5.3
   ```

6. **填写Release描述 / Fill Release Description**
   - 复制 `RELEASE_NOTES_v2.5.3.md` 的内容 / Copy content from `RELEASE_NOTES_v2.5.3.md`
   - 或者使用以下简化版本 / Or use the simplified version below:

   ```markdown
   ## 🐛 Bug Fix Release

   Fixed critical bug where packing list totals were incorrectly calculated by summing orphaned DOM elements.

   ### What's Fixed
   - ✅ Packing list totals now calculate correctly
   - ✅ Only visible package cards are counted in totals
   - ✅ Example: 1 crate (407 kg) now shows 407 kg in totals (was incorrectly 1,007 kg)

   ### Downloads

   **Windows:**
   - `QHD Invoice Generator Setup 2.5.3.exe` - Full installer (recommended)
   - `QHD Invoice Generator 2.5.3.exe` - Portable version (no installation)

   **macOS:**
   - `QHD Invoice Generator-2.5.3-mac.zip` - Intel Macs (works on Apple Silicon via Rosetta 2)

   ### Installation

   **Windows**: Download and run the installer. Windows may show SmartScreen warning - click "More info" → "Run anyway"

   **macOS**: Extract ZIP, drag to Applications, right-click → Open on first launch

   ### Recent Changes (v2.5.2 included)
   - Simplified packing list interface
   - Improved weight precision (1 decimal place)
   - Fixed PDF filename and text copy-paste (v2.5.0-2.5.1)

   **Full changelog**: [VERSION_HISTORY.md](https://github.com/gazhee/qhd-invoice-generator/blob/main/VERSION_HISTORY.md)
   ```

7. **上传构建文件 / Upload Build Files**
   - 拖拽或点击 "Attach binaries" 上传以下文件 / Drag or click "Attach binaries" to upload:
     * `QHD Invoice Generator Setup 2.5.3.exe`
     * `QHD Invoice Generator 2.5.3.exe`
     * `QHD Invoice Generator-2.5.3-mac.zip`

   提示：文件上传可能需要几分钟 / Note: Upload may take a few minutes

8. **设置为最新版本 / Set as Latest Release**
   - ✅ 勾选 "Set as the latest release" / Check "Set as the latest release"
   - ⚠️ 不要勾选 "Set as a pre-release" / Do NOT check "Set as a pre-release"

9. **发布 / Publish**
   - 点击 "Publish release" 按钮 / Click "Publish release" button

---

## 🖥️ 方法二: 使用GitHub CLI (可选) / Method 2: Using GitHub CLI (Optional)

如果安装了GitHub CLI工具，可以使用命令行创建：
If you have GitHub CLI installed, you can create via command line:

### 安装GitHub CLI / Install GitHub CLI:
```bash
# macOS
brew install gh

# 登录 / Login
gh auth login
```

### 创建Release / Create Release:
```bash
cd /Users/gazh/Library/CloudStorage/OneDrive-Personal/QHD/Automation/invoice_generator

gh release create v2.5.3 \
  --title "QHD Invoice Generator v2.5.3" \
  --notes-file RELEASE_NOTES_v2.5.3.md \
  "dist/QHD Invoice Generator Setup 2.5.3.exe" \
  "dist/QHD Invoice Generator 2.5.3.exe" \
  "dist/QHD Invoice Generator-2.5.3-mac.zip"
```

---

## ✅ 验证Release / Verify Release

Release创建后，验证以下内容 / After creating the release, verify:

1. **检查Release页面 / Check Release Page**
   ```
   https://github.com/gazhee/qhd-invoice-generator/releases/tag/v2.5.3
   ```

2. **确认文件可下载 / Confirm Files Downloadable**
   - 3个文件都应该出现在 "Assets" 部分 / All 3 files should appear in "Assets" section
   - 点击测试下载链接 / Click to test download links

3. **检查显示 / Check Display**
   - ✅ 标记为 "Latest" / Tagged as "Latest"
   - ✅ Release说明格式正确 / Release notes formatted correctly
   - ✅ 文件大小显示正确 / File sizes displayed correctly

---

## 📤 分享Release / Share Release

Release创建后，可以通过以下方式分享 / Once created, share via:

- **直接链接 / Direct Link**:
  ```
  https://github.com/gazhee/qhd-invoice-generator/releases/latest
  ```

- **特定版本 / Specific Version**:
  ```
  https://github.com/gazhee/qhd-invoice-generator/releases/tag/v2.5.3
  ```

- **下载链接 / Download Links**:
  ```
  Windows Installer:
  https://github.com/gazhee/qhd-invoice-generator/releases/download/v2.5.3/QHD%20Invoice%20Generator%20Setup%202.5.3.exe

  Windows Portable:
  https://github.com/gazhee/qhd-invoice-generator/releases/download/v2.5.3/QHD%20Invoice%20Generator%202.5.3.exe

  macOS:
  https://github.com/gazhee/qhd-invoice-generator/releases/download/v2.5.3/QHD%20Invoice%20Generator-2.5.3-mac.zip
  ```

---

## 📝 补充说明 / Additional Notes

### Release命名规范 / Release Naming Convention:
- Tag名称 / Tag name: `v2.5.3`
- Release标题 / Release title: `QHD Invoice Generator v2.5.3`
- 文件名 / Filenames: 保持原样 / Keep as is

### 版本历史引用 / Version History Reference:
- Release说明中添加链接到完整更新日志 / Link to full changelog in release notes
- 参考文档 / Reference documents: `VERSION_HISTORY.md`, `RELEASE_NOTES_v2.5.3.md`

### 后续维护 / Future Maintenance:
- 下次发布时更新这些文档 / Update these documents for next release
- 保持发布流程一致 / Keep release process consistent

---

## ❓ 常见问题 / FAQ

**Q: 为什么macOS版本只有x64没有arm64？**
A: 构建时arm64版本下载失败。Intel版本可以通过Rosetta 2在Apple Silicon Mac上运行。

**Q: Why only x64 for macOS, not arm64?**
A: The arm64 build failed during download. Intel version works on Apple Silicon Macs via Rosetta 2.

**Q: 用户下载后Windows Defender报警怎么办？**
A: 正常现象，因为应用未签名。告知用户点击"更多信息"→"仍要运行"。

**Q: Windows Defender warning after download?**
A: Normal behavior as app is not code-signed. Users should click "More info" → "Run anyway".

**Q: 能否修改已发布的Release？**
A: 可以，点击Release页面的"Edit release"按钮即可编辑或添加文件。

**Q: Can I edit a published Release?**
A: Yes, click "Edit release" button on the release page to edit or add files.

---

## 🎉 完成 / Done!

按照以上步骤，v2.5.3版本将成功发布到GitHub，用户可以直接下载使用！

Following the steps above, v2.5.3 will be successfully published on GitHub for users to download!

---

**创建时间 / Created**: 2025-11-24
**适用版本 / For Version**: v2.5.3
