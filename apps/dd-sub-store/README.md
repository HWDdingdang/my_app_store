# Sub-Store

Sub-Store 是高级代理订阅管理工具，支持多种客户端格式之间的订阅转换，以及节点筛选、重命名、排序、订阅合并、文件托管和 Gist 同步。

## 部署说明

- 使用官方文档推荐的 `xream/sub-store:2.43.1` 镜像，内置 Web 前端与后端。
- 默认 Web 端口为 `3001`，可在安装时修改。
- 应用数据持久化到安装目录下的 `data` 目录，对应容器内 `/opt/app/data`。
- 后端 API 仅在容器内的 `127.0.0.1:3000` 监听，通过前端的自定义路径转发访问。
- 镜像支持 `linux/amd64`、`linux/arm64` 和 `linux/arm/v7`。
- 本版本使用标准镜像，不包含 HTTP-META；节点测活等依赖 HTTP-META 的脚本需要额外部署相应服务。

## 安装与访问

1. 在 1Panel 安装表单中填写后端访问密钥，建议使用至少 32 位随机字母和数字，不含斜杠或其他特殊符号。可在服务器上运行 `openssl rand -hex 24` 生成。
   使用 Docker Compose 手动部署时，在版本目录的 `.env` 中填写 `SUB_STORE_BACKEND_TOKEN`，并按需修改端口和 CORS 来源；密钥默认为空，填写后才能启动。
2. 访问 `http://服务器IP:3001` 打开前端（修改端口后使用实际端口）。
3. 在前端「我的」中将后端地址设为 `http://服务器IP:3001/你的后端访问密钥`，也可直接访问：

   ```text
   http://服务器IP:3001?api=http://服务器IP:3001/你的后端访问密钥
   ```

4. 在 CORS 允许来源中填写实际访问前端的 Origin，例如 `http://服务器IP:3001` 或 `https://sub.example.com`。多个来源使用逗号分隔，不含路径和末尾斜杠；默认保留官方前端来源。

后端访问密钥会作为 `SUB_STORE_FRONTEND_BACKEND_PATH` 的路径部分使用，安装配置自动添加开头的 `/`。请妥善保存该密钥；修改后需要同步更新前端及客户端中的后端地址。应用没有独立的账号密码登录，公网访问建议配置 HTTPS 反向代理，避免分享包含密钥的管理地址。

排查连接时，可访问 `http://服务器IP:3001/你的后端访问密钥/api/utils/env` 查看后端版本信息。使用 HTTPS 反向代理时，上述前端、后端及 CORS 来源均应改用实际的 HTTPS 域名。

## 相关链接

- [项目主页](https://github.com/sub-store-org/Sub-Store)
- [官方安装文档](https://sub-store-org.github.io/doc/guide/installation)
- [Docker 镜像与环境变量说明](https://hub.docker.com/r/xream/sub-store)
- [镜像版本与支持架构](https://hub.docker.com/r/xream/sub-store/tags)
- [图标来源](https://github.com/sub-store-org/Sub-Store-Front-End/blob/master/public/512x512.png)
