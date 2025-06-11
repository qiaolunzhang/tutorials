#!/bin/bash

# docker run: Runs a container from a specified image.
# -i Interactive: Keeps STDIN open so you can interact with the container (e.g., use a shell).
# -t Terminal: Allocates a pseudo-terminal to make interaction easier.
# -v Volume mount: Maps the current host directory ($(pwd)) to /app/micro2024 inside the container.
docker run -i -t \
  --name micro2024-container \
  -v $(pwd):/app/micro2024 \
  astrasim/tutorial-micro2024

