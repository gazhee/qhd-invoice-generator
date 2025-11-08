# QHD Invoice Generator - 版本对比表

## 📊 快速选择指南

```
你的操作系统是？
├─ Windows 11 (64位)      → 使用标准版 ✅
├─ Windows 10 (64位)      → 使用标准版 ✅
├─ Windows 10 (32位)      → 使用 Windows 7 专版 ⚠️
├─ Windows 8.1            → 使用 Windows 7 专版 ⚠️
├─ Windows 8              → 使用 Windows 7 专版 ⚠️
├─ Windows 7 (64位)       → 使用 Windows 7 专版 ⚠️
├─ Windows 7 (32位)       → 使用 Windows 7 专版 ⚠️
└─ Windows XP/Vista       → 不支持 ❌
```

---

## 🆚 详细对比

### 标准版 (v2.2.0)

**📂 位置：** `dist/` 目录

**🎯 目标用户：** Windows 10/11 用户（推荐）

**📦 下载文件：**

| 平台 | 文件名 | 大小 | 架构 |
|------|--------|------|------|
| **Windows** | QHD Invoice Generator Setup 2.2.0.exe | 73 MB | x64 |
| **Windows** | QHD Invoice Generator 2.2.0.exe | 73 MB | x64 |
| **macOS Intel** | QHD Invoice Generator-2.2.0.dmg | 94 MB | x64 |
| **macOS Intel** | QHD Invoice Generator-2.2.0-mac.zip | 91 MB | x64 |
| **macOS M1/M2/M3** | QHD Invoice Generator-2.2.0-arm64.dmg | 89 MB | arm64 |
| **macOS M1/M2/M3** | QHD Invoice Generator-2.2.0-arm64-mac.zip | 91 MB | arm64 |

**⚙️ 技术规格：**
- Electron: 28.3.3
- Chromium: 120
- Node.js: 18.18.2
- 支持系统：Windows 10+, macOS 10.12+

**✅ 优势：**
- 文件更小（73 MB vs 115 MB）
- 最新引擎，性能更好
- 更好的安全性
- 长期支持

**❌ 限制：**
- 不支持 Windows 7/8/8.1
- 不支持 32位系统
- 需要较新的操作系统

---

### Windows 7 专版 (v2.2.0-win7)

**📂 位置：** `dist-win7/` 目录

**🎯 目标用户：** Windows 7/8/8.1 或 32位系统用户

**📦 下载文件：**

| 平台 | 文件名 | 大小 | 架构 |
|------|--------|------|------|
| **Windows** | QHD Invoice Generator Setup 2.2.0.exe | 115 MB | ia32 + x64 |
| **Windows** | QHD Invoice Generator 2.2.0.exe | 115 MB | ia32 + x64 |

**⚙️ 技术规格：**
- Electron: 22.3.27
- Chromium: 108
- Node.js: 16.17.1
- 支持系统：Windows 7 SP1+

**✅ 优势：**
- 支持 Windows 7/8/8.1
- 支持 32位系统
- 包含双架构，自动选择
- 功能完整

**❌ 限制：**
- 文件较大（115 MB）
- 较旧引擎
- Electron 22 已停止更新
- 仅支持 Windows

---

## 📊 功能对比矩阵

| 功能 | 标准版 | Win7专版 |
|------|--------|----------|
| **表格列宽优化** | ✅ | ✅ |
| **Package 数量功能** | ✅ | ✅ |
| **商业发票** | ✅ | ✅ |
| **形式发票** | ✅ | ✅ |
| **装箱单** | ✅ | ✅ |
| **修订版本控制** | ✅ | ✅ |
| **多币种支持** | ✅ | ✅ |
| **打印优化** | ✅ | ✅ |
| **双语界面** | ✅ | ✅ |
| **数据管理** | ✅ | ✅ |
| **离线工作** | ✅ | ✅ |

**结论：** 功能完全一致！

---

## 💻 系统要求对比

### 标准版 (v2.2.0)

**Windows：**
- 最低：Windows 10 (64位)
- 推荐：Windows 11 (64位)
- 内存：4 GB RAM
- 硬盘：250 MB

**macOS：**
- 最低：macOS 10.12 (Sierra)
- 推荐：macOS 13+ (Ventura)
- Intel 或 Apple Silicon
- 内存：4 GB RAM
- 硬盘：250 MB

---

### Windows 7 专版

**Windows：**
- 最低：Windows 7 SP1 (32/64位)
- 推荐：Windows 7 SP1 (64位)
- 内存：2 GB RAM (32位) / 4 GB RAM (64位)
- 硬盘：300 MB
- 需要：.NET Framework 4.5+

**不支持：**
- ❌ macOS
- ❌ Linux
- ❌ Windows XP/Vista

---

