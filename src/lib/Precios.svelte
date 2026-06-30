<script>
  import CheckIcon from './CheckIcon.svelte';

  let { onContact } = $props();
</script>

<section id="precios" class="wrap">
  <div class="section-head reveal">
    <span class="section-eyebrow">Precios</span>
    <h2>Elige cómo empezar. Crece cuando quieras.</h2>
    <p>Dos planes mensuales según lo que tu negocio necesita hoy. La inversión en pauta publicitaria se paga directo a Meta, aparte de este servicio.</p>
  </div>

  <div class="pricing-grid reveal">
    <div class="price-card">
      <h3>Plan Campaña</h3>
      <div class="price-sub">Público objetivo + gestión de campaña</div>
      <div class="price-period">Mensual</div>
      <div class="price-amount">$249.990</div>
      <div class="price-iva">+ IVA / mes</div>
      <ul class="price-list">
        <li><CheckIcon />Definición del público objetivo apropiado para tu negocio</li>
        <li><CheckIcon />Estrategia y creación de campaña de marketing digital</li>
        <li><CheckIcon />Creación de anuncios orientados a atraer clientes potenciales</li>
        <li><CheckIcon />Optimización mensual de campaña y audiencias</li>
      </ul>
      <button class="btn btn-ghost" onclick={onContact}>Contactar asesor</button>

      <div class="upgrade-note">
        ¿Quieres que el chatbot atienda cada lead 24/7? Puedes subir al Plan Campaña + Chatbot cuando quieras, sin perder tu campaña ni tu historial.
      </div>
    </div>

    <div class="price-card featured">
      <h3>Plan Campaña + Chatbot</h3>
      <div class="price-sub">Todo lo del Plan Campaña + chatbot + panel</div>
      <div class="price-period">Mensual</div>
      <div class="price-amount">$399.990</div>
      <div class="price-iva">+ IVA / mes</div>
      <ul class="price-list">
        <li><CheckIcon />Todo lo incluido en el Plan Campaña</li>
        <li><CheckIcon />Chatbot personalizado para tu empresa o servicio</li>
        <li><CheckIcon />Panel de visualización y gestión de conversaciones</li>
        <li><CheckIcon />Ningún lead se pierde: atención automática las 24 horas</li>
      </ul>
      <button class="btn btn-primary" onclick={onContact}>Contactar asesor</button>
    </div>
  </div>

  <div class="pricing-extras reveal">
    <div class="custom-card">
      <h4>Activación de cuenta publicitaria en Meta</h4>
      <p>Si tu cuenta aún no está lista para operar, la configuramos y verificamos antes de lanzar tu primera campaña. Pago único, solo si aplica.</p>
      <div class="price-amount small">$99.990</div>
      <div class="price-iva extra-margin">+ IVA, pago único</div>
      <button class="btn btn-ghost" onclick={onContact}>Consultar si aplica</button>
    </div>

    <div class="custom-card">
      <h4>¿Tu negocio necesita algo más?</h4>
      <p>Más abajo te mostramos ejemplos reales de automatizaciones a medida que podemos construir, y qué incluye exactamente cada plan.</p>
      <a href="#automatizaciones" class="btn btn-ghost">Ver automatizaciones a medida →</a>
    </div>
  </div>

  <p class="pauta-note">
    Recomendamos un presupuesto de pauta publicitaria desde $300.000/mes, pagado directo a Meta desde tu cuenta, para que el algoritmo tenga suficiente información y optimice la entrega de tus anuncios.
  </p>
</section>

<style>
  .pricing-grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:20px;
    align-items:stretch;
  }
  @media (max-width:900px){ .pricing-grid{ grid-template-columns:1fr; } }

  .pricing-extras{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:20px;
    margin-top:20px;
  }
  @media (max-width:900px){ .pricing-extras{ grid-template-columns:1fr; } }

  .price-period{
    font-family:'JetBrains Mono', monospace;
    font-size:13px;
    color:var(--text-faint);
    margin-bottom:4px;
  }

  .price-card{
    border:1px solid var(--line);
    border-radius:var(--radius);
    padding:36px;
    background:var(--bg-card);
    display:flex;
    flex-direction:column;
  }
  .price-card.featured{
    border-color:var(--accent-line);
    background:linear-gradient(180deg, rgba(91,95,239,0.07), rgba(91,95,239,0.02));
    position:relative;
  }
  .price-card.featured::before{
    content:"MÁS COMPLETO";
    position:absolute;
    top:-1px; right:24px;
    transform:translateY(-50%);
    font-family:'JetBrains Mono', monospace;
    font-size:10.5px;
    letter-spacing:0.05em;
    background:var(--accent);
    color:white;
    padding:5px 10px;
    border-radius:6px;
  }
  .price-card h3{ font-size:20px; margin-bottom:6px; }
  .price-sub{ color:var(--text-faint); font-size:13.5px; margin-bottom:24px; }
  .price-amount{
    font-family:'JetBrains Mono', monospace;
    font-size:38px;
    font-weight:600;
    margin-bottom:4px;
  }
  .price-amount.small{ font-size:26px; }
  .price-iva{ color:var(--text-faint); font-size:12.5px; margin-bottom:26px; }
  .price-iva.extra-margin{ margin-bottom:18px; }
  .price-list{ flex:1; margin-bottom:26px; }
  .price-list li{
    list-style:none;
    display:flex;
    align-items:flex-start;
    gap:10px;
    font-size:14px;
    color:var(--text-dim);
    margin-bottom:12px;
  }
  .price-card .btn{ justify-content:center; width:100%; }

  .upgrade-note{
    margin-top:18px;
    border:1px dashed var(--accent-line);
    border-radius:10px;
    padding:14px 16px;
    font-size:12.5px;
    color:var(--text-dim);
    line-height:1.5;
  }

  .pauta-note{
    font-size:12.5px;
    color:var(--text-faint);
    margin-top:24px;
    line-height:1.5;
    max-width:680px;
  }

  .custom-card{
    border:1px solid var(--line);
    border-radius:var(--radius);
    padding:28px;
    background:var(--bg-soft);
    display:flex;
    flex-direction:column;
    justify-content:center;
  }
  .custom-card h4{ font-size:16px; margin-bottom:10px; }
  .custom-card p{ color:var(--text-dim); font-size:13.5px; margin-bottom:18px; }
</style>
