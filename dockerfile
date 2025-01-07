FROM node:20-slim AS build
RUN npm config set registry "https://registry.npmmirror.com/"
WORKDIR /app
COPY . .
RUN npm install 
RUN npm run build

FROM alpine:3.18 as production  
RUN apk add --no-cache \
    curl \
    bash \
    libpng \
    libjpeg-turbo \
    libwebp \
    nodejs \
    npm \
    && rm -rf /var/cache/apk/*  
ENV NODE_ENV=production
WORKDIR /app
COPY --from=build /app/.next /app/.next
COPY --from=build /app/next.config.mjs /app/next.config.mjs
COPY --from=build /app/package.json /app/package.json
COPY --from=build /app/public /app/public
COPY .env /app/.env
RUN npm run install:prod 
EXPOSE 3000
CMD ["npm", "run", "start"]

