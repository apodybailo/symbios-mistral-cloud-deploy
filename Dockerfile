# Використовуємо офіційний образ Ollama
FROM ollama/ollama

# Завантажуємо модель під час збірки
RUN ollama pull mistral

# Встановлюємо змінні середовища
ENV OLLAMA_MODELS=mistral
ENV OLLAMA_MAX_LOADED_MODELS=1

# Відкриваємо порт
EXPOSE 11434

# Запускаємо сервер Ollama
ENTRYPOINT ["ollama", "serve"]
