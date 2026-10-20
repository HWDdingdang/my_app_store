# New API

New API 可将多家模型服务接入同一个 API 入口，并通过 Web 控制台管理渠道、用户密钥、模型权限与调用成本。

## 部署说明

- 镜像固定为 `calciumion/new-api:v1.0.0-rc.45`，这是上游候选版本（RC）。
- 使用 SQLite 单实例部署，无需额外安装数据库或 Redis。
- 默认 Web 端口为 `3000`，可在安装表单中修改；安装后访问 `http://服务器地址:端口`，按初始化向导创建管理员账号。
- 安装时填写独立的随机会话密钥，例如通过 `openssl rand -hex 32` 生成，并长期保存。更新或重建容器时继续使用原值。
- 版本目录提供 `.env` 默认配置；直接使用 Docker Compose 部署时，先填写其中的 `SESSION_SECRET`，再启动服务。
- 数据库和应用数据保存在安装目录的 `data` 中，运行日志保存在 `logs` 中。升级前停止应用并备份这两个目录及会话密钥。
- 通过 HTTPS 反向代理访问时，将安装表单的“安全 Cookie”设为 `true`，并填写控制台 HTTPS Origin，例如 `https://api.example.com`。多个 Origin 用英文逗号分隔，不包含路径、末尾斜杠或通配符；HTTP 访问时保持 `false` 并留空 Origin。
- 使用 1Panel 配置反向代理时，启用 WebSocket 支持，并关闭流式响应的代理缓冲。

## 开始使用

1. 在控制台添加渠道，配置上游密钥和模型，并执行渠道测试。
2. 配置模型价格，为用户分配额度，再创建可访问对应模型的 API 密钥。
3. OpenAI 兼容客户端的 Base URL 填写 `http://服务器地址:端口/v1`，使用 New API 控制台签发的密钥；配置 HTTPS 后改用对应域名。

## 相关链接

- [项目主页与中文说明](https://github.com/QuantumNous/new-api/blob/main/README.zh_CN.md)
- [版本发布说明](https://github.com/QuantumNous/new-api/releases/tag/v1.0.0-rc.45)
- [官方文档](https://docs.newapi.ai/zh/docs)
- [环境变量说明](https://docs.newapi.ai/zh/docs/installation/config-maintenance/environment-variables)
- [图标来源](https://github.com/QuantumNous/new-api/blob/v1.0.0-rc.45/web/public/logo.png)
