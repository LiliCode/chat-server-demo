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

# 检查Dart是否安装
if ! command -v dart &> /dev/null; then
    echo "错误: Dart SDK未安装或未在PATH中"
    exit 1
fi

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
# 运行Dart AOT程序的脚本
dartaotruntime "$EXECUTABLE_NAME.aot" "\$@"
EOF

# 使脚本可执行
chmod +x "$OUTPUT_DIR/$EXECUTABLE_NAME.sh"

# 3. (可选) 打包为独立可执行文件
# 注意: 这需要dartaotruntime和.aot文件一起分发
echo "正在打包为独立可执行文件..."
cat > "$OUTPUT_DIR/$EXECUTABLE_NAME" <<EOF
#!/bin/bash
# 获取脚本所在目录
DIR=\$(cd "\$(dirname "\${BASH_SOURCE[0]}")" &> /dev/null && pwd)
# 运行AOT程序
exec "\$DIR/dartaotruntime" "$EXECUTABLE_NAME.aot" "\$@"
EOF

# 复制dartaotruntime到输出目录
DART_RUNTIME=$(which dartaotruntime)
if [ -f "$DART_RUNTIME" ]; then
    cp "$DART_RUNTIME" "$OUTPUT_DIR/"
else
    echo "警告: 无法找到dartaotruntime, 独立可执行文件可能无法工作"
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