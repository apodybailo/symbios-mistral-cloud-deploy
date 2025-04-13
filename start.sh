# --------------------
# start.sh
# --------------------
#!/bin/bash

# Стартуємо ollama у фоновому режимі
ollama serve &

# Чекаємо, поки ollama сервер буде доступний
for i in {1..30}; do
    if curl -s http://localhost:11434 > /dev/null; then
        echo "👌 Ollama доступний"
        break
    fi
    echo "⏳ Чекаємо запуск Ollama... ($i)"
    sleep 2
done

# Перевірка наявності моделі llama2:chat
if ! ollama list | grep -q "llama2:chat"; then
    echo "🚀 Завантажуємо модель LLaMA 2 Chat..."
    ollama pull llama2:chat
else
    echo "📄 Модель LLaMA 2 Chat вже завантажено."
fi

# Тримаємо основний процес
wait

