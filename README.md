# LeadsFlow — Landing page

Landing page de LeadsFlow construida en **Svelte 5 + Vite**. Incluye un widget de chat flotante que envía los mensajes a un webhook de **n8n**.

## Desarrollo local

```bash
npm install
npm run dev
```

Abre `http://localhost:5173`.

---

## Conectar el chat a n8n

1. En n8n, crea un workflow con un nodo **Webhook** (método `POST`).
2. Copia la **Production URL** del webhook.
3. Crea el archivo `.env` en la raíz del proyecto:

   ```bash
   cp .env.example .env
   ```

4. Pega la URL en `.env`:

   ```
   VITE_N8N_WEBHOOK_URL=https://tu-vps.com:5678/webhook/leadsflow-chat
   ```

El widget envía un `POST` con este body:

```json
{
  "sessionId": "uuid",
  "message": "texto del visitante",
  "source": "leadsflow-web",
  "timestamp": "2026-06-30T..."
}
```

Responde con `{ "reply": "..." }`, `{ "message": "..." }` o `{ "output": "..." }`.

---

## Deploy en Dokploy con Dockerfile

Este proyecto incluye un `Dockerfile` multi-stage listo para usar en Dokploy:

- **Etapa 1 (builder)**: instala dependencias y ejecuta `npm run build` con Node 22 Alpine.
- **Etapa 2 (production)**: copia solo `dist/` al servidor nginx:alpine. Imagen final pequeña (~25 MB).

### Paso a paso en Dokploy

1. **Sube el proyecto a un repositorio Git** (GitHub, GitLab, Gitea, etc.) o usa la opción de subir archivos directamente en Dokploy.

2. **Crea un nuevo proyecto en Dokploy**:
   - Entra a tu instancia de Dokploy.
   - Haz clic en **"New Project"** → ponle nombre (ej. `leadsflow`).

3. **Crea un servicio de tipo Application**:
   - Dentro del proyecto, haz clic en **"Create Service"** → selecciona **"Application"**.

4. **Configura el Source (Git)**:
   - En la pestaña **"Git"**, conecta tu repositorio y selecciona la rama `main`.

5. **Configura el Build**:
   - En la pestaña **"General"**, selecciona `Build Type: Dockerfile`.
   - Dokploy detecta el `Dockerfile` automáticamente en la raíz del proyecto.

6. **Configura las variables de entorno**:
   - En la pestaña **"Environment"**, agrega:
     ```
     VITE_N8N_WEBHOOK_URL=https://tu-dominio.com:5678/webhook/leadsflow-chat
     ```

7. **Despliega**:
   - Haz clic en **"Deploy"**. Dokploy construye la imagen con Docker y la leva en nginx.

8. **Configura el dominio**:
   - En la pestaña **"Domains"**, haz clic en **"Generate Domain"** o agrega tu dominio propio.
   - Asegúrate de que el puerto sea **`80`** (es el que expone nginx).

9. **Activa SSL**:
   - En la misma pestaña de dominios, activa **"HTTPS / Let's Encrypt"** para que Dokploy genere el certificado automáticamente.

### Variables de entorno disponibles

| Variable | Requerida | Descripción |
|---|---|---|
| `VITE_N8N_WEBHOOK_URL` | Sí (para el chat) | URL del webhook de n8n que recibe los mensajes |

### Estructura del proyecto

```
leadsflow/
├── Dockerfile              ← Build multi-stage para Dokploy
├── nginx.conf              ← Config de nginx (SPA + cache + gzip)
├── .dockerignore           ← Excluye node_modules y .env del contexto Docker
├── .env.example            ← Plantilla de variables de entorno
├── src/
│   ├── lib/
│   │   ├── Header.svelte
│   │   ├── Hero.svelte
│   │   ├── Proceso.svelte
│   │   ├── Servicios.svelte
│   │   ├── Precios.svelte        ← Plan Campaña + Plan Campaña+Chatbot
│   │   ├── Automatizaciones.svelte
│   │   ├── Politicas.svelte
│   │   ├── CTA.svelte
│   │   ├── Footer.svelte
│   │   ├── ChatWidget.svelte     ← Widget de chat → n8n webhook
│   │   ├── Logo.svelte
│   │   └── CheckIcon.svelte
│   ├── App.svelte
│   ├── app.css
│   └── main.js
├── public/
│   └── favicon.svg
└── index.html
```

### Actualizar la página

Cualquier cambio en el código se despliega haciendo push a tu rama `main` (con Auto Deploy activo en Dokploy) o manualmente desde el panel con el botón **"Redeploy"**.

Para cambiar los textos o precios, edita directamente el componente correspondiente en `src/lib/`. Para cambiar el webhook de n8n, actualiza la variable de entorno en Dokploy (no requiere cambiar código).
