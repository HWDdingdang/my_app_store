### 📝 2. 中文版自述文件：`README_zh.md`
---

# 1Panel 第三方应用商店扩展库

这是一个专为 **1Panel** 服务器管理面板打造的、由社区驱动的第三方应用商店扩展生态仓库。

本仓库允许独立开发者和服务器管理员通过精心编排的 Docker Compose 脚本，在生产环境服务器中安全地一键部署各类丰富的第三方应用。

---

## 🚀 当前已上架应用

本商店目前持续维护并上架了以下核心应用扩展：

* **`dd-dispatcharr`**: 针对高级媒体流管理设计的队列分发容器化工具。
* **`dd-iptv-api`**: 高性能 IPTV 流媒体 API 集中处理与流列表优化服务。
* **`dd-lunatv`**: 针对 LunaTV 播放平台深度定制的 Web 客户端部署引擎。

---

## ⏰ 通过 1Panel 计划任务实现自动定时同步（强烈推荐）

无需每次手动去服务器里敲命令，你可以直接利用 1Panel 自带的**计划任务**功能，让面板定时自动拉取更新此商店的应用。

### 配置步骤：
1. 登录您的 **1Panel 面板** -> 点击左侧边栏的 **计划任务**。
2. 点击 **创建计划任务**，并配置以下关键参数：
   * **任务类型**: Shell 脚本
   * **任务名称**: 定时同步第三方应用商店
   * **执行周期**: 建议设置为“每天”或“每小时”（根据您的更新频率而定）
3. 在弹出的 **脚本内容** 输入框中，直接粘贴以下全自动流水线代码：

```bash
#!/bin/bash
set -e

# 从主仓库动态下载最新版同步引擎并执行
curl -sSO [https://raw.githubusercontent.com/HWDdingdang/my_app_store/main/sync.sh](https://raw.githubusercontent.com/HWDdingdang/my_app_store/main/sync.sh)
chmod +x sync.sh
sudo ./sync.sh
rm -f sync.sh
