echo "" >> ~/.bashrc
echo "# === AstraSim Environment Variables ===" >> ~/.bashrc
echo 'export PATH="/opt/venv/astra-sim/bin:$PATH"' >> ~/.bashrc
# echo 'export absl_DIR="/opt/abseil-cpp-20240722.0/install"' >> ~/.bashr
echo 'export absl_DIR="/opt/abseil-cpp-20240722.0/install/lib/cmake/absl"' >> ~/.bashrc
echo 'export protobuf_DIR="/opt/protobuf-29.0/install"' >> ~/.bashrc
echo 'export PATH="/opt/protobuf-29.0/install/bin:$PATH"' >> ~/.bashrc
echo 'export PROTOBUF_FROM_SOURCE=True' >> ~/.bashrc
