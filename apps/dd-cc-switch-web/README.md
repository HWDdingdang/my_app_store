# CC Switch Web

CC Switch Web 是 CC Switch 的 Web 分支，可通过浏览器集中管理 Claude、Claude Desktop、Codex、Gemini、Grok Build、OpenCode、OpenClaw、Hermes 和 Pi 等 AI 编程工具的供应商配置。

## 主要功能

- 管理并切换多个 AI CLI 工具的 Provider 配置
- 管理 MCP、Prompts、Skills、Sessions 与 Usage
- 展示 Claude、Codex、Gemini 的官方订阅额度
- 支持 Codex OAuth 托管账号和 Provider 用量查询
- 支持配置备份、恢复和 WebDAV 同步

## 部署说明

- 默认 Web 端口为 `8890`。
- 应用数据持久化到安装目录下的 `data` 目录。
- 可设置访问密钥保护 Web API；密钥必须至少包含 16 个字符。未设置时应用以无认证模式运行。
- 暴露到局域网或公网时，建议启用访问密钥并通过 HTTPS 反向代理访问。
- 当前官方 GHCR 运行镜像仅提供 `linux/amd64` 架构。
- 容器默认只管理其持久化目录内的配置，不会自动挂载或修改宿主机上的 CLI 配置目录。

## 相关链接

- [项目主页](https://github.com/zuoliangyu/cc-switch-web)
- [容器镜像](https://github.com/zuoliangyu/cc-switch-web/pkgs/container/cc-switch-web)
