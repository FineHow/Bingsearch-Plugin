# 使用官方 Node.js 作为基础镜像，并指定 v20.12.1 版本
FROM node:20.12.1-alpine

# 设置工作目录
WORKDIR /app

# 将 package.json 复制到容器中
COPY package.json ./

# 安装项目的依赖
RUN npm install 

# 将整个项目文件复制到容器中
COPY . .

# 运行 Next.js 应用的构建命令
RUN npm run build

# 设置环境变量，告诉 Next.js 以生产模式运行
ENV NODE_ENV=production

# 公开端口，默认情况下 Next.js 在 3000 端口监听
EXPOSE 3000

# 启动应用
CMD ["npm", "start"]
