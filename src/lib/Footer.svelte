<script>
  import Logo from './Logo.svelte';
</script>

<footer>
  <div class="wrap footer-row">
    <Logo size={22} />
    <div class="copy">© 2026 LeadsFlow — Marketing digital y automatizaciones</div>
  </div>
</footer>

<style>
  footer{
    border-top:1px solid var(--line);
    padding:40px 0;
    position:relative;
    z-index:1;
  }
  .footer-row{
    display:flex;
    justify-content:space-between;
    align-items:center;
    flex-wrap:wrap;
    gap:16px;
  }
  .copy{ color:var(--text-faint); font-size:13px; }
</style>
