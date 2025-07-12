# 基于 Dart 的聊天后端 demo

- 基于 WebSocket 的简单聊天服务器
- 基于 shelf 框架实现后端接口
- 使用 Isar 的数据库存储用户数据

## 快速使用

下面以 Ubuntu 20.04 系统为例

1. 安装 Dart 执行环境(已安装请跳过)，地址: <https://dart.cn/get-dart>
2. 执行命令直接运行（不打包）
    ```shell
    dart pub get
    dart run
    ```
   
3. 打包运行（AOT方式，详情请参考官方文档 https://dart.cn/tools/dart-compile#aot-snapshot）

   1. 运行 `build_aot.sh` 这个 shell 脚本进行打包成可执行文件，格式 `sh build_aot.sh <可执行文件的输出路径>`

        例如:
        ```shell
        sh build_aot.sh ~/Downloads
        ```
        server.aot 就是可执行文件的文件名称

    - 运行可执行文件，需要使用 `dartaotruntime` 这个命令，如下所示:

        ```shell
        dartaotruntime ~/Downloads/server.aot
        ```

4. 如果访问失败出现 502 Bad Gateway 的情况，请确保服务器安全组开放相应的端口，例如当前服务的监听端口是 3000，云服务器必须要开放 3000 对应的端口。