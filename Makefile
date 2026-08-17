DC = docker compose

.PHONY: help build up down restart logs clean

# Команда по умолчанию (выводит список доступных команд)
help:
	@echo "Доступные команды для управления MkDocs в Docker:"
	@echo "  make build   - Собрать или пересобрать Docker-образ"
	@echo "  make up      - Запустить локальный сервер документации в фоне"
	@echo "  make down    - Остановить сервер и удалить контейнеры"
	@echo "  make restart - Перезапустить сервер"
	@echo "  make logs    - Посмотреть логи сервера в реальном времени"
	@echo "  make clean   - Полная очистка: удалить контейнеры, образы и volumes"

# Сборка образа (используйте при изменении requirements.txt или Dockerfile)
build:
	$(DC) build --no-cache

# Запуск локального сервера (доступен по адресу http://localhost:8000)
up:
	$(DC) up -d
	@echo "Сервер успешно запущен: http://localhost:8000"

# Остановка контейнеров
down:
	$(DC) down

# Перезапуск контейнеров с флагом очистки волюмов (чтобы обновились переменные окружения)
restart:
	$(DC) down --volumes
	$(DC) up -d
	@echo "🔄 Сервер успешно перезапущен!"

# Просмотр логов контейнера (помогает увидеть ошибки сборки страниц)
logs:
	$(DC) logs -f

# Полная очистка системы от кэша Docker проекта
clean:
	$(DC) down --volumes --rmi all --remove-orphans

