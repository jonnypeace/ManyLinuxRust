# Use a manylinux2014 image as the base
FROM quay.io/pypa/manylinux2014_x86_64:latest

# Install dependencies for rustup (if not already available)
RUN yum update -y && yum install -y curl

# Install rustup and the stable toolchain
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Ensure Cargo's bin directory is on PATH for all sessions
ENV PATH="/root/.cargo/bin:${PATH}"
