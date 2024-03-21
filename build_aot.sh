#!/bin/bash

echo "\033[33m编译 AOT 文件:\033[0m"

if [ $# == 0 ]
then
  echo "\033[31m错误: 没有输入 AOT 文件的输出路径\033[0m"
  exit  # 没有输入路径，结束
fi

dart compile aot-snapshot ./bin/dart_server_application.dart -o $1

if [ -f $1 ]
then
  # 文件存在
  echo "\033[32m编译完成，文件路径: $1\033[0m"
else
  # 文件不存在
  echo "\033[31m错误: 编译失败，文件不存在\033[0m"
fi
