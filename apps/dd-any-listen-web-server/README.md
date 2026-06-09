<p align="center">
    <a href="https://github.com/any-listen/any-listen">
        <img height="110" src="./images/header-logo.svg" alt="any-listen logo"></a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="https://github.com/any-listen/any-listen">
        <img height="86" src="./images/header-name.svg" alt="any-listen name"></a>
    </p>

<p align="center">一款跨平台的私人音乐播放服务</p>


项目仍在积极开发中，目前提供 **桌面版** 与 **网页版服务**。

## 特性

- 添加并播放本地歌曲（普通列表、本地列表）
- 添加并播放存储于 WebDAV 的歌曲（远程列表）
- 在线匹配歌曲信息（封面、歌词等，需到扩展管理安装对应扩展）
- 实验性音效
- 卡拉 OK 歌词与标题栏歌词

## 桌面版

前往 Release 下载最新版本并安装即可：[https://github.com/any-listen/any-listen-desktop/releases](https://github.com/any-listen/any-listen-desktop/releases)

## 网页版

可以直接部署到服务器，或使用 Docker 部署。

### Docker 部署

镜像发布地址： [https://hub.docker.com/r/lyswhut/any-listen-web-server](https://hub.docker.com/r/lyswhut/any-listen-web-server)

1. 运行 Docker 容器

    > 注意：以下命令仅为示例，不能直接使用！

    ```bash
    docker run --volume=/home/music:/music --volume=/data:/server/data -p 8080:9500 -d test:latest
    ```

#### 环境变量

|           变量名            | 描述                                                                                     |
| :-------------------------: | ---------------------------------------------------------------------------------------- |
|           `PORT`            | 绑定端口，默认 `9500`                                                                    |
|          `BIND_IP`          | 绑定 IP，默认 `127.0.0.1`，设为 `0.0.0.0` 接受所有 IPv4 请求，设为 `::` 接受所有 IP 请求 |
|   `UPSTREAM_PROXY_HEADER`   | 代理转发请求头（如 `x-real-ip`），设置后自动启用代理                                     |
|     `ALLOW_PUBLIC_DIR`      | 允许访问的本地目录，多个目录用英文逗号分隔                                               |
|         `DATA_PATH`         | 数据存储路径，默认 `./data`                                                              |
|         `LOGIN_PWD`         | 登录密码                                                                                 |
|        `CONFIG_PATH`        | 配置文件路径，默认 `./data/config.js`                                                    |
|         `LOG_PATH`          | 日志存储路径，默认 `./data/logs`                                                         |
| `EXTENSION_GH_MIRROR_HOSTS` | 扩展商店 Github 镜像地址，多个地址用英文逗号分隔                                         |
|        `HTTP_PROXY`         | 代理服务器，例子 `127.0.0.1:2080`                                                        |

### 源码编译

```bash
pnpm install
pnpm run build:web
cd build
mkdir data
# 创建配置文件 config.cjs
node index.cjs
```