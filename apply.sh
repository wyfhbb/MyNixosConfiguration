#!/bin/bash

# 目标目录
target_dir="/etc/nixos"
# 备份目录
backup_dir="./old"

# 检查并创建目标目录
if [ ! -d "$target_dir" ]; then
    echo "目标目录 $target_dir 不存在，正在创建..."
    sudo mkdir -p "$target_dir"
fi

# 检查并创建备份目录
if [ ! -d "$backup_dir" ]; then
    echo "备份目录 $backup_dir 不存在，正在创建..."
    mkdir -p "$backup_dir"
fi

# 获取脚本文件名，防止自复制
script_name=$(basename "$0")

# 先备份再复制文件到目标目录
for file in *; do
    if [ -f "$file" ] && [ "$file" != "$script_name" ] && [ "$file" != "old" ]; then
        # 备份文件到old目录
        cp "$file" "$backup_dir"
        # 复制文件到/etc/nixos
        sudo cp "$file" "$target_dir"
    fi
done

echo "操作完成。"

