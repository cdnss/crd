# Gunakan base image yang lebih kecil (misalnya, Python slim-buster)
FROM python:3.11-slim-buster

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Install Chromium dan ChromeDriver (sesuaikan versi)
RUN apt-get update && \
    apt-get install -y chromium=114.0.5735.90 chromium-driver=114.0.5735.90

# Copy aplikasi
COPY . .

# Expose port (jika diperlukan)
EXPOSE 8080

# Command untuk menjalankan aplikasi
CMD ["xvfb-run", "-a", "-s", "-screen 0 1280x1024x24", "python", "main.py"]
