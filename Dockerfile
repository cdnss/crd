# Use a lightweight Python base image
FROM python:3.11-slim-buster

# Set environment variable for non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Update the package lists
RUN apt-get update -y

# Install required system dependencies
RUN apt-get install -y \
    fonts-liberation \
    libnss3 \
    libx11-6 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libgtk-3-0 \
    libgtk-3-common \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxrandr2 \
    libgbm-dev \
    libxss1 \
    libfontconfig1 \
    libxtst6 \
    xauth \
    xvfb

# Install Chromium and ChromeDriver
RUN apt-get install -y chromium chromium-driver

# Install Selenium Python library

# Set the working directory
WORKDIR /app

# Copy your Python script to the working directory
COPY main.py .
COPY requirements.txt .

RUN pip install -r requirements.txt

# Expose the port if needed (adjust as required)
EXPOSE 5000

# Command to run the script
CMD ["xvfb-run python", "main.py"]
