<section id="proceso" class="wrap">
  <div class="section-head reveal">
    <span class="section-eyebrow">El proceso</span>
    <h2>De definir a quién le hablas, a cerrar una venta real.</h2>
    <p>Así se conecta todo dentro del primer paquete: cada paso alimenta al siguiente, sin que tengas que coordinar piezas sueltas.</p>
  </div>

  <div class="flow reveal">
    <div class="flow-step">
      <div class="flow-num">01</div>
      <h3>Definimos tu público objetivo</h3>
      <p>Identificamos a quién le tiene que hablar tu negocio para que cada peso invertido se traduzca en una venta real.</p>
    </div>
    <div class="flow-step">
      <div class="flow-num">02 — si es necesario</div>
      <h3>Activamos tu cuenta de Meta</h3>
      <p>Configuramos y verificamos tu cuenta publicitaria para que esté lista para invertir sin fricciones.</p>
      <span class="opt">opcional</span>
    </div>
    <div class="flow-step">
      <div class="flow-num">03</div>
      <h3>Creamos campaña y anuncios</h3>
      <p>Diseñamos la campaña y los anuncios pensados para atraer clientes potenciales reales, no solo clics.</p>
    </div>
    <div class="flow-step">
      <div class="flow-num">04</div>
      <h3>El chatbot conversa</h3>
      <p>Cada lead que llega es recibido por tu chatbot a medida, y tú ves todo en el panel.</p>
    </div>
  </div>
</section>

<style>
  .flow{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    border:1px solid var(--line);
    border-radius:var(--radius);
    overflow:hidden;
  }
  @media (max-width:900px){
    .flow{ grid-template-columns:1fr; }
  }
  .flow-step{
    padding:32px 26px;
    border-right:1px solid var(--line);
    background:var(--bg-card);
  }
  .flow-step:last-child{ border-right:none; }
  @media (max-width:900px){
    .flow-step{ border-right:none; border-bottom:1px solid var(--line); }
    .flow-step:last-child{ border-bottom:none; }
  }
  .flow-num{
    font-family:'JetBrains Mono', monospace;
    color:var(--text-faint);
    font-size:13px;
    margin-bottom:18px;
  }
  .flow-step h3{ font-size:18px; margin-bottom:10px; }
  .flow-step p{ color:var(--text-dim); font-size:14px; }
  .flow-step .opt{
    display:inline-block;
    margin-top:12px;
    font-family:'JetBrains Mono', monospace;
    font-size:10.5px;
    color:var(--live);
    background:var(--live-soft);
    padding:3px 8px;
    border-radius:99px;
  }
</style>
