FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-flask \
    git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create application directory
RUN mkdir -p /opt/app

# Clone the repository
RUN git clone https://github.com/B-Shreyas-X/2303_ISA2 /opt/app

# Set the working directory
WORKDIR /opt/app

# Set environment variable for Flask
ENV FLASK_APP=application.py

# Expose the port the app runs on
EXPOSE 5000

# Command to run the application
CMD ["flask", "run", "--host=0.0.0.0"]
