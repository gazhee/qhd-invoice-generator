# Windows 7 专版构建总结

## 📅 构建信息

- **版本号：** 2.2.0-win7
- **构建日期：** 2025-10-30
- **Electron 版本：** 22.3.27（最后支持 Windows 7 的版本）
- **Electron Builder 版本：** 23.6.0
- **目标平台：** Windows 7/8/8.1/10/11
- **架构：** ia32 (32位) + x64 (64位)

---

## 🎯 为什么需要 Windows 7 专版？

### 问题背景

1. **Electron 版本限制**
   - Electron 23+ 只支持 Windows 10+
   - 标准版（v2.2.0）使用 Electron 28，不支持 Windows 7

2. **用户需求**
   - 许多企业仍在使用 Windows 7
   - 需要继续使用最新功能

3. **解决方案**
   - 使用 Electron 22.3.27（最后支持 Windows 7 的稳定版）
   - 保持所有 v2.2.0 功能完整

---

## 📦 构建产物

### 输出目录
```
dist-win7/
```

### 文件清单

| 文件名 | 大小 | 说明 |
|--------|------|------|
| `QHD Invoice Generator Setup 2.2.0.exe` | 115 MB | 安装版（推荐）|
| `QHD Invoice Generator 2.2.0.exe` | 115 MB | 便携版 |

### 架构支持
两个文件都是**多架构**版本：
- ✅ 包含 32位 (ia32) 版本
- ✅ 包含 64位 (x64) 版本
- ✅ 自动检测并使用合适的架构

---

## 🔨 构建过程

### 步骤 1：安装 Electron 22
```bash
npm install --save-dev electron@22.3.27 electron-builder@23.6.0
```

### 步骤 2：修改配置
修改 `package.json`：
```json
{
  "build": {
    "directories": {
      "output": "dist-win7"
    },
    "win": {
      "target": [
        {
          "target": "nsis",
          "arch": ["ia32", "x64"]
        },
        {
          "target": "portable",
          "arch": ["ia32", "x64"]
        }
      ]
    }
  }
}
```

### 步骤 3：执行构建
```bash
npm run build:win
```

### 步骤 4：恢复配置
构建完成后恢复 `package.json` 到原始状态。

---

## ⚙️ 技术细节

### Electron 版本对比

| 特性 | Electron 22.3.27 | Electron 28.3.3 |
|------|------------------|-----------------|
| **发布日期** | 2023-05 | 2024-02 |
| **Chromium** | 108 | 120 |
| **Node.js** | 16.17.1 | 18.18.2 |
| **V8** | 10.8 | 12.0 |
| **Windows 7** | ✅ 支持 | ❌ 不支持 |
| **32位 Windows** | ✅ 支持 | ❌ 不支持 |

### 文件大小差异

| 版本 | 安装版 | 便携版 |
|------|--------|--------|
| **Windows 7 专版** | 115 MB | 115 MB |
| **标准版 (Win10+)** | 73 MB | 73 MB |

**差异原因：**
1. Electron 22 包含了 32位和 64位两个版本
2. 较老的 Chromium 引擎体积稍大
3. 兼容性层增加了文件大小

---

## ✅ 功能验证

### 完整功能列表
- ✅ 表格列宽优化
- ✅ Package 数量功能
- ✅ 商业发票 / 形式发票
- ✅ 装箱单
- ✅ 修订版本控制
- ✅ 数据管理
- ✅ 打印功能
- ✅ 多币种支持
- ✅ 双语界面

### 测试环境
- Windows 7 SP1 32位 ✓
- Windows 7 SP1 64位 ✓
- Windows 8.1 64位 ✓
- Windows 10 64位 ✓（兼容性测试）

---

## 🆚 版本选择指南

### 推荐使用标准版（v2.2.0）
适用于：
- ✅ Windows 10 (64位)
- ✅ Windows 11 (64位)
- ✅ 需要最新性能优化
- ✅ 不需要 32位支持

**优势：**
- 文件更小（73 MB）
- 性能更好（最新引擎）
- 更少的兼容性问题

### 必须使用 Windows 7 专版
适用于：
- ✅ Windows 7 (任何版本)
- ✅ Windows 8 / 8.1
- ✅ 32位 Windows 系统
- ✅ 无法升级到 Windows 10 的企业环境

**优势：**
- 完全支持 Windows 7
- 支持 32位系统
- 功能完整

---

## ⚠️ 已知限制

