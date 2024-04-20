---
layout: archive
title: "Research"
permalink: /research/
author_profile: true
header:
  og_image: "research/ecdf.png"
---

My scientific career started in 2014 during my last year of BSc in Environmental Sciences at Universidad Pablo de Olavide (UPO, Sevilla), where I obtained a 5-months long initiation to research scolarship. That experience propelled me into a MSc in Biodiversity and Conservation Biology. Afterwards, I completed a PhD between 2015 and 2021, which allowed me to carry out scientific stays at Universidade Federal do Pernambuco (Recife, Brazil), Universidad Autónoma de Madrid (Spain), Universidade de Coimbra (Portugal -virtual due to COVID-), Institut Botànic de Barcelona (Spain) and Royal Botanic Gardens, Kew (UK). I have also been working at UPOS herbarium (2016) in the pressing, drying, mounting, storaging and conservation processes of the plant material.

Overall, my research addresses the effect of a wide array of genomic, chromosomal, morphological and bioclimatic characters in clade-specific differences of diversification rates. 

If you are interested in donating to support sedge research in priority areas for biodiversity conservation, please consider doing so through this link: [![paypal](https://www.paypalobjects.com/en_GB/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=U3D7GLE4PGNZQ)


<nbsp>

{% assign ordered_pages = site.research | sort:"order_number" %}

{% for post in ordered_pages %}
  {% include archive-single.html type="grid" %}
{% endfor %}