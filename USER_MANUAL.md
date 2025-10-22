
# 用户使用手册 (User Manual)

感谢您使用东吴电子发票生成平台。本手册将引导您了解如何有效使用本平台。

Thank you for using the QHD Electronic Invoice Generation Platform. This manual will guide you on how to use this platform effectively.

---

## 目录 (Table of Contents)

1.  [**简介 (Introduction)**](#introduction)
2.  [**核心功能 (Core Features)**](#core-features)
3.  [**安装指南 (Installation Guide)**](#installation-guide)
4.  [**快速入门 (Quick Start)**](#quick-start)
    *   [创建新发票 (Creating a New Invoice)](#creating-a-new-invoice)
    *   [创建装箱单 (Creating a Packing List)](#creating-a-packing-list)
    *   [管理信息模板 (Managing Profiles)](#managing-profiles)
    *   [版本与打印 (Revisions and Printing)](#revisions-and-printing)
5.  [**数据存储 (Data Storage)**](#data-storage)
6.  [**技术支持 (Support)**](#support)

---

<a name="introduction"></a>
## 1. 简介 (Introduction)

东吴电子发票生成平台是一个现代化的网页应用程序，旨在简化创建、管理和打印商业发票、形式发票和装箱单的流程。它完全在您的浏览器中运行，所有数据都安全地存储在您的本地设备上，无需连接互联网。

The QHD Electronic Invoice Generation Platform is a modern web application designed to simplify the process of creating, managing, and printing commercial invoices, proforma invoices, and packing lists. It runs entirely in your browser, and all data is securely stored on your local device, requiring no internet connection for operation.

---

<a name="core-features"></a>
## 2. 核心功能 (Core Features)

*   **多种单据类型 (Multiple Document Types)**: 支持创建标准发票 (Invoice)、商业发票 (Commercial Invoice), 形式发票 (Proforma Invoice) 和装箱单 (Packing List)。
*   **信息模板管理 (Profile Management)**: 保存和管理常用的发货方 (Shipper)、收货方 (Consignee) 和付款方 (Bill To) 信息，方便快速调用。
*   **自动计算 (Automatic Calculation)**: 自动计算货物总价。同时也支持手动修改。
*   **智能编号 (Smart Numbering)**: 发票号码默认根据日期生成，并自动递增序号，同时支持手动修改。
*   **版本历史 (Revision History)**: 自动保存每次确认的单据版本，可以随时查看、加载或删除历史版本。
*   **离线使用 (Offline Use)**: 作为一个渐进式网络应用 (PWA)，您可以将其“安装”到桌面或手机主屏幕，实现类似原生应用的离线使用体验。
*   **打印优化 (Print Optimization)**: 一键生成专为打印优化的页面，确保纸质输出的专业性。
*   **数据本地存储 (Local Data Storage)**: 所有信息均存储在您浏览器的本地存储空间中，确保数据私密性和安全性。

---

<a name="installation-guide"></a>
## 3. 安装指南 (Installation Guide)

我们提供了两种安装和运行方式：**脚本自动安装** (推荐) 和 **手动安装**。

We offer two methods for installation and operation: **Automated Script Install** (Recommended) and **Manual Install**.

### 方式一：使用脚本自动安装 (Method 1: Automated Script Install)

这是最简单快捷的方式。脚本会自动为您启动一个本地服务器。

This is the easiest and quickest method. The script will automatically start a local server for you.

*   **Windows 用户**:
    1.  确保您的电脑已经安装了 [Python](https://www.python.org/downloads/)。
    2.  双击 `install.bat` 文件。
    3.  脚本会自动在您的默认浏览器中打开应用。请保持该命令行窗口不要关闭。

*   **macOS 用户**:
    1.  确保您的电脑已经安装了 [Python 3](https://www.python.org/downloads/)。
    2.  双击 `install.command` 文件。
    3.  脚本会自动在您的默认浏览器中打开应用。请保持该终端窗口不要关闭。

> **提示**: 脚本启动后，会显示一个局域网地址 (如 `http://192.168.x.x:8080/...`)。您可以将此地址分享给在同一个网络下的同事，他们也可以访问和使用这个发票平台。

### 方式二：手动安装为PWA应用 (Method 2: Manual PWA Installation)

如果您不想通过脚本运行，也可以直接在浏览器中打开文件并将其安装为桌面应用。

If you prefer not to run the script, you can open the file directly in your browser and install it as a desktop application.

**桌面端 (Desktop - Chrome/Edge):**

1.  在浏览器中直接打开 `invoice_generator_v2.0.html` 文件。
2.  点击地址栏右侧出现的“安装”图标 (通常是一个显示器和向下箭头的图标)。
3.  在弹出的对话框中点击“安装”。
4.  之后，您可以在桌面或开始菜单中找到应用图标，直接启动。

**移动端 (Mobile - Safari/Chrome):**

1.  将项目文件夹部署在Web服务器上，并通过手机浏览器访问 `invoice_generator_v2.0.html`。
2.  点击浏览器菜单中的“分享”按钮。
3.  在分享选项中，选择“添加到主屏幕 (Add to Home Screen)”。
4.  应用图标将出现在您的手机主屏幕上。

---

<a name="quick-start"></a>
## 4. 快速入门 (Quick Start)

<a name="creating-a-new-invoice"></a>
### 创建新发票 (Creating a New Invoice)

1.  **选择单据类型**: 在页面顶部的“基础设置”中，确保选择了“发票 (Invoice)”。然后根据需要选择“普通发票”、“商业发票”或“形式发票”。
2.  **填写发票信息**:
    *   **发票日期 (Invoice Date)**: 选择日期后，下方的“发票号码”会根据日期自动生成。
    *   **发票号码 (Invoice No.)**: 系统会自动填充，您也可以手动修改。
    *   **订单号 (Order No.)**: 填写客户的订单号。
3.  **填写相关方信息**:
    *   从“发货方 (Shipper)”、“收货人 (Consignee)”和“付款方 (Bill To)”的下拉菜单中选择预存的模板，或手动填写。
4.  **添加货物明细 (Line Items)**:
    *   点击“+ 添加新条目 (+ Add Item)”按钮。
    *   在条目卡片中填写货物描述、数量、单价等信息。金额会自动计算。
5.  **确认与打印**:
    *   **步骤1：确认修订 (Step 1: Confirm Revision)**: 填写完毕后，点击此按钮。系统将保存当前版本并锁定表单，防止意外修改。
    *   **步骤2：打开打印视图 (Step 2: Open Print View)**: 点击后，浏览器会新开一个标签页显示专为打印设计的发票样式。您可以在该页面使用浏览器的打印功能 (Ctrl/Cmd + P) 将其打印或另存为PDF。

<a name="creating-a-packing-list"></a>
### 创建装箱单 (Creating a Packing List)

1.  **选择单据类型**: 在“基础设置”中，选择“装箱单 (Packing List)”。
2.  **填写基础信息**: 填写装箱单号码、日期、参考发票号等。
3.  **添加货物明细**: 与发票类似，但信息字段变为包装相关的，如包装类型、尺寸、毛重、净重等。
4.  **确认与打印**: 流程与创建发票相同。

<a name="managing-profiles"></a>
### 管理信息模板 (Managing Profiles)

在“发货方”、“收货人”或“付款方”区域，点击“管理 (Manage)”按钮，会弹出管理窗口。在此窗口中，您可以：

*   **添加 (Add)**: 填写信息后点击“保存”。
*   **编辑 (Edit)**: 点击列表中的“编辑”按钮，修改后保存。
*   **删除 (Delete)**: 点击“删除”按钮。

<a name="revisions-and-printing"></a>
### 版本与打印 (Revisions and Printing)

*   每次点击 **确认修订** 都会在右侧的“修订历史 (Revision History)”中生成一条记录。
*   您可以点击历史记录中的任意版本来查看当时的数据。此时表单为只读状态。
*   要返回编辑，可以点击“新建修订 (Start New Revision)”按钮，系统会自动进入下一个版本号并解锁表单。

---

<a name="data-storage"></a>
## 5. 数据存储 (Data Storage)

本平台使用浏览器的 `localStorage` 技术在您的本地计算机上存储所有数据。

*   **优点**: 数据私密、安全，且可以离线访问。
*   **注意**:
    *   清除浏览器缓存或历史记录时，如果勾选了“清除网站数据”或类似选项，可能会导致所有已存的发票和模板信息丢失。
    *   数据不会在不同设备或不同浏览器之间同步。

---

<a name="support"></a>
## 6. 技术支持 (Support)

如果您在使用过程中遇到任何问题或有功能建议，请联系开发者。

If you encounter any issues or have suggestions for new features, please contact the developer.

**开发者 (Developer):** Xuan Zhang
**邮箱 (Email):** xuan.zhang@qhdpv.com
