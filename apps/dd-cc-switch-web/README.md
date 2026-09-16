# CC Switch Web

CC Switch Web 是 CC Switch 的 Web 分支，可通过浏览器集中管理 Claude、Codex、Gemini、OpenCode、OpenClaw 和 OMO 等 AI 编程工具的供应商配置。

## 主要功能

- 管理并切换多个 AI CLI 工具的 Provider 配置
- 管理 MCP、Prompts、Skills、Sessions 与 Usage
- 支持 OpenClaw 配置、Workspace、Daily Memory 和会话管理
- 支持本地路由、Provider 健康检查和用量统计
- 支持配置备份、恢复和 WebDAV 同步

## 部署说明

- 默认 Web 端口为 `3000`。
- 应用数据持久化到安装目录下的 `data` 目录。
- Web 登录用户名为 `admin`，密码在首次启动时自动生成，保存在 `data/web_password`。
- Basic Auth 会保护所有 API；暴露到公网时仍建议通过 HTTPS 反向代理访问。
- `0.21.0` 镜像同时支持 `linux/amd64` 和 `linux/arm64`，可用于安装 64 位系统的树莓派。
- 容器管理的是自身持久化目录内的配置，不会自动修改宿主机上的 CLI 配置目录。

## 相关链接

- [项目主页](https://github.com/Laliet/cc-switch-web)
- [容器镜像](https://github.com/Laliet/cc-switch-web/pkgs/container/cc-switch-web)
