#!/bin/bash
set -e

# 确保 .env.production 文件存在
if [ ! -f .env.production ]; then
    echo "Creating .env.production..."
    touch .env.production
    echo 'NEXT_PUBLIC_API_URL=""' > .env.production
fi

# 使用中间目录构建，避免构建过程中 dist 目录不可用
BUILD_TMP_DIR=".dist-build-tmp"
rm -rf "${BUILD_TMP_DIR}"

echo "Building Docker image..."

# 构建 Docker 镜像并运行，输出到中间目录
docker build -t frontend-build . && docker run --rm -v "$(pwd)/${BUILD_TMP_DIR}:/output" frontend-build cp -r /app/dist/. /output

echo "Replacing dist directory..."

# 构建成功后，替换 dist 目录内容（保留 dist 目录本身）
mkdir -p dist
rm -rf dist/*
cp -r "${BUILD_TMP_DIR}"/. dist/
rm -rf "${BUILD_TMP_DIR}"

echo "Build completed successfully! Output: dist/"
