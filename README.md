# 基于 Dart 的聊天后端 demo

- 基于 WebSocket 的聊天服务
- 基于 Alfred 框架的 WebServer 实现后端接口
- 使用 Sqlite3 的数据库存储用户数据

## 快速使用

下面以 Ubuntu 20.04 系统为例

1. 安装 Dart 执行环境(已安装请跳过)，地址: <https://dart.cn/get-dart>
2. 安装 Sqlite3 依赖

    ```shell
    sudo apt-get install sqlite3
    ```
3. 更改数据库的路径，在 `./lib/sqlite_db/database.dart` 文件中更改 `_dbPath` 变量 (已更改请忽略)
4. 执行命令直接运行（不打包）
    ```shell
    dart pub get
    dart run
    ```
    如果报下面错误:
    ```
    Invalid argument(s): Failed to load dynamic library 'libsqlite3.so': libsqlite3.so: cannot open shared object file: No such file or directory
    ```
    可以安装 libsqlite3-dev 解决问题

    ```shell
    sudo apt-get install -y libsqlite3-dev
    ```
    
5. 打包运行（AOT方式，详情请参考官方文档 https://dart.cn/tools/dart-compile#aot-snapshot）

   1. 运行 `build_aot.sh` 这个 shell 脚本进行打包成可执行文件，格式 `sh build_aot.sh <可执行文件的输出路径>`

        例如:
        ```shell
        sh build_aot.sh ~/Downloads/server.aot
        ```
        server.aot 就是可执行文件的文件名称

    - 运行可执行文件，需要使用 `dartaotruntime` 这个命令，如下所示:

        ```shell
        dartaotruntime ~/Downloads/server.aot
        ```

6. 如果访问失败出现 502 Bad Gateway 的情况，请确保服务器安全组开放相应的端口，例如当前服务的监听端口是 3000，云服务器必须要开放 3000 对应的端口。