# api_client.py

import os
import requests

OLLAMA_API_URL = os.getenv("OLLAMA_API_URL", "http://localhost:11434")

def query_ollama(model: str, prompt: str) -> str:
    response = requests.post(
        f"{OLLAMA_API_URL}/api/generate",
        json={
            "model": model,
            "prompt": prompt,
            "stream": False
        }
    )
    return response.json().get("response", "⚠️ No response from Ollama")
