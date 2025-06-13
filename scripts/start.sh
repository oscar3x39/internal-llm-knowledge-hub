#!/bin/bash

# LLM Knowledge Hub Startup Script
# This script helps set up and start the LLM Knowledge Hub

# Set color variables
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=========================================${NC}"
echo -e "${BLUE}   Internal LLM Knowledge Hub Startup    ${NC}"
echo -e "${BLUE}=========================================${NC}"

# Check if .env file exists, if not create it from example
if [ ! -f .env ]; then
    echo -e "${YELLOW}No .env file found. Creating from .env.example...${NC}"
    if [ -f .env.example ]; then
        cp .env.example .env
        echo -e "${GREEN}Created .env file. Please edit it with your settings.${NC}"
    else
        echo -e "${YELLOW}No .env.example file found. Please create a .env file manually.${NC}"
    fi
fi

# Create necessary directories if they don't exist
echo -e "${BLUE}Ensuring directory structure exists...${NC}"
mkdir -p data/documents data/vector-db backups

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo -e "${YELLOW}Docker is not installed. Please install Docker and Docker Compose before continuing.${NC}"
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo -e "${YELLOW}Docker Compose is not installed. Please install Docker Compose before continuing.${NC}"
    exit 1
fi

# Pull the latest images
echo -e "${BLUE}Pulling latest Docker images...${NC}"
docker-compose pull

# Start the services
echo -e "${BLUE}Starting LLM Knowledge Hub services...${NC}"
docker-compose up -d

# Check if services are running
if [ $? -eq 0 ]; then
    echo -e "${GREEN}LLM Knowledge Hub is now running!${NC}"
    echo -e "${GREEN}Access the web interface at: http://localhost:3000${NC}"
    
    # Display initial Ollama model download instructions
    echo -e "\n${BLUE}Initial Setup:${NC}"
    echo -e "To download the default LLM model (llama3), run:"
    echo -e "${YELLOW}docker exec -it ollama ollama pull llama3${NC}"
    
    echo -e "\n${BLUE}Available commands:${NC}"
    echo -e "- Stop services:  ${YELLOW}docker-compose down${NC}"
    echo -e "- View logs:      ${YELLOW}docker-compose logs -f${NC}"
    echo -e "- Create backup:  ${YELLOW}./scripts/backup.sh${NC}"
else
    echo -e "${YELLOW}There was an issue starting the services. Please check the logs.${NC}"
fi
