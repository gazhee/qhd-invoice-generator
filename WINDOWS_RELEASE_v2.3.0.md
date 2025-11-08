# QHD Invoice Generator v2.3.0 - Windows版发布说明

**发布日期 Release Date:** 2025-01-31
**版本号 Version:** 2.3.0
**平台 Platform:** Windows 7/8/10/11 (32-bit & 64-bit)

---

## 📦 下载文件 Download Files

### 位置 Location
所有Windows安装包位于：
```
dist/
├── QHD Invoice Generator Setup 2.3.0.exe    (115 MB) - 安装版
└── QHD Invoice Generator 2.3.0.exe           (115 MB) - 便携版
```

### 两种版本对比 Version Comparison

| 特性 Feature | 安装版 Setup | 便携版 Portable |
|-------------|-------------|----------------|
| 文件名 | QHD Invoice Generator Setup 2.3.0.exe | QHD Invoice Generator 2.3.0.exe |
| 大小 Size | 115 MB | 115 MB |
| 安装需求 | 需要安装 | 无需安装 |
| 桌面快捷方式 | ✅ 自动创建 | ❌ 需手动创建 |
| 开始菜单 | ✅ 自动添加 | ❌ 无 |
| 卸载程序 | ✅ 控制面板卸载 | ❌ 直接删除文件 |
| 系统注册表 | 写入注册表 | 不修改注册表 |
| 适用场景 | 长期使用，单台电脑 | 临时使用，多台电脑，USB便携 |
| 管理员权限 | 可选（默认用户安装） | 不需要 |

---

## 🚀 安装指南 Installation Guide

### 选项 1️⃣：安装版 (推荐 Recommended)

**适用于 Best for:**
- 长期在固定电脑上使用
- 希望集成到Windows系统（开始菜单、桌面快捷方式）
- 需要简单的卸载流程

**安装步骤 Steps:**

1. **下载安装程序**
   ```
   文件：QHD Invoice Generator Setup 2.3.0.exe
   大小：115 MB
   ```

2. **运行安装程序**
   - 双击 `QHD Invoice Generator Setup 2.3.0.exe`
   - Windows可能显示"SmartScreen"警告，点击"更多信息" → "仍要运行"

3. **选择安装选项**
   - **安装路径**：默认 `C:\Users\[用户名]\AppData\Local\Programs\qhd-invoice-generator`
   - 可选择其他路径
   - **桌面快捷方式**：勾选创建
   - **开始菜单快捷方式**：自动创建

4. **完成安装**
   - 点击"安装 Install"
   - 等待安装完成（约30秒）
   - 点击"完成 Finish"启动应用

5. **首次运行**
   - 应用自动启动
   - 开始创建发票！

**安装位置 Installation Locations:**
```
程序文件：
C:\Users\[用户名]\AppData\Local\Programs\qhd-invoice-generator\

桌面快捷方式：
C:\Users\[用户名]\Desktop\QHD Invoice Generator.lnk

开始菜单：
C:\ProgramData\Microsoft\Windows\Start Menu\Programs\QHD Invoice Generator.lnk
```

---

### 选项 2️⃣：便携版

**适用于 Best for:**
- 需要在多台电脑之间使用
- 不想修改系统设置
- USB驱动器携带使用
- 临时使用或测试

**使用步骤 Steps:**

1. **下载便携版**
   ```
   文件：QHD Invoice Generator 2.3.0.exe
   大小：115 MB
   ```

2. **创建应用文件夹（推荐）**
   ```
   建议路径：
   - 桌面：Desktop\QHD Invoice Generator\
   - USB：E:\Portable Apps\QHD Invoice Generator\
   - 文档：Documents\QHD Invoice Generator\
   ```

3. **复制文件**
   - 将 `QHD Invoice Generator 2.3.0.exe` 复制到选定文件夹
   - 可重命名为 `QHD Invoice Generator.exe` (可选)

4. **运行应用**
   - 双击 `QHD Invoice Generator 2.3.0.exe`
   - Windows可能显示SmartScreen警告，选择"仍要运行"

5. **创建快捷方式（可选）**
   - 右键点击exe文件 → "发送到" → "桌面快捷方式"

**数据存储位置 Data Storage:**
```
便携版的数据存储在Windows本地：
C:\Users\[用户名]\AppData\Roaming\qhd-invoice-generator\

注意：数据不会保存在USB中，每台电脑的数据独立
```

---

