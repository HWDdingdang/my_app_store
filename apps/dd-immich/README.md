# Immich

Immich 是一个高性能、自托管的照片和视频备份与管理平台，支持 Web、Android 和 iOS 客户端，可用于构建个人照片云。

## 主要功能

- 自动备份手机照片和视频
- 时间线、相册、共享和多用户管理
- 基于机器学习的人脸识别、智能搜索和地图浏览
- 支持常见图片、视频及 RAW 格式
- 数据完全保存在自己的服务器上

## 部署说明

本应用基于 Immich v3.2.2 官方 Docker Compose 编排，包含 Immich Server、机器学习、Valkey 和 PostgreSQL 四个容器。安装完成后，通过配置的 Web 端口访问，首个注册用户将成为管理员。

官方建议至少准备 2 个 CPU 核心和 6 GB 内存。数据库目录必须位于支持 Unix 所有权和权限的本地文件系统上，不要放在 NFS、SMB 等网络共享中。

## 数据持久化

所有持久化数据保存在版本目录下的 `data` 目录：

- `data/library`：照片、视频、缩略图和备份文件
- `data/postgres`：PostgreSQL 数据库
- `data/model-cache`：机器学习模型缓存

升级、迁移或重建容器前，请同时备份 `library` 和 `postgres`。不要仅备份数据库或仅备份媒体库。

## 使用提示

- 安装时请将默认数据库密码改为仅包含字母和数字的强密码。
- 建议通过 1Panel 网站反向代理配置域名和 HTTPS。
- 移动端服务器地址填写 `https://你的域名`，或在局域网内填写 `http://服务器IP:端口`。
- Immich 不支持降级；升级前应阅读对应版本的发布说明并完成备份。

## 相关链接

- [项目主页](https://immich.app/)
- [GitHub 仓库](https://github.com/immich-app/immich)
- [官方文档](https://docs.immich.app/)
- [v3.2.2 发布说明](https://github.com/immich-app/immich/releases/tag/v3.2.2)
