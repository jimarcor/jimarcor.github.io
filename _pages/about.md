---
permalink: /
title: "About me"
excerpt: "About me"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

I specialize in character evolution and the systematics of the family Cyperaceae (primarily focusing on *Carex*), , though I have also worked extensively with bryophytes. I have collaborated on [research articles](publications) addressing diverse topics, including phylogeography, systematics/taxonomy, cytogenetics (chromosomal studies), and conservation efforts through various [projects](research). My [fieldwork](expeditions) experience spans the Iberian Peninsula (Central System, Pyrenees, southern Spain, and Portugal) and international locations such as La Réunion (Mascarene Islands), South Africa, Brazil, Chile, Madagascar, the United Kingdom, Ireland, and the Philippines.
During my PhD, I recognized a significant knowledge gap in tropical sedge research. This began with a striking lack of karyological data, poorly documented species descriptions, and historically sparse collections. I became aware of how incomplete and biased the understanding of sedges truly is, prompting me to focus on generating morphological, molecular, and taxonomic data. To address this, I am now focusing on Southeast Asia —the least studied region for sedges— starting with *Carex* and expanding efforts until the taxonomic knowledge of over 600 species in this biodiverse region is comprehensive.

<!-- MAPA DE INATURALIST -->
<!-- 1. Librerías Leaflet -->
<link rel="stylesheet" href="https://bundle.run" />
<script src="https://bundle.run"></script>

<div align="center">
  <img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
  <br/>
  <h3> My observations</h3>
  
  <!-- Contenedor con ID único y altura forzada -->
  <div id="inat-map-container" style="width: 100%; height: 600px; min-height: 600px; background: #e0e0e0; border: 1px solid #ccc; border-radius: 8px; cursor: pointer; position: relative; overflow: hidden;"></div>
  
  <br/>
  <img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
</div>

<script>
  (function() {
    var mapInstance;
    var container = document.getElementById('inat-map-container');

    function initInat() {
      if (mapInstance || !container) return;

      // Inicializar mapa
      mapInstance = L.map('inat-map-container').setView([20, 0], 2);

      // CAPA TERRENO (OpenStreetMap)
      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© OpenStreetMap'
      }).addTo(mapInstance);

      // CAPA PUNTOS (jimarcor)
      L.tileLayer('https://inaturalist.org{z}/{x}/{y}.png?user_id=jimarcor&color=green').addTo(mapInstance);

      // CLIC REDIRECCIÓN
      mapInstance.on('mousedown', function() {
        window.open('https://inaturalist.org', '_blank');
      });

      // FORZAR RENDERIZADO CUANDO EL DIV CAMBIE (Solución definitiva al cuadro negro)
      var resizer = new ResizeObserver(function() {
        mapInstance.invalidateSize();
      });
      resizer.observe(container);
      
      // Refresco de seguridad tras 1 segundo
      setTimeout(function() { mapInstance.invalidateSize(); }, 1000);
    }

    // Intentar cargar en múltiples eventos para asegurar éxito en GitHub
    window.addEventListener('load', initInat);
    document.addEventListener('DOMContentLoaded', initInat);
    // Ejecución inmediata por si ya cargó
    if (document.readyState === 'complete') initInat();
  })();
</script>