#!/bin/bash

# Стартуємо ollama у фоновому режимі
ollama serve &

# Чекаємо, поки ollama сервер буде доступний (до 60 секунд)
for i in {1..30}; do
  if curl -s http://localhost:11434 > /dev/null; then
    echo "✅ Ollama доступний"
    break
  fi
  echo "⏳ Очікуємо запуск Ollama... ($i)"
  sleep 2
done

# Перевірка наявності моделі llama2:7b-chat
if ! ollama list | grep -q "llama2:7b-chat"; then
  echo "📥 Завантажуємо модель LLaMA 2 7B Chat..."
  ollama pull llama2:7b-chat
else
  echo "✅ Модель LLaMA 2 7B Chat вже завантажено."
fi

# 🔥 Запускаємо модель
ollama run llama2:7b-chat &

# Тримаємо процес ollama активним
wait

