<script>
  let { size = 30 } = $props();
</script>

<div class="logo-mark">
  <svg width={size} height={size} viewBox="0 0 30 30" fill="none">
    <path d="M3 9 C 3 9, 11 9, 14 9" stroke="#9BA3B0" stroke-width="2.4" stroke-linecap="round"/>
    <path d="M3 15 C 3 15, 15 15, 18 15" stroke="#5B5FEF" stroke-width="2.4" stroke-linecap="round"/>
    <path d="M3 21 C 3 21, 11 21, 14 21" stroke="#9BA3B0" stroke-width="2.4" stroke-linecap="round"/>
    <circle cx="24" cy="15" r="5.5" fill="#5B5FEF"/>
    <path d="M21.7 15.2 L23.4 16.8 L26.6 13.2" stroke="#0E1116" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
  </svg>
  <span class="logo-word">Leads<span>Flow</span></span>
</div>

<style>
  .logo-mark{ display:flex; align-items:center; gap:10px; }
  .logo-mark svg{ display:block; flex-shrink:0; }
  .logo-word{
    font-family:'Space Grotesk', sans-serif;
    font-weight:700;
    font-size:19px;
    letter-spacing:-0.01em;
    color:var(--text);
  }
  .logo-word span{ color:var(--accent); }
</style>