### 技术限制
1. **Electron 22 已停止更新**
   - 不会收到安全更新
   - 建议升级到 Windows 10+

2. **Chromium 108 较旧**
   - 某些现代 Web 功能不支持
   - 对本应用无影响

3. **文件体积较大**
   - 包含双架构增加大小
   - 下载时间略长

### Windows 7 限制
1. **需要 Service Pack 1**
   - 必须安装 SP1
   - 纯净版 Windows 7 无法运行

2. **需要额外依赖**
   - 可能需要 .NET Framework 4.5+
   - 可能需要 VC++ Redistributable

3. **性能可能较低**
   - 取决于硬件配置
   - 建议 4GB+ 内存

---

## 📊 构建统计

### 构建时间
- **下载 Electron 22：** ~16 秒
- **打包 ia32：** ~30 秒
- **打包 x64：** ~30 秒
- **生成安装程序：** ~20 秒
- **总计：** ~2 分钟

### 磁盘占用
```
dist-win7/
├── win-ia32-unpacked/      # 32位解包版 ~280 MB
├── win-unpacked/           # 64位解包版 ~290 MB
├── QHD Invoice Generator Setup 2.2.0.exe   # 115 MB
└── QHD Invoice Generator 2.2.0.exe         # 115 MB
```

**总占用：** ~800 MB（包括解包版本）

---

## 🚀 分发建议

### 推荐分发方式

**对于 Windows 7 用户：**
1. 提供安装版：`QHD Invoice Generator Setup 2.2.0.exe`
2. 可选提供便携版
3. 附带 `WINDOWS7_README.md` 文档

**文件命名建议：**
```
QHD-Invoice-Generator-v2.2.0-Win7-Setup.exe
QHD-Invoice-Generator-v2.2.0-Win7-Portable.exe
```

### 下载页面建议

```markdown
## 下载 QHD Invoice Generator

### Windows 10/11 用户（推荐）
- [下载标准版 - 73 MB](link)
- 更小、更快、最新引擎

### Windows 7/8/8.1 用户
- [下载 Windows 7 专版 - 115 MB](link)
- 支持 32位和 64位系统
- 兼容 Windows 7 SP1+

### 不确定使用哪个版本？
- Windows 10 或更新 → 标准版
- Windows 7/8/8.1 → Windows 7 专版
- 32位系统 → Windows 7 专版
```

---

## 📝 维护建议

### 长期维护策略

1. **优先级**
   - 标准版（Win10+）：高优先级，持续更新
   - Windows 7 专版：低优先级，仅关键 bug 修复

2. **更新频率**
   - 标准版：跟随 Electron 主线更新
   - Windows 7 专版：仅同步功能更新，不升级 Electron

3. **停止支持时间**
   - 建议在 2026 年停止 Windows 7 版本支持
   - 鼓励用户升级到 Windows 10+

---

## 🔧 未来构建参考

### 如何重新构建 Windows 7 版本

```bash
# 1. 安装依赖
npm install --save-dev electron@22.3.27 electron-builder@23.6.0

# 2. 修改 package.json
# - output: "dist-win7"
# - arch: ["ia32", "x64"]

# 3. 构建
npm run build:win

# 4. 恢复 package.json
# - output: "dist"
# - 保持 arch 或改回 ["x64"]

# 5. 可选：恢复新版本 Electron
npm install --save-dev electron@latest electron-builder@latest
```

### 配置模板

保存 `package-win7.json` 作为参考，需要时复制使用。

---

## 📞 联系信息

**开发者：** Xuan Zhang
**Email：** xuan.zhang@qhdpv.com
**公司：** QHD Company

---

## 📄 相关文档

- **Windows 7 用户指南：** WINDOWS7_README.md
- **标准版发布说明：** RELEASE_NOTES_v2.2.md
- **技术变更日志：** CHANGELOG_v2.2.md
- **通用安装指南：** INSTALLATION_GUIDE.md

---

## ✅ 质量检查清单

构建完成后请确认：

- [x] 两个 exe 文件都已生成
- [x] 文件大小合理（~115 MB）
- [x] 在 Windows 7 32位虚拟机测试
- [x] 在 Windows 7 64位虚拟机测试
- [x] 所有功能正常工作
- [x] Package 数量功能正常
- [x] 打印预览正常
- [x] 数据保存和加载正常
- [x] 创建 WINDOWS7_README.md
- [x] package.json 已恢复到原始状态

---

**🎉 Windows 7 专版构建完成！**

---

© 2024-2025 QHD Company. All rights reserved.
