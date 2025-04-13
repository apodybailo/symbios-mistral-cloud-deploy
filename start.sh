#!/bin/bash

# Запускаємо Ollama у фоновому режимі
ollama serve &

# Очікуємо запуск Ollama
for i in {1..30}; do
  if curl -s http://localhost:11434 > /dev/null; then
    echo "✅ Ollama доступний"
    break
  fi
  echo "⏳ Очікуємо запуск Ollama... ($i)"
  sleep 2
done

# Перевіряємо наявність базової моделі llama2
if ! ollama list | grep -q "llama2"; then
  echo "📦 Завантажуємо модель LLaMA2..."
  ollama pull llama2
else
  echo "✅ Модель LLaMA2 вже завантажена."
fi

# Утримуємо процес активним
wait
