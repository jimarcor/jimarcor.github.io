---
layout: single
title: 
permalink: /cyperaSEA/
author_profile: false
---

<style>
  #main, .page, .page__inner-wrap, .page__content {
    max-width: 1600px !important;
    width: 100% !important;
    margin-left: auto !important;
    margin-right: auto !important;
  }
</style>

<iframe id="miFrame"
        src="/_pages/cyperaSEA/cyperaSEA.html"
        style="width:100%; border:0; display:block; overflow:hidden;"
        scrolling="no"
        loading="lazy"></iframe>

<script>
  const frame = document.getElementById('miFrame');

  function ajustarAltura() {
    try {
      const doc = frame.contentDocument || frame.contentWindow.document;
      frame.style.height = '0px';
      const alto = Math.max(
        doc.body.scrollHeight,
        doc.documentElement.scrollHeight,
        doc.body.offsetHeight,
        doc.documentElement.offsetHeight
      );
      frame.style.height = alto + 'px';
    } catch (e) {
      console.warn('No se pudo ajustar el iframe:', e);
    }
  }

  frame.addEventListener('load', () => {
    ajustarAltura();
    const doc = frame.contentDocument;
    if (!doc) return;
    // Reajusta si el contenido cambia de tamaño
    new ResizeObserver(ajustarAltura).observe(doc.body);
  });

  window.addEventListener('resize', ajustarAltura);
</script>