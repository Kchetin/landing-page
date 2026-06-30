<script>
  let { onContact } = $props();
</script>

<section class="wrap">
  <div class="cta-band reveal">
    <h2>Tu cuenta publicitaria puede estar activa esta semana.</h2>
    <p>Conversemos sobre tu negocio, tu público objetivo y cómo convertir cada conversación en una venta real.</p>
    <button class="btn btn-primary" onclick={onContact}>Contactar asesor</button>
  </div>
</section>

<style>
  .cta-band{
    border:1px solid var(--accent-line);
    background:linear-gradient(135deg, rgba(91,95,239,0.1), rgba(91,95,239,0.02));
    border-radius:20px;
    padding:64px 48px;
    text-align:center;
  }
  .cta-band h2{ font-size:clamp(26px,3.2vw,36px); margin-bottom:16px; }
  .cta-band p{ color:var(--text-dim); margin-bottom:30px; max-width:480px; margin-left:auto; margin-right:auto; }
</style>
