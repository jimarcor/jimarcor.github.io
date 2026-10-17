---
permalink: /
title: "About me"
excerpt: "About me"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

I specialize in character evolution and the systematics of the family Cyperaceae (primarily focusing on *Carex*), although I have also worked extensively with bryophytes. I have collaborated on [research articles](publications) addressing diverse topics, including phylogeography, systematics/taxonomy, cytogenetics (chromosomal studies), and conservation efforts through various [projects](research). My [fieldwork](expeditions) experience spans the Iberian Peninsula (Central System, Pyrenees, southern Spain, and Portugal) and international locations such as La Réunion (Mascarene Islands), South Africa, Brazil, Chile, Madagascar, the United Kingdom, Ireland, the Philippines, Taiwan and South Korea.
During my PhD, I recognized a significant knowledge gap in tropical sedge research. This began with a striking lack of karyological data, poorly documented species descriptions, and historically sparse collections. I became aware of how incomplete and biased the understanding of sedges truly is, prompting me to focus on generating morphological, molecular, and taxonomic data. To address this, I am now focusing on Southeast Asia —the least studied region for sedges— starting with *Carex* and expanding efforts until the taxonomic knowledge of over 600 species in this biodiverse region is comprehensive.

<!-- MAPA DE INATURALIST -->

<!-- 1. Librerías: Leaflet + MarkerCluster -->
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
<link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.css" />
<link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.Default.css" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
<script src="https://unpkg.com/leaflet.markercluster@1.4.1/dist/leaflet.markercluster.js"></script>

<!-- 2. Estilos de marcadores y popups -->
<style>
  #map {
    width: 100%;
    height: 600px;
    background: #f0f0f0;
    border: 1px solid #ccc;
    border-radius: 8px;
  }

  /* Marcador circular con la foto de la observación */
  .inat-marker {
    background: white;
    border-radius: 50%;
    border: 2px solid #2f7d5c;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.35);
    overflow: hidden;
    transition: transform 0.15s;
  }
  .inat-marker:hover {
    transform: scale(1.15);
  }
  .inat-marker img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
  }

  /* Popup */
  .leaflet-popup-content {
    width: 230px !important;
    margin: 0;
  }
  .inat-popup { padding: 10px; }
  .inat-popup img {
    width: 100%;
    height: 150px;
    object-fit: cover;
    border-radius: 6px;
    margin-bottom: 8px;
    display: block;
  }
  .inat-popup h4 {
    margin: 0 0 2px;
    font-size: 14px;
    line-height: 1.2;
  }
  .inat-popup .sci {
    font-style: italic;
    color: #666;
    font-size: 12px;
    margin-bottom: 6px;
  }
  .inat-popup .meta {
    font-size: 11px;
    color: #888;
    margin-bottom: 8px;
  }
  .inat-popup a {
    display: inline-block;
    background: #2f7d5c;
    color: white;
    text-decoration: none;
    padding: 5px 10px;
    border-radius: 4px;
    font-size: 12px;
    font-weight: 500;
  }
  .inat-popup a:hover {
    background: #236047;
  }
</style>

<div align="center">
  <img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
  <br/>
  <h3>My observations</h3>

  <!-- 3. Contenedor del mapa -->
  <div id="map"></div>

  <br/>
  <img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
</div>

<script>
  // --- CONFIGURACIÓN ---
  const USERNAME = 'jimarcor';

  // 1. Inicializar mapa
  const map = L.map('map', {
    worldCopyJump: true,
    minZoom: 2
  }).setView([20, 0], 2);

  // 2. Capa base: satélite (Esri — gratis, sin API key)
  L.tileLayer(
    'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
    { attribution: '&copy; Esri, Maxar, Earthstar Geographics', maxZoom: 19 }
  ).addTo(map);

  // 3. Heatmap de iNaturalist (gradiente de actividad)
  L.tileLayer(
    `https://api.inaturalist.org/v1/heatmap/{z}/{x}/{y}.png?user_id=${USERNAME}`,
    { attribution: '&copy; iNaturalist', maxZoom: 19, opacity: 0.55 }
  ).addTo(map);

  // 4. Cluster de marcadores
  const markers = L.markerClusterGroup({
    maxClusterRadius: 50,
    spiderfyOnMaxZoom: true,
    showCoverageOnHover: false
  });

  // 5. Icono circular con la foto
  function createIcon(photoUrl) {
    const html = photoUrl
      ? `<img src="${photoUrl}" alt="">`
      : `<div style="font-size:10px;color:#999;text-align:center;padding:4px;">n/a</div>`;
    return L.divIcon({
      className: 'inat-marker',
      html: html,
      iconSize: [38, 38],
      iconAnchor: [19, 19],
      popupAnchor: [0, -19]
    });
  }

  // 6. Descargar TODAS las observaciones (con paginación)
  async function fetchAllObservations(username) {
    const perPage = 200;
    const all = [];
    let page = 1;
    let total = null;

    while (true) {
      const url = `https://api.inaturalist.org/v1/observations?user_id=${username}&per_page=${perPage}&page=${page}&order_by=observed_on&order=asc`;
      const res = await fetch(url);
      if (!res.ok) {
        console.warn(`Página ${page}: HTTP ${res.status}, se detiene`);
        break;
      }
      const data = await res.json();
      if (total === null) {
        total = data.total_results;
        console.log(`Total de observaciones del usuario: ${total}`);
      }
      const results = data.results || [];
      all.push(...results);
      console.log(`Página ${page}: ${results.length} obs (acumuladas: ${all.length}/${total})`);

      if (all.length >= total) break;      // ya tenemos todas
      if (results.length < perPage) break; // página incompleta → fin
      page++;
      if (page > 100) break;               // red de seguridad
    }
    return { all, total };
  }

  // 7. Cargar y pintar
  fetchAllObservations(USERNAME).then(({ all, total }) => {
    console.log(`✅ Cargadas ${all.length} de ${total} observaciones`);

    all.forEach(o => {
      if (!o.geojson || !o.geojson.coordinates) return;
      const [lng, lat] = o.geojson.coordinates;

      const smallPhoto = o.photos?.[0]?.url?.replace('square', 'small')  || null;
      const medPhoto   = o.photos?.[0]?.url?.replace('square', 'medium') || null;

      const commonName = o.taxon?.preferred_common_name || 'Sin nombre común';
      const sciName    = o.taxon?.name || o.species_guess || 'Desconocido';

      const popupHtml = `
        <div class="inat-popup">
          ${medPhoto ? `<img src="${medPhoto}" alt="">` : ''}
          <h4>${commonName}</h4>
          <div class="sci">${sciName}</div>
          <div class="meta">${o.observed_on || 'Fecha desconocida'} · calidad: ${o.quality_grade || 'n/a'}</div>
          <a href="https://www.inaturalist.org/observations/${o.id}" target="_blank" rel="noopener">Ver en iNaturalist</a>
        </div>`;

      L.marker([lat, lng], { icon: createIcon(smallPhoto) })
        .bindPopup(popupHtml)
        .addTo(markers);
    });

    map.addLayer(markers);

    // Ajustar el zoom para que se vean TODOS los puntos
    if (markers.getLayers().length > 0) {
      map.fitBounds(markers.getBounds().pad(0.1));
    }
  }).catch(err => console.error('Error cargando observaciones:', err));

  // 8. Corregir tamaño si el contenedor no estaba listo
  setTimeout(() => map.invalidateSize(), 300);
</script>




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

