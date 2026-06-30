<script>
  import Logo from './Logo.svelte';

  let { onContact } = $props();
</script>

<header>
  <nav class="wrap">
    <Logo size={30} />
    <div class="nav-links">
      <a href="#proceso">Cómo funciona</a>
      <a href="#servicios">Servicios</a>
      <a href="#precios">Precios</a>
    </div>
    <button class="nav-cta" onclick={onContact}>Contactar asesor</button>
  </nav>
</header>

<style>
  header{
    position:sticky;
    top:0;
    z-index:50;
    background:rgba(14,17,22,0.78);
    backdrop-filter:blur(14px);
    border-bottom:1px solid var(--line);
  }
  nav{
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:18px 32px;
  }
  .nav-links{
    display:flex;
    gap:32px;
    font-size:14.5px;
    color:var(--text-dim);
  }
  .nav-links a:hover{ color:var(--text); }

  .nav-cta{
    background:var(--text);
    color:var(--bg);
    padding:10px 20px;
    border-radius:99px;
    font-size:14px;
    font-weight:600;
    transition:opacity .15s ease;
  }
  .nav-cta:hover{ opacity:0.88; }

  @media (max-width:860px){
    .nav-links{ display:none; }
  }
</style>
