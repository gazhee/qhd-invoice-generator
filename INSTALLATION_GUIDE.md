# QHD Invoice Generator v2.2.0 - 安装指南

## 📥 下载文件位置

所有构建的应用程序位于：
```
dist/
```

---

## 🪟 Windows 安装

### 方式 1：安装版（推荐）

**文件名：** `QHD Invoice Generator Setup 2.2.0.exe` (73 MB)

**安装步骤：**
1. 双击 `QHD Invoice Generator Setup 2.2.0.exe`
2. 如果出现 Windows SmartScreen 警告：
   - 点击"更多信息"
   - 点击"仍要运行"
3. 选择安装目录（默认：`C:\Program Files\QHD Invoice Generator`）
4. 勾选"创建桌面快捷方式"（推荐）
5. 点击"安装"
6. 等待安装完成
7. 点击"完成"启动应用

**卸载方式：**
- 控制面板 → 程序和功能 → QHD Invoice Generator → 卸载

---

### 方式 2：便携版（无需安装）

**文件名：** `QHD Invoice Generator 2.2.0.exe` (73 MB)

**使用步骤：**
1. 将 `QHD Invoice Generator 2.2.0.exe` 复制到任意文件夹
2. 双击运行即可
3. 可以放在 USB 驱动器中随身携带

**注意：** 数据存储在应用程序目录下，移动文件会导致数据丢失。

---

## 🍎 macOS 安装

### 确定你的 Mac 芯片类型

**检查方法：**
1. 点击左上角  菜单
2. 选择"关于本机"
3. 查看"芯片"或"处理器"：
   - **Apple M1/M2/M3** → 使用 arm64 版本
   - **Intel Core i5/i7/i9** → 使用 x64 版本

---

### Intel 芯片 Mac 安装

#### 选项 A：DMG 安装（推荐）

**文件名：** `QHD Invoice Generator-2.2.0.dmg` (94 MB)

**安装步骤：**
1. 双击 `QHD Invoice Generator-2.2.0.dmg`
2. 等待磁盘镜像挂载
3. 将"QHD Invoice Generator"图标拖拽到"Applications"文件夹
4. 弹出磁盘镜像
5. 打开"应用程序"文件夹，双击"QHD Invoice Generator"

#### 选项 B：ZIP 安装

**文件名：** `QHD Invoice Generator-2.2.0-mac.zip` (91 MB)

**安装步骤：**
1. 双击解压 `QHD Invoice Generator-2.2.0-mac.zip`
2. 将解压后的"QHD Invoice Generator.app"拖拽到"应用程序"文件夹

---

### Apple Silicon (M1/M2/M3) Mac 安装

#### 选项 A：DMG 安装（推荐）

**文件名：** `QHD Invoice Generator-2.2.0-arm64.dmg` (89 MB)

**安装步骤：**
1. 双击 `QHD Invoice Generator-2.2.0-arm64.dmg`
2. 等待磁盘镜像挂载
3. 将"QHD Invoice Generator"图标拖拽到"Applications"文件夹
4. 弹出磁盘镜像
5. 打开"应用程序"文件夹，双击"QHD Invoice Generator"

#### 选项 B：ZIP 安装

**文件名：** `QHD Invoice Generator-2.2.0-arm64-mac.zip` (91 MB)

**安装步骤：**
1. 双击解压 `QHD Invoice Generator-2.2.0-arm64-mac.zip`
2. 将解压后的"QHD Invoice Generator.app"拖拽到"应用程序"文件夹

---

### macOS 首次运行

由于应用未经过 Apple 代码签名，首次运行时会被 macOS 阻止。

**解决方法：**

#### 方式 1：右键打开（推荐）
1. 在"应用程序"文件夹中找到"QHD Invoice Generator"
2. **按住 Control 键点击**应用图标（或右键点击）
3. 选择"打开"
4. 在弹出的对话框中点击"打开"
5. 应用启动后，后续可以正常双击打开

#### 方式 2：系统设置
1. 尝试双击打开应用（会被阻止）
2. 打开"系统偏好设置" → "安全性与隐私"
3. 在"通用"标签页底部，点击"仍要打开"
4. 在确认对话框中点击"打开"

#### 方式 3：终端命令（高级用户）
```bash
xattr -cr "/Applications/QHD Invoice Generator.app"
```

---

## 🔍 验证安装

### Windows
1. 打开应用
2. 应该看到"发票 Invoice / 装箱单 Packing List"选择界面
3. 检查窗口标题显示"QHD Invoice Generator"
4. 在"关于"菜单中应显示版本 2.2.0

### macOS
1. 打开应用
2. 应该看到"发票 Invoice / 装箱单 Packing List"选择界面
3. 点击顶部菜单栏"QHD Invoice Generator" → "About"
4. 应显示版本 2.2.0

---

## 🗑️ 卸载

### Windows 安装版
1. 控制面板 → 程序和功能
2. 找到"QHD Invoice Generator"
3. 点击"卸载"
4. 按照提示完成卸载

### Windows 便携版
直接删除 `.exe` 文件即可

### macOS
1. 打开"应用程序"文件夹
2. 将"QHD Invoice Generator.app"拖到废纸篓
3. 清空废纸篓

**注意：** 数据存储在应用程序的 localStorage 中，卸载应用会清除所有数据。如需备份，请在卸载前导出数据。

---

## 📦 数据位置

应用数据存储在 Electron 的 localStorage 中：

### Windows
```
C:\Users\[用户名]\AppData\Roaming\qhd-invoice-generator\
```

### macOS
```
~/Library/Application Support/qhd-invoice-generator/
```

### 备份建议
1. 定期使用浏览器开发者工具导出 localStorage
2. 或复制上述目录进行备份

---

## 🐛 常见问题

### Windows SmartScreen 警告
**原因：** 应用未经过 Microsoft 代码签名
**解决：** 点击"更多信息" → "仍要运行"
**安全性：** 应用开源，可查看源代码确认安全性

### macOS "无法打开，因为它来自身份不明的开发者"
**原因：** 应用未经过 Apple 代码签名
**解决：** 参考上文"macOS 首次运行"部分
**安全性：** 应用开源，可查看源代码确认安全性

### 应用无法启动
**可能原因：**
1. 系统版本过旧（Windows 需要 10+，macOS 需要 10.12+）
2. 缺少系统依赖（极少见）

**解决方法：**
1. 更新操作系统到最新版本
2. 重新下载并安装应用
3. 查看错误日志并联系支持

### 数据丢失
**可能原因：**
1. 移动了便携版应用位置
2. 清理了浏览器缓存

**预防方法：**
1. 使用安装版而非便携版
2. 定期备份数据
3. 不要随意清理应用数据

---

## 📞 获取帮助

如果安装过程中遇到问题：

**Email：** xuan.zhang@qhdpv.com

**GitHub Issues：** https://github.com/qhdpv/invoice-generator/issues

**提供以下信息：**
1. 操作系统和版本（如：Windows 11, macOS 14.0 Sonoma）
2. 下载的文件名
3. 错误信息截图
4. 问题详细描述

---

## ✅ 安装完成检查清单

安装完成后，请确认：

- [ ] 应用可以正常启动
- [ ] 版本号显示为 2.2.0
- [ ] 可以创建新的发票
- [ ] 可以创建新的装箱单
- [ ] 装箱单中可以看到"件数 Quantity"字段
- [ ] 打印预览功能正常
- [ ] 数据保存和加载正常

---

**祝使用愉快！** 🎉
