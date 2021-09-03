---
layout: archive
title: "Research"
permalink: /research/
author_profile: true
header:
  og_image: "research/ecdf.png"
---

My scientific career started in 2014 during my last year of BSc in Environmental Sciences at Universidad Pablo de Olavide (UPO, Sevilla), where I obtained a 5-months long initiation to research scolarship. That experience propelled me into a MSc in Biodiversity and Conservation Biology. Afterwards, I completed a PhD between 2015 and 2021, which allowed me to realized scientific stays at Universidade Federal do Pernambuco (Recife, Brazil), Universidad Autónoma de Madrid (Spain), and a virtual at Universidade de Coimbra. I have also been working at UPOS herbarium (2016) in the pressing, drying, mounting, storaging and conservation processes of the plant material.

I have collaborated in research articles involving different aspects such as phylogeographics, systematics/taxonomy, chromosomal or with conservation purposes. These works are focused in the sedges family (Cyperaceae, Poales), especially the genus <i>Carex</i>, and bryophytes. I have organized fieldwork and plant collection campains within the Iberian Peninsula (Central System, Pyrenees, Southern Spain and Portugal) and abroad (La Réunion -Mascarene islands- and South Africa). 

I am [coauthor](publications) of 21 scientific papers (18 with international impact), a book chapter and a book. I have also contributed as a reviewer of 11 high-impact journal manuscripts, together with 2 IUCN Red List revisions. Concerning dissemination, it is worth mentioning the publication of the book "Plantas silvestres y ornamentales del campus de la Universidad Pablo de Olavide" ["Wild and ornamental plants of the Univerisdad Pablo de Olavide Campus"], as well as the organization of the ["First Bioblitz of the Spanish Flora"](https://www.inaturalist.org/projects/i-biomaraton-de-flora-espanola) along with workshops at Universidad Autónoma de Madrid and "Feria de la Ciencia de Sevilla". Finally, in connection with [teaching](teaching), I lectured at Universidad Pablo de Olavide (18 ECTS up to date) and mentored several interns and end-of-degree project of BSc students in the Botany area.

<nbsp>

{% assign ordered_pages = site.research | sort:"order_number" %}

{% for post in ordered_pages %}
  {% include archive-single.html type="grid" %}
{% endfor %}
