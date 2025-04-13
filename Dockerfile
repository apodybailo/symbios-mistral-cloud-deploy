FROM ollama/ollama

# Копіюємо стартовий скрипт
COPY start.sh /start-2.sh
RUN chmod +x /start-2.sh

EXPOSE 11434

ENTRYPOINT ["/start-2.sh"]
