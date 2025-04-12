# Базовий образ
FROM ollama/ollama

# Вказуємо, що слухає порт 11434
EXPOSE 11434

# Просто запускаємо сервер — без pull
ENTRYPOINT ["ollama", "serve"]
