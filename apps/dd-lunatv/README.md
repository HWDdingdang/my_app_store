# 🎬 LunaTV (MoonTV) — 跨平台影视聚合播放站

---

## 📖 什么是 LunaTV？

LunaTV（也称 MoonTV）是一个开箱即用的、跨平台的影视聚合播放器，基于 Next.js 14 + Tailwind CSS + TypeScript 构建。

它支持多源搜索、在线播放、收藏同步、观看历史记录和云存储等功能。

> 注意：LunaTV 是一个空壳项目，无内置播放源和直播源，需要自行配置视频源 API。

---

## 🎯 LunaTV 可以做什么？

- ✅ **多源聚合搜索** — 支持多个视频源同时搜索
- ✅ **在线播放** — 支持多种视频格式在线播放
- ✅ **收藏同步** — 收藏的视频跨设备同步
- ✅ **观看历史** — 记录和管理观看历史
- ✅ **云存储** — 支持 Kvrocks / Redis / Upstash 存储后端
- ✅ **跨平台** — 基于 Web，支持所有平台
- ✅ **完全自托管** — 数据掌握在自己手中

---

## 🚀 快速开始

### 🐳 Docker 部署（推荐）

```bash
docker pull ghcr.io/moontechlab/lunatv:latest
docker run -d \
  -p 3000:3000 \
  --name lunatv \
  -e USERNAME=admin \
  -e PASSWORD=your_password \
  -e NEXT_PUBLIC_STORAGE_TYPE=kvrocks \
  -e KVROCKS_URL=redis://lunatv-kvrocks:6666 \
  ghcr.io/moontechlab/lunatv:latest
```

---

## ⚙️ 环境变量

| 变量 | 必填 | 说明 |
| :--- | :---: | :--- |
| USERNAME | 是 | 管理员账号 |
| PASSWORD | 是 | 管理员密码 |
| NEXT_PUBLIC_STORAGE_TYPE | 是 | 存储类型：kvrocks / redis / upstash |
| KVROCKS_URL | 条件 | Kvrocks 连接地址 |
| REDIS_URL | 条件 | Redis 连接地址 |
| UPSTASH_URL | 条件 | Upstash Redis HTTPS 地址 |
| UPSTASH_TOKEN | 条件 | Upstash Redis Token |
| SITE_BASE | 否 | 站点 URL |
| NEXT_PUBLIC_SITE_NAME | 否 | 站点名称（默认 MoonTV） |
| ANNOUNCEMENT | 否 | 站点公告 |

---

## 📚 更多信息

- **GitHub:** [MoonTechLab/LunaTV](https://github.com/MoonTechLab/LunaTV)
- **Docker 镜像:** `ghcr.io/moontechlab/lunatv:latest`

---

## ⚖️ 许可证

MIT License © 2025 MoonTV & Contributors
