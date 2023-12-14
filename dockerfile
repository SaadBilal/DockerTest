
ARG NODE_VERSION=19.5.0
FROM node:${NODE_VERSION}-alpine
ENV NODE_ENV production

WORKDIR /usr/src/app

RUN --mount=type=bind,source=package.json,target=package.json\
--mount=type=bind,source=package-lock.json,target=package-lock.json\
--mount=type=cache,target=/root/.npm\
npm ci --include=dev

RUN npm install -g nodemon

COPY ..

RUN chmod -R node /user/src/app
USER node

EXPOSE 3000

CMD npm run dev
