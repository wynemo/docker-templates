使用 Bun 构建 Next.js 静态站点的 Docker 模板

## 特点

- 使用 Bun 作为包管理器和运行时，构建速度快
- Next.js 16 + React 19 + Tailwind CSS 4
- 多阶段构建，最终镜像仅包含静态文件
- 支持 shadcn/ui 组件库

## 使用方法

运行构建脚本：

```bash
./build.sh
```

构建完成后，静态文件会输出到 `dist/` 目录
