<script>
  const servicios = [
    {
      titulo: 'Definición de público objetivo',
      texto: 'Identificamos a quién le tiene que hablar tu negocio para que la inversión se traduzca en ventas reales, no solo en alcance.',
      icon: 'target'
    },
    {
      titulo: 'Campañas de marketing digital',
      texto: 'Estrategia, segmentación y anuncios pensados para atraer clientes potenciales reales para tu marca o servicio.',
      icon: 'campaign'
    },
    {
      titulo: 'Activación de cuenta Meta Ads',
      texto: 'Si tu cuenta publicitaria aún no está lista, la activamos y configuramos para que puedas empezar a invertir sin trabas.',
      icon: 'meta'
    },
    {
      titulo: 'Chatbot a medida',
      texto: 'Un asistente conversacional personalizado para tu empresa, que recibe y filtra cada lead que llega desde tus anuncios.',
      icon: 'chat'
    },
    {
      titulo: 'Panel de conversaciones',
      texto: 'Visualiza y gestiona en un solo lugar todas las conversaciones con tus clientes potenciales, sin perder ningún lead.',
      icon: 'panel'
    },
    {
      titulo: 'Automatizaciones a medida',
      texto: 'Si tu negocio lo requiere, conectamos flujos automáticos adicionales en cualquier ámbito técnicamente posible.',
      icon: 'auto'
    }
  ];
</script>

<section id="servicios" class="wrap">
  <div class="section-head reveal">
    <span class="section-eyebrow">Qué incluye</span>
    <h2>Un sistema de captación, no una serie de tareas sueltas.</h2>
    <p>Marketing digital, atención automatizada y visibilidad de cada conversación — pensado para que cada lead se convierta en una venta real.</p>
  </div>

  <div class="services reveal">
    {#each servicios as s}
      <div class="service-card">
        <div class="service-icon">
          {#if s.icon === 'target'}
            <svg width="20" height="20" viewBox="0 0 20 20" fill="none"><circle cx="10" cy="10" r="7" stroke="#9BB1FF" stroke-width="1.8"/><circle cx="10" cy="10" r="3.5" stroke="#9BB1FF" stroke-width="1.8"/><circle cx="10" cy="10" r="0.8" fill="#9BB1FF"/></svg>
          {:else if s.icon === 'campaign'}
            <svg width="20" height="20" viewBox="0 0 20 20" fill="none"><path d="M3 12L8 7L11 10L17 4" stroke="#9BB1FF" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/><path d="M13 4H17V8" stroke="#9BB1FF" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
          {:else if s.icon === 'meta'}
            <svg width="20" height="20" viewBox="0 0 20 20" fill="none"><rect x="3" y="3" width="14" height="14" rx="3" stroke="#9BB1FF" stroke-width="1.8"/><path d="M7 8H13M7 12H10" stroke="#9BB1FF" stroke-width="1.8" stroke-linecap="round"/></svg>
          {:else if s.icon === 'chat'}
            <svg width="20" height="20" viewBox="0 0 20 20" fill="none"><path d="M3 5C3 3.9 3.9 3 5 3H15C16.1 3 17 3.9 17 5V11C17 12.1 16.1 13 15 13H8L4 17V13H5C3.9 13 3 12.1 3 11V5Z" stroke="#9BB1FF" stroke-width="1.8" stroke-linejoin="round"/></svg>
          {:else if s.icon === 'panel'}
            <svg width="20" height="20" viewBox="0 0 20 20" fill="none"><rect x="3" y="4" width="14" height="11" rx="2" stroke="#9BB1FF" stroke-width="1.8"/><path d="M3 7H17" stroke="#9BB1FF" stroke-width="1.8"/><circle cx="6.5" cy="5.5" r="0.6" fill="#9BB1FF"/></svg>
          {:else}
            <svg width="20" height="20" viewBox="0 0 20 20" fill="none"><path d="M10 3V17M3 10H17" stroke="#9BB1FF" stroke-width="1.8" stroke-linecap="round"/><circle cx="10" cy="10" r="7" stroke="#9BB1FF" stroke-width="1.8"/></svg>
          {/if}
        </div>
        <h3>{s.titulo}</h3>
        <p>{s.texto}</p>
      </div>
    {/each}
  </div>
</section>

<style>
  .services{
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:18px;
  }
  @media (max-width:900px){
    .services{ grid-template-columns:1fr; }
  }
  .service-card{
    background:var(--bg-card);
    border:1px solid var(--line);
    border-radius:var(--radius);
    padding:28px;
  }
  .service-icon{
    width:40px; height:40px;
    border-radius:10px;
    background:var(--accent-soft);
    display:flex; align-items:center; justify-content:center;
    margin-bottom:20px;
  }
  .service-card h3{ font-size:17px; margin-bottom:10px; }
  .service-card p{ color:var(--text-dim); font-size:14px; }
</style>
