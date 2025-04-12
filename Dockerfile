# Базовий образ Ollama
FROM ollama/ollama

# Відкриваємо стандартний порт Ollama
EXPOSE 11434

# Завантажуємо модель Mistral і запускаємо сервер
ENTRYPOINT ["sh", "-c", "ollama pull mistral && ollama serve"]
