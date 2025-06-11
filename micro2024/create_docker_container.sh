#!/bin/bash

docker run -i -t \
  --name micro2024-container \
  -v $(pwd):/app/micro2024 \
  astrasim/tutorial-micro2024

