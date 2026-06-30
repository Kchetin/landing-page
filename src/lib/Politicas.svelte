<section id="politicas" class="wrap">
  <div class="section-head reveal">
    <span class="section-eyebrow">Políticas del servicio</span>
    <h2>Qué incluye y qué no incluye cada plan.</h2>
    <p>Para que sepas exactamente qué esperar desde el primer día, sin sorpresas.</p>
  </div>

  <div class="policy-grid reveal">
    <div class="policy-card">
      <h3>Plan Campaña</h3>
      <div class="policy-block">
        <div class="policy-label policy-label-yes">Incluye</div>
        <ul class="policy-list">
          <li>Definición y ajuste del público objetivo</li>
          <li>Creación y configuración de la campaña en Meta Ads</li>
          <li>Producción de anuncios (copy y piezas gráficas)</li>
          <li>Optimización mensual de campaña y audiencias</li>
        </ul>
      </div>
      <div class="policy-block">
        <div class="policy-label policy-label-no">No incluye</div>
        <ul class="policy-list">
          <li>Chatbot ni panel de conversaciones</li>
          <li>Presupuesto de pauta publicitaria (lo paga el cliente directo a Meta)</li>
          <li>Automatizaciones adicionales</li>
        </ul>
      </div>
    </div>

    <div class="policy-card featured">
      <h3>Plan Campaña + Chatbot</h3>
      <div class="policy-block">
        <div class="policy-label policy-label-yes">Incluye</div>
        <ul class="policy-list">
          <li>Todo lo del Plan Campaña</li>
          <li>Chatbot personalizado para tu negocio</li>
          <li>Panel de visualización y gestión de conversaciones</li>
          <li>Traspaso a agente humano cuando la conversación lo requiere</li>
        </ul>
      </div>
      <div class="policy-block">
        <div class="policy-label policy-label-no">No incluye</div>
        <ul class="policy-list">
          <li>Presupuesto de pauta publicitaria (lo paga el cliente directo a Meta)</li>
          <li>Cambios de lógica del chatbot fuera del flujo ya configurado</li>
          <li>Automatizaciones adicionales no contempladas en el alcance original</li>
        </ul>
      </div>
    </div>

    <div class="policy-card">
      <h3>Activación de cuenta Meta</h3>
      <div class="policy-block">
        <div class="policy-label policy-label-yes">Incluye</div>
        <ul class="policy-list">
          <li>Configuración de Meta Business Suite</li>
          <li>Verificación de cuenta y método de pago</li>
          <li>Permisos para que LeadsFlow administre la cuenta</li>
        </ul>
      </div>
      <div class="policy-block">
        <div class="policy-label policy-label-no">No incluye</div>
        <ul class="policy-list">
          <li>Gestión de campaña (es un servicio aparte)</li>
          <li>Resolución de restricciones previas de la cuenta del cliente con Meta</li>
        </ul>
      </div>
    </div>

    <div class="policy-card">
      <h3>Automatizaciones a medida</h3>
      <div class="policy-block">
        <div class="policy-label policy-label-yes">Incluye</div>
        <ul class="policy-list">
          <li>Levantamiento del requerimiento y cotización</li>
          <li>Desarrollo del flujo automatizado acordado</li>
          <li>Pruebas antes de la entrega</li>
        </ul>
      </div>
      <div class="policy-block">
        <div class="policy-label policy-label-no">No incluye</div>
        <ul class="policy-list">
          <li>Mantención continua, salvo que se acuerde aparte</li>
          <li>Cambios de alcance no cotizados originalmente</li>
        </ul>
      </div>
    </div>
  </div>

  <div class="policy-note reveal">
    <h4>Buenas prácticas que aplicamos en todos los planes</h4>
    <ul class="policy-list">
      <li>Los resultados de campaña toman entre 2 y 4 semanas en estabilizarse, mientras el algoritmo de Meta aprende a entregar tus anuncios.</li>
      <li>No se garantizan ventas; se garantiza la correcta configuración, lanzamiento y optimización mensual del sistema mientras el plan esté activo.</li>
      <li>Puedes cambiar de Plan Campaña a Plan Campaña + Chatbot cuando quieras, sin perder tu campaña ni tu historial.</li>
      <li>El chatbot y el panel siguen funcionando mientras el plan esté activo; al pausar o cancelar, el servicio se detiene.</li>
    </ul>
  </div>
</section>

<style>
  .policy-grid{
    display:grid;
    grid-template-columns:repeat(2, 1fr);
    gap:18px;
  }
  @media (max-width:900px){ .policy-grid{ grid-template-columns:1fr; } }

  .policy-card{
    background:var(--bg-card);
    border:1px solid var(--line);
    border-radius:var(--radius);
    padding:28px;
  }
  .policy-card.featured{
    border-color:var(--accent-line);
    background:linear-gradient(180deg, rgba(91,95,239,0.06), rgba(91,95,239,0.01));
  }
  .policy-card h3{ font-size:18px; margin-bottom:18px; }
  .policy-block{ margin-bottom:18px; }
  .policy-block:last-child{ margin-bottom:0; }
  .policy-label{
    font-family:'JetBrains Mono', monospace;
    font-size:11px;
    letter-spacing:0.05em;
    text-transform:uppercase;
    padding:3px 9px;
    border-radius:99px;
    display:inline-block;
    margin-bottom:10px;
  }
  .policy-label-yes{ background:var(--live-soft); color:var(--live); }
  .policy-label-no{ background:rgba(255,255,255,0.06); color:var(--text-faint); }
  .policy-list{ margin:0; padding:0; }
  .policy-list li{
    list-style:none;
    position:relative;
    padding-left:16px;
    font-size:13.5px;
    color:var(--text-dim);
    margin-bottom:8px;
    line-height:1.45;
  }
  .policy-list li::before{
    content:"–";
    position:absolute;
    left:0;
    color:var(--text-faint);
  }

  .policy-note{
    margin-top:24px;
    border:1px dashed var(--line-strong);
    border-radius:var(--radius);
    padding:24px 28px;
  }
  .policy-note h4{ font-size:15px; margin-bottom:14px; color:var(--text); }
  .policy-note .policy-list li::before{ color:var(--accent); }
</style>
