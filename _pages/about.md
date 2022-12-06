---
permalink: /
title: "About me"
excerpt: "About me"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

I am a 'Margarita Salas' Postdoctoral Fellow at [Royal Botanic Gardens, Kew](https://www.kew.org/science). I specialized in **evolutionary biology** (chromosome evolution) and the **systematics** of the family **Cyperaceae** (mainly focusing on ***Carex***), although I have also worked with bryophytes. I have collaborated in [research](research) articles involving different aspects such as phylogeographic, systematics/taxonomy, chromosomal or conservation purposes. I have organized fieldwork and plant collection campaigns within the Iberian Peninsula (Central System, Pyrenees, southern Spain and Portugal) and abroad (La Réunion -Mascarene islands-, South Africa, Brazil and Madagascar).
I am [coauthor](publications) of 22 scientific and divulgation papers (18 with international impact), a book chapter and a book. I have also contributed as a reviewer of 12 high-impact journal manuscripts, together with 2 IUCN Red List revisions. Concerning popular science, it is worth mentioning the publication of the book "Plantas silvestres y ornamentales del campus de la Universidad Pablo de Olavide" ["Wild and ornamental plants of the Universidad Pablo de Olavide Campus"], as well as the organization of the ["First Bioblitz of the Spanish Flora"](https://www.inaturalist.org/projects/i-biomaraton-de-flora-espanola) along with workshops at Universidad Autónoma de Madrid and "Feria de la Ciencia de Sevilla". Finally, in connection with [teaching](teaching), I lectured at Universidad Pablo de Olavide (18.7 ECTS up to date) in Botany, Conservation Biology and Ecological Restoration, and also mentored several interns and end-of-degree project of BSc students in the Botany area.

```{r, httr, jsonliteresults='asis'}
r <- GET(url = 'https://www.inaturalist.org//observations/user_stats.json?user_id=jimarcor')
r <- content(r, as = "text", encoding = "UTF-8")
df <- fromJSON(r,flatten = TRUE)
obs <- df[["most_observations"]][["count"]]
spp <- df[["most_species"]][["count"]]

cat(paste0("Number of observations: ", obs))
cat(paste0("Number of species: ", spp))
```


<center>

<img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
<br/>
<h3> My observations</h3>
<iframe src="https://www.inaturalist.org/observations/map?user_id=jimarcor#2/0/0" width="100%" height="600" frameborder="no" border="0" marginwidth="0" marginheight="0"></iframe

<img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20"><img src='/images/android-chrome-192x192.png' width="20">
<br/>

</center>
