# Internal LLM Knowledge Hub

A self-hosted knowledge management system powered by Large Language Models (LLMs) for storing, retrieving, and generating insights from your organization's internal documents and knowledge base.

## Overview

This project creates a private, secure knowledge hub that uses LLMs to process and retrieve information from your documents. It enables natural language querying of your organization's knowledge base, making information discovery and knowledge sharing more efficient.

## Features

- 📚 Document ingestion and processing pipeline
- 🔍 Natural language search across all documents
- 💬 Conversational interface for knowledge retrieval
- 🔒 Private and secure - all data stays on your infrastructure
- 🚀 Easy deployment with Docker Compose
- ⚙️ Customizable LLM settings and document processing
- 📊 Knowledge base analytics and usage statistics

## Tech Stack

- **[AnythingLLM](https://github.com/Mintplex-Labs/anything-llm)**: Open-source, locally hosted RAG (Retrieval Augmented Generation) system
- **[Ollama](https://ollama.ai/)**: Run open-source large language models locally
- **Docker Compose**: Container orchestration for easy deployment
- **Vector Database**: Storage for document embeddings
- **Web Interface**: React-based frontend for user interaction

## Prerequisites

- Docker and Docker Compose installed
- At least 8GB RAM (16GB+ recommended for larger models)
- 20GB+ free disk space
- NVIDIA GPU (optional, but recommended for better performance)

## Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/internal-llm-knowledge-hub.git
cd internal-llm-knowledge-hub
```

### 2. Configure environment variables

```bash
cp .env.example .env
# Edit .env file with your preferred settings
```

### 3. Start the services

```bash
docker-compose up -d
```

### 4. Access the web interface

Open your browser and navigate to `http://localhost:3000`

## Configuration

### LLM Settings

By default, this project uses Ollama to run models locally. You can configure which model to use in the `.env` file:

```
LLM_MODEL=llama3
# Other options: mistral, gemma, phi3, etc.
```

### Document Processing

The system supports various document formats including:
- PDF
- Markdown
- Text files
- Word documents
- HTML
- And more

## Usage

### Adding Documents

1. Navigate to the web interface at `http://localhost:3000`
2. Go to the "Documents" section
3. Upload your documents or connect to document sources

### Querying Your Knowledge Base

1. Go to the "Chat" section in the web interface
2. Type your question in natural language
3. The system will retrieve relevant information from your documents

## Development

### Project Structure

```
internal-llm-knowledge-hub/
├── docker-compose.yml     # Service definitions
├── .env                   # Environment variables
├── config/                # Configuration files
├── data/                  # Data storage
│   ├── documents/         # Uploaded documents
│   └── vector-db/         # Vector database storage
└── scripts/               # Utility scripts
```

### Customization

You can customize the system by modifying the configuration files in the `config/` directory.

## Maintenance

### Backup

To backup your knowledge base:

```bash
./scripts/backup.sh
```

### Updating

To update to the latest version:

```bash
git pull
docker-compose down
docker-compose up -d
```

## Troubleshooting

### Common Issues

- **System is slow**: Try using a smaller LLM model or increase RAM allocation
- **Document processing fails**: Check supported formats and file size limits
- **Search results are irrelevant**: Adjust the similarity threshold in settings

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.