FROM amazon/aws-lambda-nodejs:14

WORKDIR /var/task

COPY package.json package-lock.json  .
RUN npm install

COPY . .
RUN npm run build

CMD [ "index.handler" ]
