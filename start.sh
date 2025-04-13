#!/bin/bash

# Запускаємо Ollama у фоновому режимі
ollama serve &

# Очікуємо, поки Ollama буде доступний (макс 60 сек)
for i in {1..30}; do
  if curl -s http://localhost:11434 > /dev/null; then
    echo "✅ Ollama доступний"
    break
  fi
  echo "⏳ Очікуємо запуск Ollama... ($i)"
  sleep 2
done

# Перевіряємо наявність оптимізованої моделі (Q4_K_M)
if ! ollama list | grep -q "llama2:7b-chat:Q4_K_M"; then
  echo "📥 Завантажуємо LLaMA 2 7B Chat (Q4_K_M)"
  ollama pull llama2:7b-chat:Q4_K_M
else
  echo "✅ Модель LLaMA 2 7B Chat (Q4_K_M) вже завантажена."
fi

# Утримуємо процес активним
wait
