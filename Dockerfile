# Use a base image with the necessary dependencies (e.g., Debian or Ubuntu)
FROM debian:latest

# Update the package lists
RUN apt-get update -y

# Install required packages (e.g., wget for downloading)
RUN apt-get install -y wget

# Download the latest ChromeDriver version (replace with the correct URL)
ENV CHROMEDRIVER_VERSION 119.0.6446.69
RUN wget https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip

# Extract ChromeDriver
RUN unzip chromedriver_linux64.zip

# Move ChromeDriver to the `/usr/local/bin` directory for easy access
RUN mv chromedriver /usr/local/bin/

# Set permissions for ChromeDriver
RUN chmod +x /usr/local/bin/chromedriver

# Add your application code and dependencies here
# ...
RUN pip install -r requirements.txt
# Expose the port your application will listen on (if necessary)
EXPOSE 5000

# Define the command to run your application
CMD ["python", "main.py"]
