# Dettes et élections

Ce projet est réalisé dans le cadre du hackathon #dataFin des 15 et 16 Juin 2018.

## Objectif

Etudier le rapport entre santé financière des communes et résultats des élections locales.

Pour cela, il s'agit d'établir une carte du niveau de dette des communes mettant en perspective les résultats des élections locales.

## Prérequis

- Ruby
- Bundler
- Le fichier [comptes_communes_2000-2016.csv](http://data.cquest.org/dgfip_comptes_collectivites/communes/comptes_communes_2000-2016.csv) à placer dans le dossier `/vendor`
- Un accès Internet pour synchroniser les données des villes avec [l'API Géo](https://api.gouv.fr/api/api-geo.html).

## Installation

1) Cloner le projet

```
git clone https://github.com/tarraschk/dettes-et-elections.git && cd dettes-et-elections
```

2) Installer les dépendances Ruby

```
bundle install
```

3) Créer la base de données

```
rails db:setup
```

4) Importer les communes du fichier [comptes_communes_2000-2016.csv](http://data.cquest.org/dgfip_comptes_collectivites/communes/comptes_communes_2000-2016.csv) (à placer dans `/vendor`) avec la tâche :

```
rake import:communes
```

5) Compléter la base de données avec l'import des données des budgets des communes, à l'aide de la tâche :

```
rake import:donnees
```

6) Compléter la base de données avec les éléments GEOJson de l'API Géo d'Etalab (peut prendre pas mal de temps !!!) :

```
rake import:geos
```

7) Générer les fichiers GEOJson avec la tâche :

```
rake export:donnees
```

8) Lancer l'application avec la commande :

```
rails s
```

9) Consulter l'application avec un navigateur sur `http://localhost:3000`


## Sources de données 

- https://api.gouv.fr/api/api-geo.html
- http://data.cquest.org/dgfip_comptes_collectivites/communes/
- https://www.impots.gouv.fr/cll/zf1/cll/zf1/accueil/flux.ex?_flowId=accueilcclloc-flow
