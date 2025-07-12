#!/bin/bash

# 检查是否提供了必要的参数
if [ "$#" -lt 1 ]; then
    echo "错误: 参数不足"
    echo "使用方法: $0 <输出目录> [可执行文件名称]"
    echo "示例: $0 build/my_app my_app"
    exit 1
fi

# 获取参数
OUTPUT_DIR=$1
EXECUTABLE_NAME=${2:-"run-chat-server"}

# 创建输出目录
mkdir -p "$OUTPUT_DIR"

# 1. 编译为AOT快照
echo "正在编译AOT快照..."

dart compile aot-snapshot ./bin/dart_server_application.dart -o "$OUTPUT_DIR/$EXECUTABLE_NAME.aot"

if [ $? -ne 0 ]; then
    echo "错误: AOT快照编译失败"
    exit 1
fi

# 复制 libisar.so 动态库文件
echo "复制 libisar.so 动态库..."
cp ./bin/libisar.so "$OUTPUT_DIR/libisar.so"

# 2. 创建运行脚本
echo "正在创建运行脚本..."
cat > "$OUTPUT_DIR/$EXECUTABLE_NAME.sh" <<EOF
#!/bin/bash
# 运行 Dart AOT 程序的脚本
dartaotruntime "$EXECUTABLE_NAME.aot" "\$@"
EOF

# 3. 创建后台运行脚本
echo "正在创建后台运行脚本..."
cat > "$OUTPUT_DIR/run-in-background.sh" <<EOF
#!/bin/bash
# 后台运行 Dart AOT 程序的脚本
nohup sh ./$EXECUTABLE_NAME.sh > output.log 2>&1 &
EOF

# 使脚本可执行
chmod +x "$OUTPUT_DIR/$EXECUTABLE_NAME.sh"

# 复制dartaotruntime到输出目录
DART_RUNTIME=$(which dartaotruntime)
if [ -f "$DART_RUNTIME" ]; then
    cp "$DART_RUNTIME" "$OUTPUT_DIR/"
else
    echo "警告: 无法找到 dartaotruntime, 独立可执行文件可能无法工作"
fi

# 使可执行文件可执行
chmod +x "$OUTPUT_DIR/$EXECUTABLE_NAME"

echo "AOT编译完成!"
echo "输出文件:"
echo "  - AOT快照: $OUTPUT_DIR/$EXECUTABLE_NAME.aot"
echo "  - 运行脚本: $OUTPUT_DIR/$EXECUTABLE_NAME.sh"
echo "  - 独立可执行文件: $OUTPUT_DIR/$EXECUTABLE_NAME"
echo ""
echo "运行方式:"
echo "  1. 使用运行脚本: ./$EXECUTABLE_NAME.sh"
echo "  2. 或直接运行: ./$EXECUTABLE_NAME"