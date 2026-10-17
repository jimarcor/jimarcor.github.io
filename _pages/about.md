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
  const MIN_ZOOM_FOR_MARKERS = 11;   // 11 ≈ 385 km²/tile, 12 ≈ 96 km²/tile
  const AREA_CACHE_TTL_MS    = 5 * 60 * 1000;   // 5 min por zona
  const DEBOUNCE_MS          = 500;

  // 1. Mapa
  const map = L.map('map', { worldCopyJump: true, minZoom: 2 }).setView([20, 0], 2);

  // 2. Satélite (Esri, gratis)
  L.tileLayer(
    'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
    { attribution: '&copy; Esri', maxZoom: 19 }
  ).addTo(map);

  // 3. Heatmap (siempre visible, teselas cacheadas por el navegador)
  L.tileLayer(
    `https://api.inaturalist.org/v1/heatmap/{z}/{x}/{y}.png?user_id=${USERNAME}`,
    { attribution: '&copy; iNaturalist', maxZoom: 19, opacity: 0.55 }
  ).addTo(map);

  // 4. Cluster de marcadores
  const markers = L.markerClusterGroup({
    maxClusterRadius: 50, spiderfyOnMaxZoom: true, showCoverageOnHover: false
  });

  // 5. Icono circular con foto
  function createIcon(url) {
    const html = url ? `<img src="${url}" alt="">`
                     : `<div style="font-size:10px;color:#999;padding:4px;">n/a</div>`;
    return L.divIcon({
      className: 'inat-marker', html, iconSize: [38, 38],
      iconAnchor: [19, 19], popupAnchor: [0, -19]
    });
  }

  // 6. Cache por área (evita repetir la misma petición si paneas poco)
  const areaCache = new Map();
  let pendingController = null;
  let debounceTimer = null;

async function fetchArea(bounds) {
  const key = [
    bounds.getSouth().toFixed(2), bounds.getWest().toFixed(2),
    bounds.getNorth().toFixed(2), bounds.getEast().toFixed(2)
  ].join(',');

  const hit = areaCache.get(key);
  if (hit && (Date.now() - hit.ts) < AREA_CACHE_TTL_MS) {
    return hit.data;
  }

  if (pendingController) pendingController.abort();
  pendingController = new AbortController();
  const signal = pendingController.signal;

  const perPage = 200;
  const MAX_PAGES = 25;              // tope de seguridad: 25 × 200 = 5000 obs
  const all = [];
  let page = 1;
  let total = null;

  while (true) {
    const url = `https://api.inaturalist.org/v1/observations` +
      `?user_id=${USERNAME}` +
      `&swlat=${bounds.getSouth()}&swlng=${bounds.getWest()}` +
      `&nelat=${bounds.getNorth()}&nelng=${bounds.getEast()}` +
      `&per_page=${perPage}&page=${page}` +
      `&order_by=observed_on&order=desc`;

    const res = await fetch(url, { signal });
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    const data = await res.json();

    if (total === null) {
      total = data.total_results;
      console.log(`🌐 Área: ${total} obs totales`);
    }

    const results = data.results || [];
    all.push(...results);
    console.log(`  pág ${page}: +${results.length} (${all.length}/${total})`);

    if (all.length >= total)       break;   // ya tenemos todas
    if (results.length < perPage)  break;   // página incompleta
    if (page >= MAX_PAGES) {
      console.warn(`⚠️ Tope de ${MAX_PAGES} páginas alcanzado (${all.length}/${total})`);
      break;
    }
    page++;
  }

  areaCache.set(key, { ts: Date.now(), data: all });
  return all;
}

  // 7. Pintar marcadores
  function renderObs(obs) {
    markers.clearLayers();
    obs.forEach(o => {
      if (!o.geojson?.coordinates) return;
      const [lng, lat] = o.geojson.coordinates;

      const smallPhoto = o.photos?.[0]?.url?.replace('square', 'small')  || null;
      const medPhoto   = o.photos?.[0]?.url?.replace('square', 'medium') || null;

      const common = o.taxon?.preferred_common_name || 'Sin nombre común';
      const sci    = o.taxon?.name || o.species_guess || 'Desconocido';

      const popup = `
        <div class="inat-popup">
          ${medPhoto ? `<img src="${medPhoto}" alt="">` : ''}
          <h4>${common}</h4>
          <div class="sci">${sci}</div>
          <div class="meta">${o.observed_on || 'Fecha desconocida'} · calidad: ${o.quality_grade || 'n/a'}</div>
          <a href="https://www.inaturalist.org/observations/${o.id}" target="_blank" rel="noopener">Ver en iNaturalist</a>
        </div>`;

      L.marker([lat, lng], { icon: createIcon(smallPhoto) })
        .bindPopup(popup)
        .addTo(markers);
    });
    map.addLayer(markers);
  }

  // 8. Hint de "acerca el zoom"
  function showHint(show) {
    let el = document.getElementById('zoom-hint');
    if (!el) {
      el = document.createElement('div');
      el.id = 'zoom-hint';
      el.style.cssText = 'position:absolute;top:60px;left:50%;transform:translateX(-50%);' +
        'background:rgba(47,125,92,0.92);color:white;padding:8px 14px;' +
        'border-radius:8px;font-size:13px;z-index:1000;pointer-events:none;' +
        'box-shadow:0 2px 8px rgba(0,0,0,0.2);';
      el.textContent = 'Acerca el zoom para ver observaciones clicables';
      map.getContainer().appendChild(el);
    }
    el.style.display = show ? 'block' : 'none';
  }

  // 9. Carga según zoom
  async function loadVisible() {
    if (map.getZoom() < MIN_ZOOM_FOR_MARKERS) {
      markers.clearLayers();
      showHint(true);
      return;
    }
    showHint(false);
    try {
      const obs = await fetchArea(map.getBounds());
      renderObs(obs);
    } catch (e) {
      if (e.name !== 'AbortError') console.error(e);
    }
  }

  // 10. Debounce: no lanzar petición en cada pixel que se panea
  function onMapMove() {
    clearTimeout(debounceTimer);
    debounceTimer = setTimeout(loadVisible, DEBOUNCE_MS);
  }
  map.on('moveend zoomend', onMapMove);

  // 11. Arranque
  setTimeout(loadVisible, 300);
  setTimeout(() => map.invalidateSize(), 300);
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