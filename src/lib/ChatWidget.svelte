<script>
  // URL del webhook de n8n. Se define en .env como VITE_N8N_WEBHOOK_URL
  // Ejemplo: https://tu-vps.com:5678/webhook/leadsflow-chat
  const WEBHOOK_URL = import.meta.env.VITE_N8N_WEBHOOK_URL || '';

  let isOpen = $state(false);
  let messages = $state([
    { from: 'bot', text: '¡Hola! 👋 Soy el asistente de LeadsFlow. Cuéntame de tu negocio y te conecto con un asesor.' }
  ]);
  let input = $state('');
  let isSending = $state(false);
  let sessionId = $state(crypto.randomUUID());
  /** @type {HTMLDivElement | null} */
  let listEl = $state(null);

  function toggle() {
    isOpen = !isOpen;
  }

  function scrollToBottom() {
    requestAnimationFrame(() => {
      if (listEl) listEl.scrollTop = listEl.scrollHeight;
    });
  }

  async function sendMessage() {
    const text = input.trim();
    if (!text || isSending) return;

    messages = [...messages, { from: 'user', text }];
    input = '';
    isSending = true;
    scrollToBottom();

    if (!WEBHOOK_URL) {
      messages = [...messages, {
        from: 'bot',
        text: 'El chat aún no está conectado a n8n. Configura VITE_N8N_WEBHOOK_URL en el archivo .env con la URL de tu webhook.'
      }];
      isSending = false;
      scrollToBottom();
      return;
    }

    try {
      const res = await fetch(WEBHOOK_URL, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          sessionId,
          message: text,
          source: 'leadsflow-web',
          timestamp: new Date().toISOString()
        })
      });

      if (!res.ok) throw new Error(`HTTP ${res.status}`);

      const data = await res.json().catch(() => null);
      const reply = data?.reply || data?.message || data?.output
        || 'Recibimos tu mensaje, un asesor te va a escribir pronto.';

      messages = [...messages, { from: 'bot', text: reply }];
    } catch (err) {
      messages = [...messages, {
        from: 'bot',
        text: 'No pudimos enviar tu mensaje en este momento. Por favor intenta de nuevo en unos segundos.'
      }];
    } finally {
      isSending = false;
      scrollToBottom();
    }
  }

  /** @param {KeyboardEvent} e */
  function handleKeydown(e) {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault();
      sendMessage();
    }
  }

  export function open() {
    isOpen = true;
  }
</script>

