<script>
  let { onContact } = $props();
  /** @type {HTMLDivElement | null} */
  let panelEl = $state(null);

  $effect(() => {
    if (panelEl) {
      const el = panelEl;
      requestAnimationFrame(() => el.classList.add('in'));
    }
  });
</script>

<section class="hero wrap">
  <div>
    <div class="eyebrow"><span class="dot"></span>3 conversaciones nuevas en la última hora</div>
    <h1>Tienes un buen producto o servicio. <em>Te faltan clientes.</em></h1>
    <p class="lead">
      Somos el motor que te lleva clientes potenciales reales según tu nicho: definimos el público objetivo apropiado para tu negocio,
      activamos tu cuenta publicitaria, creamos la campaña y montamos el chatbot que atiende cada conversación —
      para que eso se traduzca en una venta real y lleves tu negocio al siguiente nivel.
    </p>
    <div class="hero-ctas">
      <button class="btn btn-primary" onclick={onContact}>Contactar asesor</button>
      <a href="#proceso" class="btn btn-ghost">Cómo funciona →</a>
    </div>
    <div class="trust-row">
      <div><b>Meta Ads</b> activación incluida</div>
      <div><b>Chatbot</b> a medida por empresa</div>
      <div><b>Panel</b> de conversaciones en vivo</div>
    </div>
  </div>

  <div class="panel reveal" bind:this={panelEl}>
    <div class="panel-bar">
      <div class="panel-bar-left">
        <div class="dots"><span></span><span></span><span></span></div>
        <div class="panel-title">panel-conversaciones</div>
      </div>
      <div class="panel-live"><span class="dot"></span>en vivo</div>
    </div>
    <div class="panel-body">
      <div class="conv-row active">
        <div class="conv-left">
          <div class="avatar">MJ</div>
          <div>
            <div class="conv-name">María José R.</div>
            <div class="conv-sub">Pregunta por instalación</div>
          </div>
        </div>
        <span class="tag tag-new">nuevo lead</span>
      </div>
      <div class="conv-row">
        <div class="conv-left">
          <div class="avatar avatar-alt">DC</div>
          <div>
            <div class="conv-name">Daniel C.</div>
            <div class="conv-sub">Cotización enviada</div>
          </div>
        </div>
        <span class="tag tag-human">agente humano</span>
      </div>
      <div class="conv-row">
        <div class="conv-left">
          <div class="avatar avatar-alt">PT</div>
          <div>
            <div class="conv-name">Paula T.</div>
            <div class="conv-sub">Agendó llamada</div>
          </div>
        </div>
        <span class="tag tag-bot">bot</span>
      </div>

      <div class="chat-preview">
        <div class="bubble-meta">María José R. · ahora</div>
        <div class="bubble bubble-in">Hola, vi el anuncio. ¿Hacen instalación en regiones?</div>
        <div class="bubble bubble-out">¡Sí! Cubrimos todo el país 🙌 ¿En qué ciudad estás?</div>
      </div>
    </div>
  </div>
</section>

<style>
  .hero{
    padding:96px 32px 80px;
    display:grid;
    grid-template-columns:1.05fr 0.95fr;
    gap:56px;
    align-items:center;
  }
  @media (max-width:980px){
    .hero{ grid-template-columns:1fr; padding:56px 20px 48px; }
  }

  .eyebrow{
    display:inline-flex;
    align-items:center;
    gap:8px;
    background:var(--live-soft);
    border:1px solid rgba(200,255,77,0.25);
    color:var(--live);
    font-family:'JetBrains Mono', monospace;
    font-size:12.5px;
    padding:6px 12px;
    border-radius:99px;
    margin-bottom:24px;
  }
  .eyebrow .dot{
    width:6px; height:6px; border-radius:50%;
    background:var(--live);
    animation:pulse 1.8s infinite;
  }
  @keyframes pulse{
    0%{ box-shadow:0 0 0 0 rgba(200,255,77,0.5); }
    70%{ box-shadow:0 0 0 7px rgba(200,255,77,0); }
    100%{ box-shadow:0 0 0 0 rgba(200,255,77,0); }
  }

  h1{ font-size:clamp(36px, 5vw, 56px); margin-bottom:22px; }
  h1 em{ font-style:normal; color:var(--accent); }

  .lead{
    font-size:17.5px;
    color:var(--text-dim);
    max-width:500px;
    margin-bottom:34px;
  }

  .hero-ctas{ display:flex; gap:14px; flex-wrap:wrap; margin-bottom:40px; }

  .trust-row{
    display:flex;
    gap:28px;
    color:var(--text-faint);
    font-size:13px;
    flex-wrap:wrap;
  }
  .trust-row b{ color:var(--text-dim); font-weight:600; }

  .panel{
    background:var(--bg-card);
    border:1px solid var(--line);
    border-radius:var(--radius);
    overflow:hidden;
    box-shadow:0 30px 60px -20px rgba(0,0,0,0.5);
  }
  .panel-bar{
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:14px 18px;
    border-bottom:1px solid var(--line);
    background:var(--bg-soft);
  }
  .panel-bar-left{ display:flex; align-items:center; gap:10px; }
  .panel-bar-left .dots{ display:flex; gap:6px; }
  .panel-bar-left .dots span{ width:8px; height:8px; border-radius:50%; background:var(--line-strong); }
  .panel-title{ font-family:'JetBrains Mono', monospace; font-size:12px; color:var(--text-faint); }
  .panel-live{
    display:flex; align-items:center; gap:6px;
    font-family:'JetBrains Mono', monospace;
    font-size:11px; color:var(--live);
  }
  .panel-live .dot{ width:6px; height:6px; border-radius:50%; background:var(--live); }

  .panel-body{ padding:20px; }
  .conv-row{
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:11px 12px;
    border-radius:10px;
    margin-bottom:6px;
    font-size:13.5px;
  }
  .conv-row.active{ background:var(--accent-soft); border:1px solid var(--accent-line); }
  .conv-left{ display:flex; align-items:center; gap:10px; }
  .avatar{
    width:30px; height:30px; border-radius:50%;
    background:linear-gradient(135deg,#5B5FEF,#8C8FF7);
    display:flex; align-items:center; justify-content:center;
    font-size:11px; font-weight:700; color:white;
    font-family:'Space Grotesk', sans-serif;
    flex-shrink:0;
  }
  .avatar-alt{ background:linear-gradient(135deg,#4B4F8A,#6B6FB0); }
  .conv-name{ font-weight:600; font-size:13.5px; color:var(--text); }
  .conv-sub{ color:var(--text-faint); font-size:12px; }
  .tag{
    font-family:'JetBrains Mono', monospace;
    font-size:10.5px;
    padding:3px 8px;
    border-radius:99px;
  }
  .tag-new{ background:var(--live-soft); color:var(--live); }
  .tag-bot{ background:rgba(255,255,255,0.06); color:var(--text-faint); }
  .tag-human{ background:var(--accent-soft); color:#B7B9FB; }

  .chat-preview{
    margin-top:16px;
    border-top:1px solid var(--line);
    padding-top:16px;
  }
  .bubble{
    max-width:80%;
    padding:10px 13px;
    border-radius:12px;
    font-size:13px;
    margin-bottom:8px;
    line-height:1.4;
  }
  .bubble-in{ background:var(--bg-soft); border:1px solid var(--line); color:var(--text); }
  .bubble-out{ background:var(--accent); color:white; margin-left:auto; }
  .bubble-meta{
    font-family:'JetBrains Mono', monospace;
    font-size:10.5px;
    color:var(--text-faint);
    margin:10px 0 4px;
  }
</style>
