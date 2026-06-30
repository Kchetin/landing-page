<script>
  import Header from './lib/Header.svelte';
  import Hero from './lib/Hero.svelte';
  import Proceso from './lib/Proceso.svelte';
  import Servicios from './lib/Servicios.svelte';
  import Precios from './lib/Precios.svelte';
  import Automatizaciones from './lib/Automatizaciones.svelte';
  import Politicas from './lib/Politicas.svelte';
  import CTA from './lib/CTA.svelte';
  import Footer from './lib/Footer.svelte';
  import ChatWidget from './lib/ChatWidget.svelte';

  /** @type {ReturnType<typeof ChatWidget> | null} */
  let chatWidget = $state(null);

  function openChat() {
    chatWidget?.open();
  }

  // Animación de scroll-reveal para los bloques con la clase .reveal
  $effect(() => {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) entry.target.classList.add('in');
      });
    }, { threshold: 0.15 });

    document.querySelectorAll('.reveal').forEach((el) => observer.observe(el));

    return () => observer.disconnect();
  });
</script>

<div class="bg-grid"></div>

<Header onContact={openChat} />
<Hero onContact={openChat} />
<div class="wrap"><div class="divider"></div></div>
<Proceso />
<div class="wrap"><div class="divider"></div></div>
<Servicios />
<Precios onContact={openChat} />
<div class="wrap"><div class="divider"></div></div>
<Automatizaciones onContact={openChat} />
<div class="wrap"><div class="divider"></div></div>
<Politicas />
<CTA onContact={openChat} />
<Footer />

<ChatWidget bind:this={chatWidget} />
