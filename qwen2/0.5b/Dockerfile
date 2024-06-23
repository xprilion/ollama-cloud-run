FROM ollama/ollama

ENV OLLAMA_HOST 0.0.0.0:8080
ENV HOME /root
ENV OLLAMA_MODELS /models
ENV OLLAMA_DEBUG false

RUN apt-get update && apt-get install netcat -y

ADD pull.sh /
RUN ./pull.sh

CMD ["serve"]