# ─── Etapa 1: Build ──────────────────────────────────────────────────────────
FROM node:22-alpine AS builder

WORKDIR /app

# Copiar manifiestos primero para aprovechar el cache de capas de Docker
COPY package*.json ./

RUN npm ci

# Copiar el resto del código fuente
COPY . .

# Build de producción (genera /app/dist)
RUN npm run build

# ─── Etapa 2: Servir con nginx ────────────────────────────────────────────────
FROM nginx:stable-alpine AS production

# Copiar configuración de nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiar solo el output del build (dist/) desde la etapa anterior
COPY --from=builder /app/dist /usr/share/nginx/html

# Exponer el puerto 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
