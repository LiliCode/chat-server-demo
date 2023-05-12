# 基于 Dart 的聊天后端 demo

- 基于 WebSocket 的聊天服务
- 基于 Alfred 框架的 WebServer 实现后端接口
- 使用 Sqlite3 的数据库存储用户数据

## 快速使用

下面以 Ubuntu 20.04 系统为例

1. 安装 Dart 执行环境(已安装跳过)，地址: <https://dart.cn/get-dart>
2. 安装 Sqlite3 依赖

    ```shell
    sudo apt-get install sqlite3
    ```
3. 执行命令运行
    ```shell
    dart pub get
    dart run
    ```
    如果报一下错误:
    ```
    Invalid argument(s): Failed to load dynamic library 'libsqlite3.so': libsqlite3.so: cannot open shared object file: No such file or directory
    ```
    可以安装 libsqlite3-dev 解决问题

    ```shell
    sudo apt-get install -y libsqlite3-dev
    ```