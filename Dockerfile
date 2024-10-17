# Dockerfile for Deepfake Detection Web Application
# Author: Shafeeq Ahamed S
# This Dockerfile sets up a Python environment for running a deepfake detection web application.

# Use the official Python image from the Docker Hub
FROM python:3.11

# Set environment variables to prevent bytecode generation and enable unbuffered output
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Metadata about the image
LABEL maintainer="Shafeeq Ahamed S"
LABEL description="This Dockerfile sets up a Python environment to run a Deepfake Detection Web App using Django, TensorFlow, and OpenCV."

# Install system dependencies
 # Needed for OpenCV to function correctly
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \ 
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . .

# Expose the port the Django app runs on
EXPOSE 3000

# Command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:3000"]
