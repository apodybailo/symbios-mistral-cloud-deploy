#!/bin/bash

# Стартуємо ollama у фоновому режимі
ollama serve &
OLLAMA_PID=$!

# Чекаємо поки ollama сервер буде доступний (до 60 секунд)
for i in {1..30}; do
  if curl -s http://localhost:11434 > /dev/null; then
    echo "✅ Ollama доступний"
    break
  fi
  echo "⏳ Очікуємо запуск Ollama... ($i)"
  sleep 2
done

# Перевірка наявності моделі
if ! ollama list | grep -q "mistral"; then
  echo "🐙 Завантажуємо модель Mistral..."
  ollama pull mistral
else
  echo "✅ Модель Mistral вже завантажено."
fi

# Тримаємо процес ollama живим
wait $OLLAMA_PID