<div class="widget-root">
  {#if isOpen}
    <div class="chat-window" role="dialog" aria-label="Chat con LeadsFlow">
      <div class="chat-header">
        <div class="chat-header-info">
          <span class="status-dot"></span>
          <div>
            <div class="chat-title">Asesor LeadsFlow</div>
            <div class="chat-sub">Normalmente responde en minutos</div>
          </div>
        </div>
        <button class="icon-btn" onclick={toggle} aria-label="Cerrar chat">
          <svg width="18" height="18" viewBox="0 0 18 18" fill="none"><path d="M4 4L14 14M14 4L4 14" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/></svg>
        </button>
      </div>

      <div class="chat-body" bind:this={listEl}>
        {#each messages as msg}
          <div class="msg {msg.from === 'user' ? 'msg-user' : 'msg-bot'}">{msg.text}</div>
        {/each}
        {#if isSending}
          <div class="msg msg-bot typing">
            <span></span><span></span><span></span>
          </div>
        {/if}
      </div>

      <div class="chat-input-row">
        <textarea
          bind:value={input}
          onkeydown={handleKeydown}
          placeholder="Escribe tu mensaje..."
          rows="1"
          disabled={isSending}
        ></textarea>
        <button class="send-btn" onclick={sendMessage} disabled={isSending || !input.trim()} aria-label="Enviar mensaje">
          <svg width="18" height="18" viewBox="0 0 18 18" fill="none"><path d="M2 9L16 2L9 16L7.5 10.5L2 9Z" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round" fill="currentColor" fill-opacity="0.05"/></svg>
        </button>
      </div>
    </div>
  {/if}

  <button class="fab" onclick={toggle} aria-label={isOpen ? 'Cerrar chat' : 'Abrir chat con un asesor'}>
    {#if isOpen}
      <svg width="22" height="22" viewBox="0 0 18 18" fill="none"><path d="M4 4L14 14M14 4L4 14" stroke="white" stroke-width="1.8" stroke-linecap="round"/></svg>
    {:else}
      <svg width="24" height="24" viewBox="0 0 24 24" fill="none"><path d="M4 6C4 4.9 4.9 4 6 4H18C19.1 4 20 4.9 20 6V14C20 15.1 19.1 16 18 16H10L5 20V16H6C4.9 16 4 15.1 4 14V6Z" stroke="white" stroke-width="1.8" stroke-linejoin="round"/></svg>
    {/if}
  </button>
</div>

<style>
  .widget-root{
    position:fixed;
    bottom:24px;
    right:24px;
    z-index:100;
    display:flex;
    flex-direction:column;
    align-items:flex-end;
    gap:14px;
  }

  .fab{
    width:58px; height:58px;
    border-radius:50%;
    background:var(--accent);
    display:flex; align-items:center; justify-content:center;
    box-shadow:0 12px 28px -8px rgba(91,95,239,0.6);
    transition:transform .15s ease;
  }
  .fab:hover{ transform:scale(1.05); }

  .chat-window{
    width:340px;
    max-height:480px;
    background:var(--bg-card);
    border:1px solid var(--line);
    border-radius:16px;
    display:flex;
    flex-direction:column;
    overflow:hidden;
    box-shadow:0 24px 60px -10px rgba(0,0,0,0.55);
  }

  @media (max-width:480px){
    .chat-window{
      width:calc(100vw - 32px);
    }
  }

  .chat-header{
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:14px 16px;
    border-bottom:1px solid var(--line);
    background:var(--bg-soft);
  }
  .chat-header-info{ display:flex; align-items:center; gap:10px; }
  .status-dot{
    width:8px; height:8px; border-radius:50%;
    background:var(--live);
    flex-shrink:0;
  }
  .chat-title{ font-weight:600; font-size:14px; color:var(--text); }
  .chat-sub{ font-size:11.5px; color:var(--text-faint); }
  .icon-btn{
    color:var(--text-faint);
    width:28px; height:28px;
    display:flex; align-items:center; justify-content:center;
    border-radius:8px;
  }
  .icon-btn:hover{ background:rgba(255,255,255,0.06); color:var(--text); }

  .chat-body{
    flex:1;
    overflow-y:auto;
    padding:16px;
    display:flex;
    flex-direction:column;
    gap:10px;
    min-height:240px;
    max-height:320px;
  }

  .msg{
    max-width:82%;
    padding:10px 13px;
    border-radius:12px;
    font-size:13.5px;
    line-height:1.45;
  }
  .msg-bot{
    background:var(--bg-soft);
    border:1px solid var(--line);
    color:var(--text);
    align-self:flex-start;
  }
  .msg-user{
    background:var(--accent);
    color:white;
    align-self:flex-end;
  }

  .typing{ display:flex; gap:4px; padding:13px; }
  .typing span{
    width:6px; height:6px; border-radius:50%;
    background:var(--text-faint);
    animation:bounce 1.2s infinite ease-in-out;
  }
  .typing span:nth-child(2){ animation-delay:0.15s; }
  .typing span:nth-child(3){ animation-delay:0.3s; }
  @keyframes bounce{
    0%, 60%, 100%{ transform:translateY(0); opacity:0.5; }
    30%{ transform:translateY(-4px); opacity:1; }
  }

  .chat-input-row{
    display:flex;
    align-items:flex-end;
    gap:8px;
    padding:12px;
    border-top:1px solid var(--line);
  }
  textarea{
    flex:1;
    resize:none;
    background:var(--bg-soft);
    border:1px solid var(--line-strong);
    border-radius:10px;
    padding:9px 12px;
    color:var(--text);
    font-family:inherit;
    font-size:13.5px;
    max-height:80px;
  }
  textarea:focus{ outline:none; border-color:var(--accent-line); }
  textarea::placeholder{ color:var(--text-faint); }

  .send-btn{
    width:36px; height:36px;
    border-radius:10px;
    background:var(--accent);
    color:white;
    display:flex; align-items:center; justify-content:center;
    flex-shrink:0;
    transition:opacity .15s ease;
  }
  .send-btn:disabled{ opacity:0.4; cursor:default; }
  .send-btn:not(:disabled):hover{ opacity:0.9; }

  button:focus-visible, textarea:focus-visible{
    outline:2px solid var(--accent);
    outline-offset:2px;
  }
</style>
