FROM php:7.4-apache

# Instala dependências e extensões PHP
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    zip \
    nano \
    && docker-php-ext-install pdo pdo_mysql zip mysqli

# Ativa o mod_rewrite do Apache
RUN a2enmod rewrite

# Define ServerName para evitar warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Garante que AllowOverride All está habilitado (para usar .htaccess)
RUN sed -i 's|<Directory /var/www/>|<Directory /var/www/html/>|g' /etc/apache2/apache2.conf && \
    sed -i '/<Directory \/var\/www\/html\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Define o diretório de trabalho
WORKDIR /var/www/html

# Copia os arquivos do projeto para o container
COPY . .

# Ajusta permissões para o Apache
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html/application

# Expõe a porta padrão do Apache
EXPOSE 80
