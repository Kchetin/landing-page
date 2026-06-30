<script>
  let { onContact } = $props();

  const ejemplos = [
    {
      num: '01',
      titulo: 'Seguimiento automático de pedidos',
      texto: 'El cliente recibe actualizaciones de su pedido o servicio por WhatsApp sin que nadie tenga que escribirle manualmente.'
    },
    {
      num: '02',
      titulo: 'Agendamiento y recordatorios de citas',
      texto: 'Conexión con Cal.com u otro calendario: el lead agenda solo y recibe recordatorios automáticos antes de la hora.'
    },
    {
      num: '03',
      titulo: 'Integración con CRM o planilla de ventas',
      texto: 'Cada conversación y cada venta se registra automáticamente en tu CRM o Google Sheets, sin doble digitación.'
    },
    {
      num: '04',
      titulo: 'Cotizaciones y respuestas automáticas',
      texto: 'El chatbot calcula y envía cotizaciones según reglas de tu negocio (cantidad, tipo de producto, ubicación), sin esperar a un humano.'
    },
    {
      num: '05',
      titulo: 'Reportes automáticos de gestión',
      texto: 'Reportes periódicos por WhatsApp o correo con métricas clave de tu negocio: leads nuevos, conversaciones pendientes, ventas cerradas.'
    }
  ];
</script>

<section id="automatizaciones" class="wrap">
  <div class="section-head reveal">
    <span class="section-eyebrow">Automatizaciones a medida</span>
    <h2>Si tu negocio lo necesita, lo conectamos.</h2>
    <p>Además de la campaña y el chatbot, podemos construir flujos automáticos para cualquier proceso de tu negocio que sea técnicamente posible de automatizar. El costo depende del alcance y la dificultad de cada requerimiento — se cotiza después de entender tu caso, no es un precio fijo.</p>
  </div>

  <div class="automation-grid reveal">
    {#each ejemplos as e}
      <div class="automation-card">
        <div class="automation-num">{e.num}</div>
        <h3>{e.titulo}</h3>
        <p>{e.texto}</p>
      </div>
    {/each}

    <div class="automation-card automation-card-cta">
      <h3>¿Tienes algo distinto en mente?</h3>
      <p>Si es técnicamente posible de automatizar, lo evaluamos contigo y te decimos exactamente qué costaría.</p>
      <button class="btn btn-primary" onclick={onContact}>Cotizar mi automatización</button>
    </div>
  </div>
</section>

<style>
  .automation-grid{
    display:grid;
    grid-template-columns:repeat(3, 1fr);
    gap:18px;
  }
  @media (max-width:900px){ .automation-grid{ grid-template-columns:1fr; } }

  .automation-card{
    background:var(--bg-card);
    border:1px solid var(--line);
    border-radius:var(--radius);
    padding:28px;
  }
  .automation-num{
    font-family:'JetBrains Mono', monospace;
    font-size:13px;
    color:var(--accent);
    margin-bottom:14px;
  }
  .automation-card h3{ font-size:17px; margin-bottom:10px; }
  .automation-card p{ color:var(--text-dim); font-size:14px; }

  .automation-card-cta{
    background:linear-gradient(180deg, rgba(91,95,239,0.1), rgba(91,95,239,0.02));
    border-color:var(--accent-line);
    display:flex;
    flex-direction:column;
    justify-content:center;
  }
  .automation-card-cta h3{ margin-bottom:8px; }
  .automation-card-cta p{ margin-bottom:18px; }
  .automation-card-cta .btn{ width:100%; justify-content:center; }
</style>
