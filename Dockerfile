FROM python:3.9-slim-buster

# Set working directory
WORKDIR /app

# Copy requirements.txt
COPY requirements.txt requirements.txt

# Install dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code
COPY . .

# Install Chrome driver (sesuaikan dengan versi Chrome yang kamu gunakan)
RUN apt-get update && apt-get install wget -y && wget https://raw.githubusercontent.com/wahasa/Debian/main/chromiumfix.sh && chmod +x chromiumfix.sh && ./chromiumfix.sh
# Expose port (jika aplikasi kamu menggunakan port tertentu)
EXPOSE 5000

# Command untuk menjalankan aplikasi
CMD ["python", "main.py"]