FROM ollama/ollama

ENV OLLAMA_MODELS=mistral
ENV OLLAMA_MAX_LOADED_MODELS=1

EXPOSE 11434

ENTRYPOINT ["ollama", "serve"]
