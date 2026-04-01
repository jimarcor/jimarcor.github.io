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
<link rel="stylesheet" href="https://unpkg.com" />
<script src="https://unpkg.com"></script>

<div align="center">
  <img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
  <br/>
  <h3> My observations</h3>
  
  <!-- 2. Contenedor del mapa -->
  <div id="map" style="width: 100%; height: 600px; background: #000; border: 1px solid #333; border-radius: 8px;"></div>
  
  <br/>
  <img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
</div>

<script>
  setTimeout(function() {
    // Inicializar mapa (Centrado en el mundo)
    var map = L.map('map').setView([15, 0], 2);

    // 3. CAPA SATÉLITE (Esri)
    L.tileLayer('https://arcgisonline.com{z}/{y}/{x}', {
      attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EBP, and the GIS User Community'
    }).addTo(map);

    // 4. CAPA DE PUNTOS iNaturalist (Usuario: jimarcor)
    // He cambiado el color a 'yellow' para que resalte mejor sobre el satélite oscuro
    L.tileLayer('https://inaturalist.org{z}/{x}/{y}.png?user_id=jimarcor&color=yellow', {
      attribution: '&copy; iNaturalist'
    }).addTo(map);

    // Refrescar tamaño para evitar fallos de carga
    map.invalidateSize();
  }, 600); 
</script>