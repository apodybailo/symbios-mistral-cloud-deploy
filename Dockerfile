# Базовий образ Ollama
FROM ollama/ollama
# Завантажуємо модель mistral при створенні образу
RUN ollama pull mistral
# Відкриваємо порт
EXPOSE 11434
# Запускаємо Ollama сервер (правильний синтаксис)
ENTRYPOINT ["ollama", "serve"]
