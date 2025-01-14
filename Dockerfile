# Usa una imagen base oficial de Python para la construcción
FROM python:3.9.20-alpine3.20

# Establece el directorio de trabajo
WORKDIR /app

# Instala curl
RUN apk add --no-cache curl

# Copia el archivo de dependencias (en este caso, requirements.txt)
COPY requirements.txt .

# Instala las dependencias en un entorno temporal
RUN pip install --no-cache-dir -r requirements.txt --target=/app/deps

# Establece la variable de entorno para que Python pueda encontrar las dependencias
ENV PYTHONPATH=/app/deps

