# JM Boom

JM Boom 是可自托管的 JM 第三方漫画阅读器，通过浏览器访问，支持服务端图片缓存和离线下载。

## 部署说明

- 使用上游镜像 `ghcr.io/ppxb/jm-boom:v0.7.2`，支持 `linux/amd64` 和 `linux/arm64`。
- 默认 Web 端口为 `3000`，可在安装时修改。
- 安装时必须设置 Web 访问密码；打开页面后使用该密码进入应用。
- 图片缓存上限默认为 `5120 MB`，达到上限后按 LRU 策略自动清理至容量的一半；该设置针对封面和阅读图片缓存。
- SQLite 数据库、图片缓存和离线下载保存在挂载到 `/app/data` 的 Docker 命名卷 `jm-boom-data` 中，实际卷名由 Compose 项目名自动添加前缀。
- 镜像以 UID/GID `10001:10001` 运行，使用命名卷可沿用镜像内的数据目录权限；备份和迁移时请包含该数据卷，重建容器时保留数据卷即可保留数据。
- 镜像内置 `/health` 健康检查。

## 相关链接

- [项目主页与部署文档](https://github.com/ppxb/jm-boom)
- [容器镜像](https://github.com/ppxb/jm-boom/pkgs/container/jm-boom)

应用图标由上游 `v0.7.2` 的 `web/public/favicon.svg` 转换为 PNG。
