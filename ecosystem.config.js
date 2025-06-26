module.exports = {
  apps: [
    {
      name: "openwebui",
      cwd: "./openwebui",
      script: "backend/main.py",
      interpreter: "python3",
      env: {
        PORT: 3000
      }
    },
    {
      name: "litellm",
      cwd: "./litellm",
      script: "uvicorn",
      interpreter: "none",
      args: "litellm.main:app --host 0.0.0.0 --port 4000"
    },
    {
      name: "n8n",
      script: "n8n",
      env: {
        N8N_PORT: 5678,
        N8N_BASIC_AUTH_ACTIVE: "true",
        N8N_BASIC_AUTH_USER: "admin",
        N8N_BASIC_AUTH_PASSWORD: "changeme"
      }
    }
  ]
};