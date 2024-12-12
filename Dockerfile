## BUILD PHASE
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

## multiple step file and then copying everything that was created
## during the build step from the app folder

## RUN PHASE
FROM nginx
COPY --from=builder /app/build /user/share/nginx/html

