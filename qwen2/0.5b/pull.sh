# Ollama is intended to be run as a local development server.
# To download the model and store it in the container image, 
# this script starts the ollama server and sends a pull command to it. 

# Function to check if ollama serve is listening on port 8080
wait_for_ollama() {
  while ! nc -z localhost 8080; do 
    sleep 1  # Wait 1 second before checking again
  done
}

# Start ollama serve in the background
ollama serve & 

# Wait for ollama serve to start listening
wait_for_ollama
echo "ollama serve is now listening on port 8080"

# Run ollama pull
ollama pull qwen2:0.5b

# Indicate successful completion
echo "ollama pull qwen2:0.5b completed"