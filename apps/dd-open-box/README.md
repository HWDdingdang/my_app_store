# Open-Box

Open-Box 是基于 sing-box 的一体化透明代理工具，可在 Web 面板中管理订阅、节点、分流规则和 DNS。本应用部署官方 Docker 旁路由，使用独立的局域网 IPv4 地址。

## 版本策略

- 按所提供的 Release 固定为 `0.1.427`，镜像名为 `open-box:0.1.427`。
- 推荐使用固定版本号。更新频繁时，固定版本有利于确认运行版本、排查问题和恢复旧环境；升级前备份 `etc`、`data`，之后按新 Release 添加版本目录。
- 上游目前只通过 GitHub Release 分发 Docker 镜像归档，没有可直接 `docker pull` 的官方镜像仓库，因此本应用不提供 `latest`。Compose 设置 `pull_policy: never`，安装前必须先导入对应版本镜像。
- 本仓库只提供部署配置，不再分发上游镜像或程序。Open-Box 自有程序为闭源专有软件，使用条件以[上游许可](https://github.com/liandu2024/Open-Box/blob/main/LICENSE)为准。

## 部署前准备

- 服务器需运行 Linux Docker Engine，架构为 `amd64/x86_64` 或 `arm64/aarch64`，并具备 `/dev/net/tun` 和 nftables 支持；不支持 Docker Desktop、rootless Docker 或 host 网络。
- 为容器预留一个与主路由同网段、未占用且在 DHCP 地址池之外的 IPv4 地址，不能与宿主机或主路由地址相同。
- 确认宿主机连接局域网的网卡名称、网段和主路由地址。表单中的 `eth0`、`192.168.1.0/24`、`192.168.1.1` 是示例，须按实际网络修改。
- 默认使用 `macvlan`；虚拟机或交换机限制额外 MAC 地址时，可选择 `ipvlan`，使用其默认 L2 模式。

### 导入官方镜像

在运行 1Panel 的 Linux Docker 节点上，以有 Docker 权限的用户执行以下命令。脚本按 Docker 节点架构选择归档，下载 SHA256 文件并校验，通过后才导入：

```sh
(
  set -eu
  version=0.1.427
  case "$(docker info --format '{{.Architecture}}')" in
    x86_64|amd64) arch=x64 ;;
    aarch64|arm64) arch=arm64 ;;
    *) echo '仅支持 x64 / arm64 架构' >&2; exit 1 ;;
  esac
  file="open-box-docker-${version}-linux-${arch}.tar.gz"
  base_url="https://github.com/liandu2024/Open-Box/releases/download/v${version}"
  curl -fL --retry 3 -o "$file" "$base_url/$file"
  curl -fL --retry 3 -o "$file.sha256" "$base_url/$file.sha256"
  sha256sum -c "$file.sha256"
  docker load -i "$file"
  docker image inspect --format '{{.RepoTags}} {{.Architecture}}' "open-box:$version"
)
```

也可以从 [v0.1.427 Release](https://github.com/liandu2024/Open-Box/releases/tag/v0.1.427) 手动下载对应架构的归档和同名 `.sha256` 文件，上传到服务器后校验并执行 `docker load -i <归档文件>`。不要执行上游完整安装脚本另建同名容器，后续由 1Panel 管理本应用。

## 安装与访问

1. 同步本商店，在 1Panel 的「应用商店 → 本地应用」刷新，选择 `dd Open-Box` 的 `0.1.427`。
2. 填写容器独立 IPv4、宿主机网卡、局域网网段和主路由地址，按需选择网络驱动和面板端口（默认 `3036`）。
3. 安装时关闭「拉取镜像」或「强制拉取镜像」选项，使用已导入的本地镜像。部分 1Panel 版本会独立尝试拉取镜像，不受 Compose 的 `pull_policy` 控制；若出现拉取失败，先确认镜像已在当前节点正确导入，并选择使用本地镜像。
4. 从另一台局域网设备打开 `http://容器IPv4:3036`（修改端口后使用实际端口）。1Panel 的默认跳转地址可能使用服务器 IP，请手动使用容器 IP。
5. 查看面板密码：`docker exec open-box open-box password`，修改容器名称后替换命令中的 `open-box`。
6. 在面板添加订阅或节点并启动内核，先将一台测试终端的 IPv4 网关和 DNS 设为容器 IP，确认分流正常后再扩大使用范围。

容器使用独立 LAN 网络，不映射宿主机端口，也不接入 `1panel-network`。宿主机通常不能直接访问自己的 macvlan / ipvlan 子接口，面板应从其他局域网设备访问。需要反向代理时，须先解决宿主机到容器 IP 的连通性。

## 数据与升级

- 安装目录下的 `etc` 映射到 `/opt/open-box/etc`，保存运行配置和证书。
- 安装目录下的 `data` 映射到 `/opt/open-box/data`，保存数据库、订阅、规则集和统计等数据。
- 容器仅添加 `NET_ADMIN`、`NET_RAW` 和 TUN 设备权限，开启容器内 IPv4 转发并关闭 ICMP 重定向；默认启用 NAT。
- 升级前备份上述两个目录并保存网络参数。导入新版镜像后，通过商店对应的新版本升级，保留数据卷和原面板端口；容器版通过更换镜像升级程序与 Geo 数据。
- 切回旧镜像时，数据格式可能不兼容，需要时同时恢复升级前的数据备份。
- 当前 Docker 旁路由只接管 IPv4；IPv6 默认仍经主路由。需要全流量接管时，应在主路由或终端调整 IPv6。
- 停止内核也会停止容器 DNS；停用或卸载前，应先把终端的网关和 DNS 恢复为主路由地址。

手动使用 Compose 时，进入 `0.1.427` 目录，先修改 `.env` 的网络参数并填写 `OPENBOX_LAN_IP`，再运行 `docker compose config` 和 `docker compose up -d`。

## 相关链接

- [项目主页](https://github.com/liandu2024/Open-Box)
- [指定版本 Release](https://github.com/liandu2024/Open-Box/releases/tag/v0.1.427)
- [官方 Docker 部署说明](https://github.com/liandu2024/Open-Box/blob/main/docker/README.md)
- [官方 Compose 配置](https://github.com/liandu2024/Open-Box/blob/main/docker/compose.yaml)
- [图标来源](https://github.com/liandu2024/Open-Box/blob/main/docs/pic/logo.png)
