# Stage 1: Builder
FROM python:3.11-slim AS builder

WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt
COPY app.py .
# Stage 2: Runtime
FROM python:3.11-slim

WORKDIR /app

# Copy installed packages from builder
COPY --from=builder /app /app

# Copy application code
COPY app.py .

RUN pip install --no-cache-dir --user -r requirements.txt


EXPOSE 5000
CMD ["python3", "app.py"]
