FROM node:18-bullseye-slim

# Install Python and dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip git procps && \
    npm install -g pm2 n8n && \
    pip3 install fastapi uvicorn

# Create app directory
WORKDIR /app

# Clone services
RUN git clone https://github.com/open-webui/open-webui.git openwebui
RUN git clone https://github.com/berriai/litellm.git litellm

# Copy PM2 config
COPY ecosystem.config.js .

CMD ["pm2-runtime", "ecosystem.config.js"]