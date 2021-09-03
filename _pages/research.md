---
layout: archive
title: "Research"
permalink: /research/
author_profile: true
header:
  og_image: "research/ecdf.png"
---

**UNDER CONSTRUCTION**
Mi carrera científica empezó en 2014, durante mi último año en el Grado de Ciencias Ambientales de la Univ. Pablo de Olavide (UPO), donde obtuve una beca de iniciación a la investigación de 5 meses. Este periodo me estimuló a realizar el máster “Biodiversidad y Biología de la Conservación”. Entre 2015 y 2021 realicé el doctorado, durante el cual realicé estancias en la Univ. Federal de Pernambuco , Univ. Autónoma de Madrid, y una virtual en la Univ. de Coimbra. He colaborado en artículos relacionados con diferentes aspectos (filogeográficos, taxonómicos, cromosomáticos, conservación…) de la familia de las ciperáceas, especialmente género Carex, y otros organismos (briófitos). He organizado y realizado campañas de colecta de material vegetal dentro de la Península Ibérica (Sistema Central, Pirineos...) e internacionales (isla Réunion -Islas Mascareñas- y Sudáfrica). También estuve trabajando en el herbario de la UPO (2016) en el prensado, secado, montaje, almacenamiento y conservación del material vegetal. He publicado un total de 21 artículos científicos (18 con impacto internacional), un capítulo de libro y un libro, y tengo un índice h 8. He contribuido como revisor de 11 artículos para revistas de alto impacto, además de 2 revisiones para la lista roja de la IUCN. Respecto a la divulgación, cabe mencionar la publicación del libro "Plantas silvestres y ornamentales del campus de la Universidad Pablo de Olavide", así como la organización del "I Biomaratón de Flora Española" y realización de talleres para el mismo en la Univ. Autónoma de Madrid, así como la participación en la Feria de la Ciencia en Sevilla. En cuanto a la docencia, he impartido clases prácticas en la UPO (total de 18 ECTS hasta la fecha) y he tutelado a estudiantes internos y de fin de grado en el área de Botánica de la UPO. 

<nbsp>

{% assign ordered_pages = site.research | sort:"order_number" %}

{% for post in ordered_pages %}
  {% include archive-single.html type="grid" %}
{% endfor %}
