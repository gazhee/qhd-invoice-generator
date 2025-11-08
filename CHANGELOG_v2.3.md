# QHD Invoice Generator - v2.3.0 更新日志 Changelog

**发布日期 Release Date:** 2025-01-31

---

## 📋 版本概览 Version Overview

v2.3.0 是一个重要的功能改进版本，专注于优化发票数据结构和提升价格精度。本次更新实现了发票和装箱单的数据分离，并将单价精度提升至5位小数。

v2.3.0 is a significant functional improvement release focused on optimizing invoice data structure and enhancing price precision. This update separates invoice and packing list data, and increases unit price precision to 5 decimal places.

---

## ✨ 新增功能 New Features

### 1. 发票与装箱单数据分离 Invoice-Packing List Data Separation

**中文说明：**
- 发票条目不再包含包装相关字段（包装类型、件数、尺寸、毛重、体积）
- 发票专注于交易信息：货物描述、HS Code、净重、数量、单价、金额
- 装箱单保留完整的包装信息结构
- 更清晰的数据模型，避免字段混淆

**English Description:**
- Invoice items no longer include packaging-related fields (package type, packages, dimensions, gross weight, volume)
- Invoices focus on transaction information: description, HS Code, net weight, quantity, unit price, amount
- Packing lists retain complete packaging information structure
- Cleaner data model, avoiding field confusion

**受影响的文件 Affected Files:**
- `invoice_generator_v2.3.html` - 发票条目HTML模板
- `invoice_generator_v2.3.html` - `addNewItem()` 函数
- `invoice_generator_v2.3.html` - `collectFormData()` 函数

### 2. 价格精度全面提升 Price Precision Enhancement

**中文说明：**
- 单价显示精度从4位小数提升至5位小数
- 金额显示精度从2位小数提升至5位小数
- 总金额计算精度提升至5位小数
- 支持更精确的价格计算（如 $0.12345）
- 输入框支持0.00001步进精度
- 数字格式化器更新为5位小数

**English Description:**
- Unit price display precision increased from 4 to 5 decimal places
- Amount display precision increased from 2 to 5 decimal places
- Total amount calculation precision increased to 5 decimal places
- Supports more precise price calculations (e.g., $0.12345)
- Input field supports 0.00001 step precision
- Number formatter updated to 5 decimal places

**技术细节 Technical Details:**
```javascript
// Old (v2.2)
unitPrice: toFixed(4)  // → 0.1234
amount: toFixed(2)     // → 123.45
step="0.0001" (unit price)
step="0.01" (amount)
minimumFractionDigits: 4 (unit price)
minimumFractionDigits: 2 (amount)

// New (v2.3)
unitPrice: toFixed(5)  // → 0.12345
amount: toFixed(5)     // → 123.45678
step="0.00001" (both)
minimumFractionDigits: 5 (both)
```

---

## 🔧 改进内容 Improvements

### 代码清理 Code Cleanup

1. **移除未使用的变量 Removed Unused Variables:**
   - `packageTypeOptions` - 不再在发票条目中使用
   - `packagesValue`, `grossWtValue`, `volumeValue`, `dimensionsValue` - 包装相关变量
   - `packageTypeSelect`, `packageTypeCustom` - DOM查询器
   - `grossWtInput`, `packagesInput`, `volumeInput`, `dimensionsInput` - 输入元素引用

2. **清理事件监听器 Cleaned Event Listeners:**
   - 移除包装字段的 `input` 事件监听器
   - 移除包装类型选择器的 `change` 事件处理
   - 简化 `addNewItem()` 函数逻辑

3. **优化数据收集 Optimized Data Collection:**
   - `collectFormData()` 不再收集发票条目的包装信息
   - 保持装箱单的包装数据完整性
   - 减少数据冗余

---

## 📊 数据结构变更 Data Structure Changes

### 发票条目 Invoice Item

**v2.2.x 结构 (Old Structure):**
```json
{
  "description": "Product description",
  "hs-code": "1234567890",
  "qty": 100,
  "uom": "PCS",
  "packageType": "Carton",          // ❌ 已移除
  "packages": 10,                   // ❌ 已移除
  "dimensions": "120×80×100",       // ❌ 已移除
  "grossWt": "500.00",              // ❌ 已移除
  "volume": "0.960",                // ❌ 已移除
  "netWt": "450.00",
  "unitPrice": "1.2345",            // 4位小数
  "amount": "123.45"                // 2位小数
}
```

**v2.3.0 结构 (New Structure):**
```json
{
  "description": "Product description",
  "hs-code": "1234567890",
  "qty": 100,
  "uom": "PCS",
  "netWt": "450.00",
  "unitPrice": "1.23456",           // ✅ 5位小数
  "amount": "123.45678"             // ✅ 5位小数
}
```