## 📋 系统要求 System Requirements

### 最低配置 Minimum Requirements
- **操作系统**: Windows 7 SP1 / 8 / 10 / 11
- **架构**: 32-bit (x86) 或 64-bit (x64)
- **内存**: 512 MB RAM
- **硬盘**: 200 MB 可用空间
- **屏幕**: 1024×768 分辨率

### 推荐配置 Recommended
- **操作系统**: Windows 10 / 11
- **架构**: 64-bit (x64)
- **内存**: 2 GB RAM
- **硬盘**: 500 MB 可用空间
- **屏幕**: 1920×1080 分辨率

---

## ✨ v2.3.0 新功能 What's New

### 1. 价格精度提升 Price Precision Enhancement
- ✅ 单价从4位小数提升至5位 (0.12345)
- ✅ 金额从2位小数提升至5位 (123.45678)
- ✅ 支持更精确的微利润计算

### 2. 发票数据优化 Invoice Data Optimization
- ✅ 移除发票条目中的包装字段
- ✅ 发票专注于交易信息（描述、数量、单价、金额）
- ✅ 装箱单保持完整包装结构

### 3. 性能优化 Performance Improvements
- ✅ 修复总金额自动计算问题
- ✅ 优化实时预览性能
- ✅ 减少不必要的数据字段

详细更新日志请查看：`CHANGELOG_v2.3.md`

---

## 🔧 使用指南 Usage Guide

### 首次使用 First Time Use

1. **启动应用**
   - 安装版：开始菜单或桌面快捷方式
   - 便携版：双击exe文件

2. **配置基本信息**
   - 点击"发货方 Shipper"设置公司信息
   - 点击"收货人 Consignee"添加客户信息
   - 点击"付款方 Bill To"添加付款方（如需要）

3. **创建第一张发票**
   - 选择文档类型：发票 Invoice / 装箱单 Packing List
   - 选择发票类型：标准发票 / 商业发票 / 形式发票
   - 填写日期、订单号等信息
   - 添加货物条目
   - 确认修订版本
   - 生成打印预览

4. **打印或保存**
   - 点击"生成打印预览 Step 2"
   - 在新窗口中打印或保存为PDF

### 数据管理 Data Management

**数据位置 Data Location:**
```
Windows:
C:\Users\[用户名]\AppData\Roaming\qhd-invoice-generator\

包含文件：
- localStorage数据库（所有发票、装箱单、Profile）
- 应用配置
```

**备份数据 Backup Data:**

方法1：浏览器导出
1. 打开应用
2. 按F12打开开发者工具
3. Console标签输入：
   ```javascript
   // 导出所有数据
   const data = {};
   for (let i = 0; i < localStorage.length; i++) {
       const key = localStorage.key(i);
       data[key] = localStorage.getItem(key);
   }
   console.log(JSON.stringify(data));
   // 复制输出内容保存为backup.json
   ```

方法2：文件夹备份
```
复制整个文件夹：
C:\Users\[用户名]\AppData\Roaming\qhd-invoice-generator\
```

