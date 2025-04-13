FROM ollama/ollama

# Копіюємо стартовий скрипт
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 11434

ENTRYPOINT ["/start.sh"]
