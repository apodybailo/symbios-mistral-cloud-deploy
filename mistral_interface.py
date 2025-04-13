import os
import requests

MISTRAL_API_URL = os.getenv("MISTRAL_API_URL", "http://localhost:11434")

def query_mistral(prompt: str) -> str:
    response = requests.post(
        f"{MISTRAL_API_URL}/api/generate",
        json={"model": "llama2:7b-chat:Q4_K_M", "prompt": prompt}
    )
    return response.json().get("response", "⚠️ No response from Mistral")
