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

<!-- 1. Estilos y Librería (Cargar Leaflet) -->
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

<div align="center">
  <img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
  <br/>
  <h3> My observations</h3>
  
  <!-- 2. Contenedor con altura fija obligatoria -->
  <div id="map" style="width: 100%; height: 600px; background: #f0f0f0; border: 1px solid #ccc; border-radius: 8px;"></div>
  
  <br/>
  <img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
</div>

<script>
  // Usamos un pequeño retraso para asegurar que el DOM esté listo
  setTimeout(function() {
    // Inicializar mapa
    var map = L.map('map').setView([20, 0], 2);

    // Capa base de OpenStreetMap
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; OpenStreetMap'
    }).addTo(map);

    // Capa de puntos de iNaturalist (Tus observaciones)
    L.tileLayer('https://api.inaturalist.org/v1/points/{z}/{x}/{y}.png?user_id=jimarcor&color=green', {
      attribution: '&copy; iNaturalist'
    }).addTo(map);

    // Corregir errores de renderizado inicial (cuadro blanco/gris)
    map.invalidateSize();
  }, 500); 
</script>



<!-- Antiguo
<center>

<img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
<br/>
<h3> My observations</h3>
<iframe src="https://www.inaturalist.org/observations/map?user_id=jimarcor#2/0/0" width="100%" height="600" frameborder="no" border="0" marginwidth="0" marginheight="0"></iframe
</center>

<center>
<img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
<br/>
</center> 
-->
