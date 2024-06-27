# Ollama Models on Cloud Run

This repository shows how to deploy various models using the Ollama API on Cloud Run, to run inference using CPU only on a serverless platform - incurring bills only when you use them.

**Ollama** is a framework that makes it easy for developers to prototype apps with open models. It comes with a REST API, and this repository provides Dockerfiles and deployment scripts for each model.

**Google Cloud Run** is a fully managed compute platform that automatically scales your stateless containers. You can run code in any language, and all dependencies are included in a container image, which Google Cloud Run handles deployment and scaling for.

Ispiration (and gemma2b code) from [wietsevenema/samples](https://github.com/wietsevenema/samples/tree/main/run/ollama-gemma).


## Models

| Model       | Version | Folder Link                                                                                      |
|-------------|---------|--------------------------------------------------------------------------------------------------|
| codegemma   | 2b      | [codegemma/2b](./codegemma/2b)                                                                   |
| codegemma   | 7b      | [codegemma/7b](./codegemma/7b)                                                                   |
| gemma       | 2b      | [gemma/2b](./gemma/2b)                                                                           |
| gemma       | 7b      | [gemma/7b](./gemma/7b)                                                                           |
| gemma2      | 9b      | [gemma2/9b](./gemma2/9b)                                                                         |
| llama3      | 8b      | [llama3/8b](./llama3/8b)                                                                         |
| llava       | 7b      | [llava/7b](./llava/7b)                                                                           |
| mistral     | 7b      | [mistral/7b](./mistral/7b)                                                                       |
| phi3        | 3.8b    | [phi3/3.8b](./phi3/3.8b)                                                                         |
| qwen2       | 0.5b    | [qwen2/0.5b](./qwen2/0.5b)                                                                       |

## Usage

To build the container with a specific model included and deploy the Ollama API to a publicly accessible URL on Cloud Run, use the following command from the corresponding model's directory. For example, to deploy `gemma:2b`:

```sh
bash gemma/2b/deploy.sh
```

Respond to any prompts the command gives you. You might need to enable a few APIs and choose a region to deploy to.

Building the container takes roughly 3-20 minutes, depending on model size.

Once the command completes, the deploy command shows the public URL of the service.

## Explore the API

Ask the deployed model a question:

```sh
curl <PUBLIC_URL>/api/generate -d \
 '{ 
    "model": "gemma:2b", 
    "prompt": "Why is the sky blue?" 
  }'
```

The first request to a new instance will take some extra setup time because the model is loaded into memory. Ollama keeps the model in memory for 5 minutes.

For the full Ollama API, refer to [the API docs](https://github.com/ollama/ollama/blob/main/docs/api.md).

## Clean Up

To clean up after following this short tutorial, you can do the following:
- In Artifact Registry, find the `cloud-run-source-deploy` repository and remove the container image used by the Cloud Run service you created.
- In Cloud Run, delete the service you created.

## Links
- [Ollama](https://github.com/ollama/ollama)

---

Use for research, exploration, and prototyping.