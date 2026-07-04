# === STAGE 1: BASE SETUP ===
FROM python:3.10-slim
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    DEBIAN_FRONTEND=noninteractive
WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

# === STAGE 2: DEPENDENCIES CACHING ===
COPY requirements.txt . 
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# === STAGE 3: SECURITY & SOURCE CODE ===
RUN adduser --disabled-password --gecos "" mluser
COPY --chown=mluser:mluser ./src /app/src
USER mluser
EXPOSE 8000

# === STAGE 4: EXECUTION ===
CMD ["uvicorn", "src.app.app:app", "--host", "0.0.0.0", "--port", "8000"]