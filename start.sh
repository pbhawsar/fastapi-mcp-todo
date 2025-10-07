#!/bin/bash

# Start script for Render deployment
echo "Starting FastAPI Todo Application..."

# Install dependencies
pip install -r requirements.txt

# Run the application
uvicorn main:app --host 0.0.0.0 --port $PORT
