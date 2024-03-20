# Use an official Python runtime as the base image
FROM python:3.9-slim AS base

# Set working directory in the container
WORKDIR /app

# Copy only requirements.txt to leverage Docker cache
COPY requirements.txt .

# Install Python dependencies
FROM base AS dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Expose the port Flask app will run on
EXPOSE 5000

# Command to run the Flask application
CMD ["python", "app.py"]
