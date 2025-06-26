FROM node:18-bullseye-slim

# Install Python 3, pip, git
RUN apt-get update && \
    apt-get install -y python3 python3-pip git && \
    npm install -g pm2 n8n && \
    pip3 install fastapi uvicorn

# Set working directory
WORKDIR /app

# Clone OpenWebUI and LiteLLM
RUN git clone https://github.com/open-webui/open-webui.git openwebui && \
    git clone https://github.com/berriai/litellm.git litellm

# Copy PM2 process config
COPY ecosystem.config.js .

# Start all three apps using PM2
CMD ["pm2-runtime", "ecosystem.config.js"]