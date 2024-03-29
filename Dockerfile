FROM node:16
RUN sudo groupadd -r appuser && useradd -r -g appuser appuser
WORKDIR /app
COPY package*.json ./
RUN sudo chown -R appuser:appuser /app
USER appuser
RUN npm install nodemon
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "run","dev"]