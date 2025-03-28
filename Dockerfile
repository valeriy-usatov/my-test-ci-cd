# 1️⃣ Используем легковесный образ Node.js для сборки
FROM node:18-alpine AS builder

# 2️⃣ Устанавливаем рабочую директорию
WORKDIR /app

# 3️⃣ Копируем package.json и package-lock.json (или yarn.lock)
COPY package.json package-lock.json ./

# 4️⃣ Устанавливаем зависимости
RUN npm ci

# 5️⃣ Копируем весь код проекта
COPY . .

# 6️⃣ Собираем приложение
RUN npm run build

# 7️⃣ Используем легковесный веб-сервер для продакшена
FROM nginx:alpine AS runner

# 8️⃣ Копируем собранные файлы в папку nginx
COPY --from=builder /app/dist /usr/share/nginx/html

# 9️⃣ Открываем порт 80 для сервера
EXPOSE 80

# 🔟 Запускаем Nginx
CMD ["nginx", "-g", "daemon off;"]
