# ----- build phase -----
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# builds a folder --> /app/build

# ----- run phase -----
FROM nginx
EXPOSE 80
# Ref: docker hub nginx image - hosting static pages
COPY --from=builder /app/build /usr/share/nginx/html