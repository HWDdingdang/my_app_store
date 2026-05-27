# 🎬 Dispatcharr — 你的 IPTV 与 Stream 管理工具

<!-- <p align="center">
  <img src="https://github.com/Dispatcharr/Dispatcharr/blob/main/frontend/src/images/logo.png?raw=true" height="200" alt="Dispatcharr Logo" />
</p> -->

---

## 📖 什么是 Dispatcharr？

Dispatcharr，发音类似 “dispatcher”，是一个开源工具，用于管理 IPTV streams、EPG data 和 VOD content。

它起源于实际需求，最初是 **[OkinawaBoss](https://github.com/OkinawaBoss)** 的个人项目，后来在 **[dekzter](https://github.com/dekzter)**、**[SergeantPanda](https://github.com/SergeantPanda)** 和 **Bucatini** 等人的贡献下逐步发展。

> 可以把 Dispatcharr 理解为 *arr 家族里的 IPTV 表亲：简单、智能，并为需要稳定性和灵活性的 streamers 而设计。

---

## 🎯 Dispatcharr 可以做什么？

Dispatcharr 可以帮助你完整管理 IPTV。下面是一些常见使用场景。

### 💡 整合多个 IPTV Sources

将多个 providers 的 streams 合并到一个界面中。你可以管理、过滤和整理大量 channels。

### 📺 集成到 Media Centers

通过 HDHomeRun emulation，为 **Plex**、**Emby** 或 **Jellyfin** 添加 virtual tuners。它们会将 Dispatcharr 识别为 live TV source，并可以直接录制节目到各自的 DVR libraries。

### 📡 创建个人 TV 生态

将 live TV channels 与自定义 EPG guides 合并。可以生成 XMLTV schedules，也可以使用自动匹配功能，将 channels 与已有节目数据对齐。

支持导出为：

- M3U
- Xtream Codes API
- HDHomeRun device

### 🔧 Transcode 与优化 Streams

通过 FFmpeg transcoding 配置 output profiles，为不同 clients 优化 streams，例如降低带宽、统一格式或增加音频标准化。

### 🔐 集中化 VPN Access

可以让 Dispatcharr 通过 VPN container，例如 Gluetun，运行，使所有 streams 都经过同一个 VPN 连接。

这样 clients 无需各自配置 VPN，也能访问受地域限制的内容，同时降低带宽开销并简化网络管理。

### 🚀 实时监控与管理

实时跟踪：

- active streams
- client connections
- bandwidth usage
- buffering events
- stream quality

当 streams 失败时，automatic failover 会让 viewers 保持连接，并无缝切换到 backup sources。

### 👥 安全共享访问

可以创建多个 user accounts，并配置细粒度 permissions。

支持通过以下方式共享 streams：

- M3U playlists
- Xtream Codes API

同时可以控制不同 users 能访问哪些 channels、profiles 或 features。也支持基于网络的访问限制，以增强安全性。

### 🔌 通过 Plugins 扩展

使用 Dispatcharr 的 plugin system 构建自定义 integrations。可以自动化任务、连接外部服务，或增加全新的 workflows。

---

## ✨ 为什么选择 Dispatcharr？

- ✅ **Stream Proxy & Relay** — 拦截并代理 IPTV streams，支持实时 client management
- ✅ **M3U & Xtream Codes** — 导入、过滤和整理 playlists，支持多个 backend
- ✅ **EPG Matching & Generation** — 自动将 EPG 匹配到 channels，或生成自定义 TV guides
- ✅ **Video on Demand** — 通过 metadata 以及 IMDB/TMDB integration 播放 movies 和 TV series
- ✅ **Multi-Format Output** — 支持导出为 M3U、XMLTV EPG、Xtream Codes API 或 HDHomeRun device
- ✅ **Real-Time Monitoring** — 实时连接统计、bandwidth tracking 和 automatic failover
- ✅ **Stream Profiles** — 配置 Dispatcharr 如何连接 backend streams，例如 VLC、FFmpeg、Streamlink 或自定义 commands
- ✅ **Output Profiles** — 在 stream profiles 输出到 client 之前进行 transcode，例如为 media servers 输出 AC3，为 browsers 输出 AAC，并可选择 fMP4 或 MPEG-TS container
- ✅ **Multi-User & Access Control** — 细粒度 permissions 与基于网络的访问限制
- ✅ **Plugin System** — 通过 custom plugins 扩展自动化和 integrations
- ✅ **Fully Self-Hosted** — 完全自托管，总控制权在你手里，没有第三方依赖

---

## Screenshots

---

## 🛠️ Troubleshooting & Help

- **General help?** 访问 [Dispatcharr Docs](https://dispatcharr.github.io/Dispatcharr-Docs/)
- **Community support?** 加入 [Discord](https://discord.gg/Sp45V5BcxU)

---

## 🚀 几分钟内开始使用

### 🐳 使用 Docker 快速开始，推荐方式

```bash
docker pull ghcr.io/dispatcharr/dispatcharr:latest
docker run -d \
  -p 9191:9191 \
  --name dispatcharr \
  -v dispatcharr_data:/data \
  ghcr.io/dispatcharr/dispatcharr:latest
```

> 可以根据你的部署环境自定义 ports 和 volumes。

---

## 🐋 Docker Compose 选项

| 使用场景 | 文件 | 说明 |
| --- | --- | --- |
| **All-in-One Deployment** | [docker-compose.aio.yml](docker/docker-compose.aio.yml) | 推荐。简单的一体化方案，所有组件运行在单个 container 中，适合快速部署。 |
| **Modular Deployment** | [docker-compose.yml](docker/docker-compose.yml) | Dispatcharr、Celery、Redis 和 Postgres 分别运行在独立 containers 中，适合需要更细粒度控制的场景。 |
| **Development Environment** | [docker-compose.dev.yml](docker/docker-compose.dev.yml) | 面向开发者的环境，预配置 ports 和 settings，适合贡献代码和测试。 |

---

## 🛠️ 从源码构建

> ⚠️ **Warning**：官方不正式支持这种方式；但如果你选择这样做，说明你知道自己在做什么。

如果你运行的是 Debian-based OS，可以使用 `debian_install.sh` 脚本。

如果你使用其他 OS，可以贡献对应脚本，项目会考虑加入。

---

## 🤝 想要贡献？

欢迎提交：

- PRs
- issues
- ideas
- suggestions

贡献之前，请阅读：

[CONTRIBUTING.md](https://github.com/Dispatcharr/Dispatcharr/blob/main/CONTRIBUTING.md)

无论是编写 docs、修复 bugs，还是构建新 features，你的贡献都很重要。

---

## 📚 Documentation & Roadmap

- 📖 **Documentation:** [Dispatcharr Docs](https://dispatcharr.github.io/Dispatcharr-Docs/)

### Upcoming Features

顺序不分先后：

- 🎬 **VOD Management Enhancements** — 更细粒度的 metadata 控制，以及清理不需要的 VOD content
- 📁 **Media Library** — 导入本地文件，并通过 XC API 提供服务
- 👥 **Enhanced User Management** — 针对每个 user account 自定义 XC API output
- 🔌 **Fallback Videos** — 当 channels 不可用时，自动使用 fallback content

---

## ❤️ Shoutouts

感谢所有支撑 Dispatcharr 的优秀 open-source projects 和 libraries。

---

## ✉️ Connect With Us

有问题？想建议 feature？或者只是想打个招呼？

可以通过以下方式联系：

- [Open an issue](https://github.com/Dispatcharr/Dispatcharr/issues)
- [Discord](https://discord.gg/Sp45V5BcxU)

---

## 💖 Support Dispatcharr

[![Dispatcharr Open Collective](https://opencollective.com/dispatcharr/tiers/badge.svg)](https://opencollective.com/dispatcharr/contribute)

Open Collective 为所有认为 Dispatcharr 有价值的人提供了一种透明的支持方式，可用于：

- Infrastructure costs，例如 Domains、Servers 等
- Apple Developer Program 和 Google Play Developer accounts
- 帮助 contributors 投入更多时间改进项目

支持完全自愿，Dispatcharr 将始终保持 free 和 open-source。

[Contribute here](https://opencollective.com/dispatcharr/contribute)

---

## ⚖️ License & Legal

Dispatcharr 使用 **GNU AGPL v3.0** 授权。完整 license 详情见：

[LICENSE](https://www.gnu.org/licenses/agpl-3.0.html)

Dispatcharr 是 Dispatcharr project 的 trademark。使用 Dispatcharr name 或 logo 需要获得 maintainers 的许可。

---

### 🚀 Happy Streaming! Dispatcharr Team