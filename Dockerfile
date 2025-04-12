# Базовий образ Ollama
FROM ollama/ollama
# Відкриваємо порт
EXPOSE 11434
# Запускаємо Ollama сервер (правильний синтаксис)
ENTRYPOINT ["ollama", "serve"]
