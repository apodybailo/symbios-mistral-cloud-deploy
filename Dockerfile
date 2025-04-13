FROM ollama/ollama

# Вказуємо, яку модель запускати при старті контейнера
ENV OLLAMA_MODELS=mistral

EXPOSE 11434

ENTRYPOINT ["ollama", "serve"]
