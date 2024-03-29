FROM node:16
RUN groupadd -r appuser && useradd -r -g appuser appuser
WORKDIR /app
COPY package*.json ./
RUN chown -R appuser:appuser /app
USER appuser
RUN npm install nodemon --force
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]