#!/bin/bash

# 🚀 Запускаємо Ollama у фоновому режимі
ollama serve &

# ⏳ Чекаємо, поки Ollama буде доступний (макс 60 сек)
for i in {1..30}; do
  if curl -s http://localhost:11434 > /dev/null; then
    echo "✅ Ollama доступний"
    break
  fi
  echo "⌛ Очікуємо запуск Ollama... ($i)"
  sleep 2
done

# 📦 Перевіряємо наявність моделі llama2
if ! ollama list | grep -q "llama2"; then
  echo "📥 Завантажуємо модель LLaMA2..."
  ollama pull llama2
else
  echo "✅ Модель LLaMA2 вже завантажена."
fi

# 🧠 Запускаємо модель llama2 у фоновому режимі
echo "🚀 Запускаємо модель llama2..."
nohup ollama run llama2 > /dev/null 2>&1 &

# 🧷 Утримуємо процес активним
wait
