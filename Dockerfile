FROM python:3.11-slim

WORKDIR /app

# Копируем список зависимостей и устанавливаем их
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Открываем порт для MkDocs
EXPOSE 8000

# Запускаем сервер MkDocs с привязкой ко всем интерфейсам
CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]
