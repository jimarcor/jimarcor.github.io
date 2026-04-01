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
<!-- 1. Cargamos Leaflet desde un CDN fiable (unpkg) -->
<link rel="stylesheet" href="https://unpkg.com" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

<div align="center">
  <img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
  <br/>
  <h3> My observations (Satélite)</h3>
  
  <!-- Contenedor con fondo gris para confirmar que el DIV existe -->
  <div id="map" style="width: 100%; height: 600px; background: #333; border: 1px solid #444; border-radius: 8px;"></div>
  
  <br/>
  <img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
</div>

<script>
  // Función para asegurar que el mapa se cargue tras el renderizado de la página
  function loadInatMap() {
    // Coordenadas globales (0, 0) con zoom bajo
    var map = L.map('map').setView([0, 0], 2);

    // CAPA SATÉLITE
    L.tileLayer('https://arcgisonline.com{z}/{y}/{x}', {
      attribution: 'Esri &copy; iNaturalist'
    }).addTo(map);

    // CAPA PUNTOS INATURALIST (Amarillo)
    L.tileLayer('https://inaturalist.org{z}/{x}/{y}.png?user_id=jimarcor&color=yellow').addTo(map);

    // Truco crítico: Forzar el refresco de tamaño 1 segundo después
    setTimeout(function() {
      map.invalidateSize();
    }, 1000);
  }

  // Ejecución segura
  if (document.readyState === "complete") {
    loadInatMap();
  } else {
    window.addEventListener('load', loadInatMap);
  }
</script>