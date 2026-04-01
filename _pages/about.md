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
<!-- 1. Leaflet y Plugin de Clics (UTFGrid) -->
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
<!-- Plugin alojado en GitHub para evitar bloqueos de CDNs comunes -->
<script src="https://github.io"></script>

<div align="center">
  <img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
  <br/>
  <h3> My observations (click a point to view on iNaturalist)</h3>
  
  <div id="map" style="width: 100%; height: 600px; background: #222; border: 1px solid #333; border-radius: 8px; cursor: crosshair;"></div>
  
  <br/>
  <img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
</div>

<script>
  function initMap() {
    // CENTRO GLOBAL: Lat 20, Lon 0, Zoom 2 (Muestra todo el mundo)
    var map = L.map('map').setView([20, 0], 2);

    // CAPA SATÉLITE (Esri)
    L.tileLayer('https://arcgisonline.com{z}/{y}/{x}', {
      attribution: 'Tiles &copy; Esri &mdash; iNaturalist'
    }).addTo(map);

    // CAPA VISUAL DE PUNTOS (iNaturalist)
    L.tileLayer('https://inaturalist.org{z}/{x}/{y}.png?user_id=jimarcor&color=yellow').addTo(map);

    // CAPA INTERACTIVA (Permite hacer clic)
    var utfGrid = new L.UtfGrid('https://inaturalist.org{z}/{x}/{y}.grid.json?user_id=jimarcor');
    map.addLayer(utfGrid);

    // AL HACER CLIC: Redirigir a iNaturalist
    utfGrid.on('click', function (e) {
      if (e.data && e.data.id) {
        window.open('https://inaturalist.org' + e.data.id, '_blank');
      }
    });

    // Forzar renderizado para evitar el "box negro"
    setTimeout(function(){ map.invalidateSize(); }, 400);
  }

  // Ejecutar cuando la página esté lista
  window.onload = initMap;
</script>