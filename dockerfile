# FROM node:20-slim AS base

# RUN npm config set registry "https://registry.npmmirror.com/"
# # 设置工作目录
# WORKDIR /app

# # 将 package.json 复制到容器中
# COPY package.json ./
# ENV HUSKY_SKIP_HOOKS=1

# # 安装项目的依赖
# RUN npm install --legacy-peer-deps --omit=dev

# # 将整个项目文件复制到容器中
# COPY . .

# # 运行 Next.js 应用的构建命令
# RUN npm run build 

# # 设置环境变量，告诉 Next.js 以生产模式运行
# ENV NODE_ENV=production

# # 公开端口，默认情况下 Next.js 在 3000 端口监听
# EXPOSE 3000

# # 启动应用
# CMD ["npm", "start"]


# # 第一阶段：构建阶段
# FROM node:20-slim AS build

# # 设置 npm 镜像源
# RUN npm config set registry "https://registry.npmmirror.com/"

# # 设置工作目录
# WORKDIR /app

# # 复制 package.json 和 package-lock.json
# COPY package.json ./

# # 安装开发依赖
# RUN npm install --legacy-peer-deps

# # 复制源代码
# COPY . .

# # 构建 Next.js 应用
# RUN npm run build

# # 第二阶段：生产阶段
# FROM node:20-slim AS production

# # 设置 npm 镜像源
# RUN npm config set registry "https://registry.npmmirror.com/"

# # 设置工作目录
# WORKDIR /app

# # 复制 package.json 和 package-lock.json
# COPY package.json ./

# # 安装生产依赖（不包括开发依赖）
# RUN npm run install:prod

# # 复制构建产物
# COPY --from=build /app/.next /app/.next

# # 设置环境变量为生产模式
# ENV NODE_ENV=production

# # 公开端口
# EXPOSE 3000

# # 启动应用
# CMD ["npm", "start"]


# 第一阶段：构建阶段
FROM node:20-slim AS build

# 设置 npm 镜像源
RUN npm config set registry "https://registry.npmmirror.com/"

# 设置工作目录
WORKDIR /app

# 复制 package.json 
COPY package.json ./

# 安装所有依赖
RUN npm install --legacy-peer-deps

# 复制整个 src 文件夹（注意：要复制整个项目的文件，而不仅仅是 app）
COPY src /app/src

# 复制 next.config.js（如果有修改或自定义配置）
COPY next.config.js /app/

# 构建 Next.js 应用
RUN npm run build

# 第二阶段：生产阶段
FROM node:20-slim AS production

# 设置 npm 镜像源
RUN npm config set registry "https://registry.npmmirror.com/"

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json
COPY package.json package-lock.json ./

# 安装生产依赖（不包括开发依赖）
RUN npm install --omit=dev --legacy-peer-deps

# 复制构建产物
COPY --from=build /app/.next /app/.next

# 复制 next.config.js 和其他静态资源
COPY --from=build /app/next.config.js /app/next.config.js
COPY --from=build /app/src/public /app/src/public

# 设置环境变量为生产模式
ENV NODE_ENV=production

# 如果有需要暴露的端口（比如 3000），可以加上：
EXPOSE 3000

# 默认启动命令（可以根据需求修改）
CMD ["npm", "run", "start"]

