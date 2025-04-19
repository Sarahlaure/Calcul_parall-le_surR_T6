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

## Description du projet

Ce dépôt contient :
1. **Documentation théorique**  
   Un Bookdown détaillant les concepts fondamentaux du calcul parallèle (différences entre cœurs et threads, modèles Fork-Join, MapReduce, etc.). Ce document se trouve dans le dossier bookdown, avec les fichiers de sortie dans le sous-dossier _book. La base de données étant très lourde, elle n'a pas pu être chargé dans le git, toutefois, il s'agit de la base ships.csv de l'AIS du 16 décembre 2016 au 20 décembre 2016. Ce fichier devra donc etre mis dans le sous dossier "Donnees" du dossier Bookdown. 
   
3. **Application pratique**  
   Une application Shiny conçue pour analyser le trafic maritime à l’aide de techniques de calcul parallèle sous R.
   
5. **Support de présentation**  
   - Diaporama PowerPoint pour la présentation en classe  
   - Quiz d’évaluation pour vérifier la compréhension des camarades par rapport à nos explications.
   - 
6. **Ressources complémentaires**  
   - Document Word détaillant la  **mise en œuvre d’un parallélisme distribué**  
   - Le fichier contenant la consigne initiale ayant guidé la réalisation de l’application Shiny. 
   - La documentation pédagogique utilisée, notamment le support chapitre_3_avancé fourni par le professeur.

---

## Présentation de la base de données pour l'application Rshiny

### Données AIS

- **Volume** : 3 102 887 observations × 20 variables  
- **AIS** (Automatic Identification System) : système de suivi des navires pour la sécurité et la gestion du trafic  
- **Variables dynamiques** : position (lat/lon), vitesse (SOG), cap (COG), état de navigation  
- **Variables statiques** : MMSI, nom, type, dimensions du navire, destination  
- **Sources** :  
  - Stations côtières (40–50 km de portée)  
  - Satellites (couverture mondiale, haute mer)  

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
5. **Comparaison parallèle vs séquentiel**  
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

 

