# Calcul_parall-le_surR_T6
### Analyse et mise en œuvre du calcul parallèle en R pour traiter des volumes de données importants.
#### Exposé réalisé dans le cadre du cours “Projet Statistique avec R" - ENSAE Dakar

---

## Contexte

Le traitement de **volumes massifs de données** (Big Data, IoT, simulations) et les **applications critiques** (analyse financière en temps réel, Deep Learning, prévisions météo, données spatialles) exigent des performances qu’un cœur unique ne peut plus fournir.  
Pour répondre à ces besoins, on adopte le **calcul parallèle**, qui répartit un problème en sous‑tâches exécutées simultanément sur plusieurs cœurs ou machines.

---

## Objectifs

- **Présenter** les concepts fondamentaux et patterns essentiels (cœurs vs threads, modèles de parallélisme). 
- **Mesure de performance** de l’impact du parallélisme sur les performances (speedup, efficacité, scalabilité).
- **Principaux packages** utilisés pour le calcul parallèle. 
- **Application** du calcul parallèle à un cas pratique : analyse du trafic maritime via une application Shiny et comparaison de version séquentielle vs parallèle pour mesurer les gains réels.
- **Défis et bonnes pratiques** pour une meilleure utilisation du calcul parallèle.

---

## Présentation de la base de données 

### Données AIS

- **Volume** : 3 102 887 observations × 20 variables  
- **AIS** (Automatic Identification System) : système de suivi des navires pour la sécurité et la gestion du trafic  
- **Variables dynamiques** : position (lat/lon), vitesse (SOG), cap (COG), état de navigation  
- **Variables statiques** : MMSI, nom, type, dimensions du navire, destination  
- **Sources** :  
  - Stations côtières (40–50 km de portée)  
  - Satellites (couverture mondiale, haute mer)  

---

## Description du projet

Ce dépôt contient :
1. **Documentation théorique**  
   Un fichier R Markdown (`.Rmd`) détaillant les concepts fondamentaux du calcul parallèle (cœurs vs threads, modèles Fork‑Join, MapReduce, etc.).
2. **Application pratique**  
   Une petite application Shiny qui analyse le trafic maritime à l’aide de calculs parallèles sous R.
3. **Support de présentation**  
   - Diaporama PowerPoint pour la présentation en classe  
   - Quiz d’évaluation pour vérifier la compréhension des camarades  
4. **Ressources complémentaires**  
   - Dossier `images/` : graphiques et schémas utilisés  
   - Document Word sur la **mise en œuvre d’un parallélisme distribué**  
   - Fichiers de données (`ships.csv`, etc.)
  
---

## Méthodologie de l'application shiny

1. **Chargement & prétraitement**  
   - Lecture de `ships.csv`  
   - Nettoyage (NA, tri temporel) des colonnes clés (`LAT`, `LON`, `DATETIME`, `SPEED`)  
2. **Sélection d’un navire**  
   - Choix via une liste déroulante  
   - Extraction et tri des données par date  
3. **Calculs sur le navire sélectionné**  
   - Distance maximale entre deux points (fonction `distHaversine`)  
   - Heures de départ et d’arrivée pour cette distance  
   - Vitesse moyenne sur la période  
4. **Visualisation**  
   - Carte interactive `leaflet` du trajet maximal  
   - Résumé textuel des résultats  
5. **Benchmark parallèle vs séquentiel**  
   - Utilisation de `makeCluster()` + `parLapply()`  
   - Division dynamique des données selon le nombre de threads  
   - Affichage des temps d’exécution et calcul du `speedup`  
6. **Statistiques globales**  
   - Vitesses moyennes par navire via `group_by()`  
   - Répartition des tâches sur plusieurs cœurs  
7. **Affichage dynamique des performances**  
   - Chronométrage avec `Sys.time()`  
   - Calcul du `speedup = temps_séquentiel / temps_parallèle`

---

## Contributeurs

- **Diallo Aissatou Sega**  
  [GitHub → ASegaDiallo](https://github.com/ASegaDiallo)  
  _Élève Ingénieure Statisticienne Économiste (ISE1, spécialité économie)_  

- **Fogwoung Djoufack Sarah-Laure**  
  [GitHub → Sarahlaure](https://github.com/Sarahlaure)  
  _Élève Ingénieure Statisticienne Économiste (ISE1, cycle long)_

 

