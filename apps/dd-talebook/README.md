# Talebook

Talebook 是一个基于 Calibre 构建的开源个人图书管理系统，提供现代化的 Web 界面，可用于管理、阅读和分享个人电子书库。

## 主要功能

- 支持 EPUB、PDF、MOBI、AZW3、TXT 等常见电子书格式
- 支持网页在线阅读和非 EPUB 格式自动转换
- 支持批量扫描导入、元数据补全和封面管理
- 支持多用户、私人模式、书架与阅读进度
- 支持 OPDS、WebDAV、网络书源和 Kindle 邮件推送
- 支持桌面端与移动端浏览

## 数据持久化

应用配置、用户数据库和书库文件统一保存在应用目录下的 `data` 目录中。升级或重建容器前，请先备份该目录。

## 使用说明

安装后通过配置的 Web 端口访问 Talebook，并按照初始化向导创建书库。推荐使用 1Panel 网站反向代理配置域名和 HTTPS。

若需要在 Talebook 内直接上传 SSL 证书，请按官方说明将 PUID 和 PGID 设置为 `0`；通常使用 1Panel 统一管理 HTTPS，无需修改。

## 相关链接

- [项目主页](https://www.talebook.org/)
- [GitHub 仓库](https://github.com/talebook/talebook)
- [使用文档](https://www.talebook.org/docs/)