### 装箱单包装 Packing List Package

**保持不变 Unchanged:**
```json
{
  "packageType": "Carton",
  "packages": 10,
  "dimensions": "120×80×100",
  "grossWt": "50.00",
  "cbm": "0.096",
  "items": [
    {
      "description": "Product description",
      "hscode": "1234567890",
      "qty": 100,
      "uom": "PCS",
      "netWt": "45.00"
    }
  ]
}
```

---

## 🔄 向后兼容性 Backward Compatibility

### 兼容性说明 Compatibility Notes

✅ **完全兼容 Fully Compatible:**
- 装箱单功能完全保持不变
- 现有装箱单数据无需迁移
- Profile 管理功能不受影响
- 修订版本系统正常工作

⚠️ **需要注意 Attention Required:**
- 从 v2.2 导入的发票数据可能包含已废弃的包装字段
- 这些字段将被忽略，不会影响发票功能
- 建议重新确认发票内容，确保数据准确

### 数据迁移建议 Data Migration Recommendations

对于已有的 v2.2 发票数据：
1. 打开现有发票修订版本
2. 验证货物描述、数量、单价等核心信息
3. 重新确认修订版本（如需要）
4. 包装信息（如需要）应在装箱单中维护

For existing v2.2 invoice data:
1. Open existing invoice revisions
2. Verify core information like description, quantity, unit price
3. Re-confirm revision (if needed)
4. Packaging information (if needed) should be maintained in packing lists

---

## 🐛 修复的问题 Fixed Issues

### 总金额自动计算 Total Amount Auto-calculation

**问题描述 Issue:**
- 添加新发票条目后，总金额不会自动更新
- After adding new invoice items, total amount was not automatically updated

**修复方案 Fix:**
- 在 `addNewItem()` 函数末尾添加 `updateItemsAndTotals()` 调用
- 确保每次添加条目后立即重新计算总金额
- Added `updateItemsAndTotals()` call at the end of `addNewItem()` function
- Ensures total amount is recalculated immediately after adding items

**受影响文件 Affected Files:**
- `invoice_generator_v2.3.html:1879` - Added updateItemsAndTotals() call

---

## 🐛 已知问题 Known Issues

无 None reported

---

## 📦 文件清单 File Manifest

### 新增文件 New Files:
- `invoice_generator_v2.3.html` - 主应用文件（v2.3）
- `CHANGELOG_v2.3.md` - 本更新日志

### 更新文件 Updated Files:
- `index.html` - 更新至 v2.3.0
- `package.json` - 版本号更新至 2.3.0

### 保持不变 Unchanged:
- `manifest.json`
- `sw.js`
- `icon-*.png`
- `main.js`, `preload.js`
- All v2.0, v2.1, v2.2 files (archived)

---

## 🚀 升级指南 Upgrade Guide

### 从 v2.2 升级到 v2.3 Upgrading from v2.2 to v2.3

**步骤 Steps:**

1. **备份数据 Backup Data:**
   ```bash
   # 导出浏览器localStorage或备份已有文档
   # Export browser localStorage or backup existing documents
   ```

2. **更新文件 Update Files:**
   ```bash
   # 如果使用本地部署 If using local deployment
   git pull origin master
   # 或直接替换 invoice_generator_v2.3.html
   ```

3. **清除缓存 Clear Cache:**
   - 浏览器：按 Ctrl+Shift+R 强制刷新
   - PWA：重新安装应用
   - Browser: Press Ctrl+Shift+R to force refresh
   - PWA: Reinstall the app

4. **验证功能 Verify Functionality:**
   - [ ] 创建新发票，确认无包装字段
   - [ ] 测试单价输入5位小数（如 1.23456）
   - [ ] 测试金额显示5位小数（如 123.45678）
   - [ ] 验证总金额计算精度正确
   - [ ] 创建装箱单，确认包装功能正常
   - [ ] 加载旧的发票修订版本
   - [ ] Create new invoice, confirm no packaging fields
   - [ ] Test unit price with 5 decimal places (e.g., 1.23456)
   - [ ] Test amount display with 5 decimal places (e.g., 123.45678)
   - [ ] Verify total amount calculation precision
   - [ ] Create packing list, confirm packaging works
   - [ ] Load old invoice revisions

---

## 👥 贡献者 Contributors

- **Xuan Zhang** - 需求提出与测试 Requirements & Testing
- **Claude Code** - 代码实现与文档 Implementation & Documentation

---

## 📞 技术支持 Technical Support

如遇到问题，请联系：
If you encounter issues, please contact:

- Email: xuan.zhang@qhdpv.com
- 项目仓库 Project Repository: [GitHub Repository URL]

---

**🎉 感谢使用 QHD Invoice Generator！**

**Thank you for using QHD Invoice Generator!**
