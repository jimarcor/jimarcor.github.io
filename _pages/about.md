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
<link rel="stylesheet" href="https://unpkg.com" />
<script src="https://unpkg.com"></script>

<div align="center">
  <img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
  <br/>
  <h3> My observations</h3>
  
  <!-- Contenedor con altura mínima forzada -->
  <div id="map" style="width: 100%; min-height: 600px; background: #1a1a1a; border: 1px solid #444; border-radius: 8px;"></div>
  
  <br/>
  <img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
</div>

<script>
  function setupMap() {
    const mapContainer = document.getElementById('map');
    if (!mapContainer) return;

    // Inicializar mapa centrado en el mundo
    var map = L.map('map').setView([20, 0], 2);

    // CAPA SATÉLITE GOOGLE (Más compatible con HTTPS)
    L.tileLayer('https://google.com{x}&y={y}&z={z}', {
      attribution: '&copy; Google Maps'
    }).addTo(map);

    // CAPA PUNTOS INATURALIST (Amarillo)
    L.tileLayer('https://api.inaturalist.org/v1/points/{z}/{x}/{y}.png?user_id=jimarcor&color=yellow', {
      attribution: '&copy; iNaturalist'
    }).addTo(map);

    // SOLUCIÓN AL CUADRO NEGRO: Forzar refresco cuando el elemento es visible
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          setTimeout(() => map.invalidateSize(), 500);
        }
      });
    });
    observer.observe(mapContainer);
  }

  // Ejecución multietapa para asegurar carga en GitHub Pages
  if (document.readyState === "complete") {
    setupMap();
  } else {
    window.addEventListener('load', setupMap);
  }
</script>