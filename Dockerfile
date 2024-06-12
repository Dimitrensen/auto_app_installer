# Use a base image compatible with Raspberry Pi (e.g., arm32v7/ubuntu)
FROM arm32v7/ubuntu:latest

# Update the package list and install any dependencies required by your script
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    software-properties-common \
    # Add other package dependencies here
    && apt-get clean

# Copy your script into the Docker image
COPY pi_script /usr/local/bin/pi_script

# Make your script executable
RUN chmod +x /usr/local/bin/pi_script

# Set the entry point to run your script
ENTRYPOINT ["/usr/local/bin/pi_script"]