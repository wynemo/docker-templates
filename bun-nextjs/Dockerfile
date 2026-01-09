# syntax=docker/dockerfile:1

# 使用官方 Bun 镜像进行构建
FROM oven/bun:1 AS builder

WORKDIR /app

# 复制依赖文件
COPY package.json bun.lock* ./

# 安装依赖
RUN bun install --frozen-lockfile

# 复制源代码
COPY . .

# 构建应用
RUN bun run build

# 最终阶段：仅包含构建产物
FROM busybox:latest

WORKDIR /app

# 从构建阶段复制 dist 目录
COPY --from=builder /app/dist ./dist

# 默认命令（用于 docker run 时复制文件）
CMD ["sh", "-c", "echo 'Build complete. Use: docker run --rm -v $(pwd)/output:/output <image> cp -r /app/dist/. /output'"]
