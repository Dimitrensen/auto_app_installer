# Use a base image compatible with Raspberry Pi (e.g., arm32v7/ubuntu)
FROM arm64v8/ubuntu:latest

# Update the package list and install any dependencies required by your script
RUN apt-get update && apt-get install -y \
curl \
wget \
software-properties-common \
gnupg \
apt-transport-https \
&& apt-get clean

# Copy your script into the Docker image
COPY pi_script /usr/local/bin/pi_script

# Make your script executable
RUN chmod +x /usr/local/bin/pi_script

# Set the entry point to run your script
ENTRYPOINT ["/usr/local/bin/pi_script"]