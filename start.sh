#!/bin/bash

# Завантажуємо модель (лише якщо її ще нема)
if ! ollama list | grep -q "mistral"; then
    echo "🧠 Pulling Mistral model..."
    ollama pull mistral
else
    echo "✅ Mistral already pulled."
fi

# Запускаємо сервер
exec ollama serve