**恢复数据 Restore Data:**
1. 关闭应用
2. 替换 `AppData\Roaming\qhd-invoice-generator\` 文件夹
3. 重新启动应用

---

## 🔄 从旧版本升级 Upgrading from Previous Versions

### 从 v2.2 升级到 v2.3

**兼容性 Compatibility:**
- ✅ 所有v2.2数据完全兼容
- ✅ Profile信息保持不变
- ✅ 已有的发票和装箱单可正常加载

**升级步骤 Steps:**

1. **备份现有数据**（强烈推荐）
   - 参考"数据管理"章节备份数据

2. **安装新版本**
   - 安装版：运行新的Setup 2.3.0.exe（会自动覆盖旧版本）
   - 便携版：下载新的2.3.0.exe，替换旧文件

3. **验证数据**
   - 启动应用
   - 检查Profile是否完整
   - 加载一个旧的发票修订版本
   - 确认数据显示正常

**注意事项 Notes:**
- ⚠️ v2.3中，旧发票的包装字段将被忽略（不影响使用）
- ⚠️ 单价和金额现在显示5位小数，旧数据会自动补零
- ⚠️ 建议重新确认旧发票的金额计算

---

## 🐛 故障排除 Troubleshooting

### 常见问题 Common Issues

#### 1. SmartScreen警告

**问题：** Windows提示"Windows已保护你的电脑"

**解决方案：**
1. 点击"更多信息"
2. 点击"仍要运行"
3. 这是因为应用没有购买代码签名证书（正常现象）

#### 2. 应用无法启动

**问题：** 双击exe文件没有反应

**解决方案：**
1. 检查是否已安装 Microsoft Visual C++ Redistributable
   - 下载：https://aka.ms/vs/17/release/vc_redist.x64.exe
2. 尝试以管理员身份运行
3. 检查杀毒软件是否拦截

#### 3. 数据丢失

**问题：** 之前的发票不见了

**解决方案：**
1. 检查是否在正确的用户账户下
2. 数据位置：`C:\Users\[用户名]\AppData\Roaming\qhd-invoice-generator\`
3. 恢复备份数据

#### 4. 打印预览空白

**问题：** 点击"生成打印预览"后页面空白

**解决方案：**
1. 检查浏览器弹窗拦截设置
2. 确保已"确认修订版本"（Step 1）
3. 刷新应用重试

#### 5. 安装失败

**问题：** 安装程序报错

**解决方案：**
1. 以管理员身份运行安装程序
2. 关闭杀毒软件
3. 清理临时文件：`%TEMP%`
4. 使用便携版代替

---

## 🔐 安全说明 Security Notes

### 应用签名 Application Signing
- ⚠️ 此应用**未使用**代码签名证书
- ✅ 应用完全开源，代码可审查
- ✅ 所有数据本地存储，不联网

### 权限需求 Permissions
- **安装版**：写入 `C:\Users\[用户名]\AppData\Local\` (用户权限)
- **便携版**：无需特殊权限
- **数据存储**：`AppData\Roaming` (用户权限)

### 杀毒软件 Antivirus
- 部分杀毒软件可能误报
- 建议添加到白名单：
  ```
  文件：QHD Invoice Generator Setup 2.3.0.exe
  文件：QHD Invoice Generator 2.3.0.exe
  路径：C:\Users\[用户名]\AppData\Local\Programs\qhd-invoice-generator\
  ```

---

## 📞 技术支持 Technical Support

### 联系方式 Contact

- **Email**: xuan.zhang@qhdpv.com
- **GitHub Issues**: [项目仓库]
- **公司**: QHD Company

### 问题反馈 Bug Report

请提供以下信息：
1. Windows版本 (例如: Windows 10 Pro 22H2)
2. 应用版本 (v2.3.0)
3. 问题描述
4. 复现步骤
5. 错误截图（如有）

### 功能建议 Feature Request

欢迎提供改进建议！请通过Email或GitHub Issues反馈。

---

## 📄 许可证 License

MIT License

Copyright (c) 2024 QHD Company

---

## 🙏 致谢 Acknowledgments

- **Electron** - 跨平台桌面应用框架
- **Tailwind CSS** - UI样式框架
- **Electron Builder** - 应用打包工具

---

## 📚 相关文档 Related Documentation

- `CHANGELOG_v2.3.md` - 详细更新日志
- `USER_MANUAL.md` - 用户操作手册
- `README.md` - 项目说明
- `features.md` - 功能清单

---

**🎉 感谢使用 QHD Invoice Generator v2.3.0！**

**Thank you for using QHD Invoice Generator v2.3.0!**

---

## 📊 文件校验 File Verification

### SHA256 Checksums

```
1023fd85b3a4d39e5e27ab568c1709c48d7506998f1115f053a129c40bb583bd  QHD Invoice Generator Setup 2.3.0.exe
a32270d1a58e93210e32e496d2dcc95536808accc7fb783ac34ac3a5eef099f2  QHD Invoice Generator 2.3.0.exe
```

**验证方法 Verification:**
```bash
# PowerShell (Windows)
Get-FileHash "QHD Invoice Generator Setup 2.3.0.exe" -Algorithm SHA256
Get-FileHash "QHD Invoice Generator 2.3.0.exe" -Algorithm SHA256

# 对比输出的Hash值与上述校验码是否一致
```

### 文件信息 File Information

```
QHD Invoice Generator Setup 2.3.0.exe
- 大小: 115 MB (120,586,368 bytes)
- 类型: Windows Installer (NSIS)
- 架构: ia32 + x64 (Universal)
- 构建日期: 2025-01-31

QHD Invoice Generator 2.3.0.exe
- 大小: 115 MB (120,586,368 bytes)
- 类型: Portable Executable
- 架构: ia32 + x64 (Universal)
- 构建日期: 2025-01-31
```
