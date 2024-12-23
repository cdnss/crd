FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

# Install chromium, fonts, and dependencies
RUN apt-get update && \
    apt-get upgrade \
    apt-get install -y --no-install-recommends \
        fonts-liberation \
        libxss1 \
        libglib2.0-0 \
        libgtk-3-0 \
        libgtk-3-dev \
        libatk1.0-0 \
        libatk-1.0-dev \
        libcairo2-dev \
        python3-dev \
        libxrender1 \
        libx11-6 \
        libxcursor-dev \
        xauth \
        && rm -rf /var/lib/apt/lists/*

# Install chromium
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && sudo dpkg -i google-chrome-stable_current_amd64.deb \
    && rm google-chrome-stable_current_amd64.deb

# Copy your application code
COPY . .

CMD ["python", "main.py"]
