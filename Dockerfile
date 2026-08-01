FROM php:8.2-cli

RUN apt-get update && apt-get install -y \
    unzip \
    libcurl4-openssl-dev \
 && docker-php-ext-install curl \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN mkdir -p data bots

EXPOSE 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "."]