## 📥 下载建议

### 企业用户

**如果你的企业：**

✅ 已升级到 Windows 10/11
→ 使用**标准版**，获得最佳性能

⚠️ 仍在使用 Windows 7
→ 使用 **Windows 7 专版**，但计划升级系统

📋 混合环境（部分 Win7，部分 Win10）
→ 分别下载两个版本

---

### 个人用户

**检查你的系统：**

1. 按 `Win + R`
2. 输入 `winver`
3. 查看版本号

**结果：**
- Windows 10 或 11 → 标准版
- Windows 7/8/8.1 → Windows 7 专版

---

## 🔄 升级路径

### 从旧版本升级

**v2.1 → v2.2 标准版：**
1. 下载新版本
2. 卸载 v2.1
3. 安装 v2.2
4. 数据自动保留

**v2.1 → v2.2 Win7专版：**
1. 下载 Windows 7 专版
2. 卸载 v2.1
3. 安装 Win7 专版
4. 数据自动保留

**标准版 ↔ Win7专版：**
- 可以互相切换
- 数据格式完全兼容
- localStorage 自动迁移

---

## 🎯 性能对比

| 指标 | 标准版 | Win7专版 |
|------|--------|----------|
| **启动时间** | ~2 秒 | ~3 秒 |
| **内存占用** | ~120 MB | ~150 MB |
| **CPU 使用** | 低 | 中 |
| **打印速度** | 快 | 一般 |
| **大文档处理** | 流畅 | 可能卡顿 |

*测试环境：Windows 10, i5-8250U, 8GB RAM*

---

## 📦 文件大小总览

```
标准版 (6 个文件)
├── Windows x64 Setup          73 MB
├── Windows x64 Portable       73 MB
├── macOS Intel DMG            94 MB
├── macOS Intel ZIP            91 MB
├── macOS ARM DMG              89 MB
└── macOS ARM ZIP              91 MB
总计：511 MB

Windows 7 专版 (2 个文件)
├── Windows ia32+x64 Setup    115 MB
└── Windows ia32+x64 Portable 115 MB
总计：230 MB

全部文件总计：741 MB
```

---

## 🔐 安全性

| 方面 | 标准版 | Win7专版 |
|------|--------|----------|
| **Chromium 版本** | 120 (2024) | 108 (2023) |
| **安全更新** | ✅ 活跃 | ⚠️ 已停止 |
| **漏洞风险** | 低 | 中 |
| **代码签名** | 无 | 无 |

**建议：**
- 优先使用标准版（如果系统支持）
- Windows 7 专版仅用于必要情况
- 尽快升级到 Windows 10+

---

## 📞 技术支持

### 遇到问题？

**标准版问题：**
- 参考：INSTALLATION_GUIDE.md
- 参考：RELEASE_NOTES_v2.2.md

**Windows 7 专版问题：**
- 参考：WINDOWS7_README.md
- 参考：WINDOWS7_BUILD_SUMMARY.md

**联系支持：**
- Email: xuan.zhang@qhdpv.com
- 提供系统版本和错误截图

---

## 📚 文档索引

### 通用文档
- `README.md` - 项目总览
- `USER_MANUAL.md` - 用户手册
- `CHANGELOG_v2.2.md` - 技术变更日志
- `RELEASE_NOTES_v2.2.md` - 发布说明

### 标准版文档
- `INSTALLATION_GUIDE.md` - 安装指南
- `BUILD_SUMMARY_v2.2.md` - 构建总结

### Windows 7 专版文档
- `WINDOWS7_README.md` - 用户指南
- `WINDOWS7_BUILD_SUMMARY.md` - 构建总结

### 对比文档
- `VERSION_COMPARISON.md` - 本文档

---

## ✅ 快速决策树

```
开始
 │
 ├─ 你是 Windows 用户吗？
 │   │
 │   ├─ 是 → 你的 Windows 版本是？
 │   │       │
 │   │       ├─ Windows 11 → 标准版 ✅
 │   │       ├─ Windows 10 → 标准版 ✅
 │   │       ├─ Windows 8/8.1 → Win7专版 ⚠️
 │   │       └─ Windows 7 → Win7专版 ⚠️
 │   │
 │   └─ 否 → 你是 macOS 用户吗？
 │           │
 │           ├─ 是 → 你的芯片类型是？
 │           │       │
 │           │       ├─ Apple M1/M2/M3 → 标准版 ARM ✅
 │           │       └─ Intel → 标准版 x64 ✅
 │           │
 │           └─ 否 → 抱歉，暂不支持 Linux ❌
```

---

**最后更新：** 2025-10-30

**版本：** v2.2.0 (标准版) / v2.2.0-win7 (Windows 7 专版)

---

© 2024-2025 QHD Company. All rights reserved.
