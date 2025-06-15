#!/bin/bash
set -e

# ================== System Setups ======================
export DEBIAN_FRONTEND=noninteractive
sudo apt -y update
sudo apt -y install \
    coreutils wget vim git \
    gcc g++ clang-format \
    make cmake \
    libboost-dev libboost-program-options-dev \
    openmpi-bin openmpi-doc libopenmpi-dev \
    python3.11 python3-pip python3-venv \
    graphviz

# Create Python venv
sudo python3.11 -m venv /opt/venv/astra-sim
export PATH="/opt/venv/astra-sim/bin:$PATH"
sudo pip install --upgrade pip

# STG Python dependencies
sudo pip install numpy sympy graphviz pandas

# ================= Abseil Installation ==================
export ABSL_VER=20240722.0
cd /opt
sudo wget https://github.com/abseil/abseil-cpp/releases/download/${ABSL_VER}/abseil-cpp-${ABSL_VER}.tar.gz
sudo tar -xf abseil-cpp-${ABSL_VER}.tar.gz
sudo rm abseil-cpp-${ABSL_VER}.tar.gz

# Compile Abseil
sudo mkdir -p abseil-cpp-${ABSL_VER}/build
cd abseil-cpp-${ABSL_VER}/build
sudo cmake .. \
    -DCMAKE_CXX_STANDARD=14 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/opt/abseil-cpp-${ABSL_VER}/install"
sudo cmake --build . --target install --config Release --parallel $(nproc)

# export absl_DIR="/opt/abseil-cpp-${ABSL_VER}/install
export absl_DIR="/opt/abseil-cpp-${ABSL_VER}/install/lib/cmake/absl"


# =============== Protobuf Installation ==================
export PROTOBUF_VER=29.0
cd /opt
sudo wget https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOBUF_VER}/protobuf-${PROTOBUF_VER}.tar.gz
sudo tar -xf protobuf-${PROTOBUF_VER}.tar.gz
sudo rm protobuf-${PROTOBUF_VER}.tar.gz

# Compile Protobuf
sudo mkdir -p protobuf-${PROTOBUF_VER}/build
cd protobuf-${PROTOBUF_VER}/build
sudo cmake .. \
    -DCMAKE_CXX_STANDARD=14 \
    -DCMAKE_BUILD_TYPE=Release \
    -Dprotobuf_BUILD_TESTS=OFF \
    -Dprotobuf_ABSL_PROVIDER=package \
    -Dabsl_DIR=/opt/abseil-cpp-20240722.0/install/lib/cmake/absl
    # -DCMAKE_INSTALL_PREFIX="/opt/protobuf-${PROTOBUF_VER}/install" \
sudo cmake --build . --target install --config Release --parallel $(nproc)

export PATH="/opt/protobuf-${PROTOBUF_VER}/install/bin:$PATH"
export protobuf_DIR="/opt/protobuf-${PROTOBUF_VER}/install"
export PROTOBUF_FROM_SOURCE=True

# Python Protobuf
sudo pip install protobuf==5.${PROTOBUF_VER}

# ============== Finalize ==================
# mkdir -p /app/astra-sim
# cd /app/astra-sim
