#!/bin/bash

# LLM Knowledge Hub Backup Script
# This script creates a backup of your knowledge hub data

# Set variables
BACKUP_DIR="../backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILENAME="llm_knowledge_hub_backup_${TIMESTAMP}.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Display backup start message
echo "Starting backup of LLM Knowledge Hub data..."
echo "Timestamp: $(date)"

# Stop containers to ensure data consistency
echo "Stopping containers..."
docker-compose down

# Create backup archive
echo "Creating backup archive..."
tar -czf "$BACKUP_DIR/$BACKUP_FILENAME" \
    --exclude="data/ollama/models" \
    data config .env docker-compose.yml

# Restart containers
echo "Restarting containers..."
docker-compose up -d

# Display backup completion message
echo "Backup completed successfully!"
echo "Backup saved to: $BACKUP_DIR/$BACKUP_FILENAME"
echo "Backup size: $(du -h "$BACKUP_DIR/$BACKUP_FILENAME" | cut -f1)"
echo "Timestamp: $(date)"

# Optional: Keep only the 5 most recent backups
echo "Cleaning up old backups..."
ls -tp "$BACKUP_DIR" | grep -v '/$' | tail -n +6 | xargs -I {} rm -- "$BACKUP_DIR/{}"

echo "Backup process completed."
