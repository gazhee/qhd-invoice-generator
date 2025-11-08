# 🎉 QHD Invoice Generator v2.3.0 发布！

**发布日期：** 2025-01-31
**版本：** 2.3.0

---

## 📥 快速下载 Quick Download

### Windows 用户 (推荐)

选择以下任一版本：

#### 🔷 安装版 (推荐长期使用)
```
文件名: QHD Invoice Generator Setup 2.3.0.exe
大小: 115 MB
位置: dist/QHD Invoice Generator Setup 2.3.0.exe
```
**特点：**
- ✅ 自动创建桌面快捷方式
- ✅ 集成到开始菜单
- ✅ 简单的卸载流程

#### 🔶 便携版 (无需安装)
```
文件名: QHD Invoice Generator 2.3.0.exe
大小: 115 MB
位置: dist/QHD Invoice Generator 2.3.0.exe
```
**特点：**
- ✅ 无需安装，双击即用
- ✅ 适合USB携带
- ✅ 不修改系统设置

---

## ⚡ 快速开始 Quick Start

### 1️⃣ 安装版 Setup Version

```
1. 双击 "QHD Invoice Generator Setup 2.3.0.exe"
2. 点击 "更多信息" → "仍要运行" (如出现SmartScreen)
3. 选择安装路径，点击 "安装"
4. 完成后点击 "完成" 启动应用
5. 开始使用！
```

### 2️⃣ 便携版 Portable Version

```
1. 双击 "QHD Invoice Generator 2.3.0.exe"
2. 点击 "仍要运行" (如出现SmartScreen)
3. 应用立即启动
4. 开始使用！
```

---

## ✨ v2.3.0 核心更新 Key Updates

### 🔢 价格精度全面提升
- **单价**: 4位 → **5位小数** (0.12345)
- **金额**: 2位 → **5位小数** (123.45678)
- **总金额**: 2位 → **5位小数** ($240.73950)

### 📝 发票结构优化
- ✅ 移除发票中的包装字段（包装类型、件数、尺寸等）
- ✅ 发票更简洁，专注于交易信息
- ✅ 装箱单保持完整包装结构

### 🐛 问题修复
- ✅ 修复总金额自动计算问题
- ✅ 优化实时预览性能
- ✅ 增强输入字段保护

---

## 📋 系统要求 System Requirements

**最低要求：**
- Windows 7 SP1 / 8 / 10 / 11
- 32-bit 或 64-bit
- 512 MB RAM
- 200 MB 硬盘空间

**推荐配置：**
- Windows 10 / 11 (64-bit)
- 2 GB RAM
- 500 MB 硬盘空间

---

## 🔐 文件校验 File Verification

### SHA256 Checksums

```
Setup版:
1023fd85b3a4d39e5e27ab568c1709c48d7506998f1115f053a129c40bb583bd

便携版:
a32270d1a58e93210e32e496d2dcc95536808accc7fb783ac34ac3a5eef099f2
```

**验证命令 (PowerShell):**
```powershell
Get-FileHash "QHD Invoice Generator Setup 2.3.0.exe" -Algorithm SHA256
Get-FileHash "QHD Invoice Generator 2.3.0.exe" -Algorithm SHA256
```

---

## 📖 详细文档 Documentation

| 文档 | 说明 |
|-----|------|
| `WINDOWS_RELEASE_v2.3.0.md` | 完整的Windows安装和使用指南 |
| `CHANGELOG_v2.3.md` | 详细的版本更新日志 |
| `USER_MANUAL.md` | 用户操作手册 |
| `README.md` | 项目说明 |

---

## 🆙 从旧版本升级 Upgrading

### 数据兼容性
- ✅ v2.2 数据完全兼容
- ✅ 所有Profile保持不变
- ✅ 已有发票可正常加载

### 升级步骤
1. **备份数据** (推荐)
   - 位置：`C:\Users\[用户名]\AppData\Roaming\qhd-invoice-generator\`
2. **安装新版本**
   - 安装版：直接运行新的Setup，会自动覆盖
   - 便携版：下载新文件，替换旧文件
3. **启动应用**
   - 验证数据完整性

---

## ⚠️ 重要提示 Important Notes

### Windows SmartScreen 警告
所有未签名的应用会触发SmartScreen警告，这是正常现象：
1. 点击 "更多信息"
2. 点击 "仍要运行"

### 杀毒软件
部分杀毒软件可能误报，建议添加到白名单。

### 数据位置
所有数据存储在本地：
```
C:\Users\[用户名]\AppData\Roaming\qhd-invoice-generator\
```

---

## 🐛 遇到问题？ Troubleshooting

### 常见问题

**Q: 应用无法启动？**
- A: 安装 [Visual C++ Redistributable](https://aka.ms/vs/17/release/vc_redist.x64.exe)

**Q: 打印预览空白？**
- A: 先点击"确认修订版本 Step 1"，再点击"生成打印预览 Step 2"

**Q: 数据丢失？**
- A: 检查 `AppData\Roaming\qhd-invoice-generator\` 是否存在

**Q: 安装失败？**
- A: 以管理员身份运行，或使用便携版

---

## 📞 技术支持 Support

**Email:** xuan.zhang@qhdpv.com
**GitHub Issues:** [项目仓库]
**公司:** QHD Company

---

## 🎯 测试清单 Testing Checklist

安装完成后，请测试以下功能：

- [ ] 创建新发票条目
- [ ] 输入单价 `1.23456`，确认显示5位小数
- [ ] 输入数量 `100`，确认金额显示 `123.45600`
- [ ] 添加第二个条目，确认总金额自动更新
- [ ] 切换到装箱单模式，确认包装功能正常
- [ ] 生成打印预览，确认PDF格式正确
- [ ] 保存并加载修订版本

---

## 🎊 特别感谢 Acknowledgments

感谢所有测试用户的反馈和建议！

---

## 📅 版本历史 Version History

| 版本 | 日期 | 主要更新 |
|-----|------|---------|
| **v2.3.0** | 2025-01-31 | 价格精度5位，发票结构优化 |
| v2.2.0 | 2025-01-30 | 功能增强 |
| v2.1.0 | 2024-10-22 | 修订系统优化 |
| v2.0.0 | 2024-10-08 | 初始发布 |

---

**🎉 开始使用 QHD Invoice Generator v2.3.0！**

**祝工作顺利！Happy Invoicing!**
