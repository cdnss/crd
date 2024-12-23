# Gunakan base image yang lebih kecil (misalnya, Python slim-buster)
FROM python:3.11-slim-buster

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Install Chromium dan ChromeDriver (sesuaikan versi)
RUN apt-get update && \
    apt-get install -y chromium chromium-driver

# Copy aplikasi
COPY . .

# Expose port (jika diperlukan)
EXPOSE 5000

# Command untuk menjalankan aplikasi
CMD ["python", "main.py"]
