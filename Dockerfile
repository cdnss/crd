# Stage 1: Build the application
FROM python:3.11-slim-buster AS builder
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
EXPOSE 5000
# Stage 2: Create the runtime image
FROM python:3.11-slim-buster
WORKDIR /app
COPY --from=builder /app .
COPY chromedriver /usr/local/bin/chromedriver
CMD ["python", "main.py"]
