import os
import requests

OLLAMA_API_URL = os.getenv("MISTRAL_API_URL", "http://localhost:11434")

def query_mistral(prompt: str) -> str:
    response = requests.post(
        f"{OLLAMA_API_URL}/api/generate",
        json={
            "model": "llama2",
            "prompt": prompt,
            "stream": False
        }
    )
    return response.json().get("response", "⚠️ No response from LLaMA2")
