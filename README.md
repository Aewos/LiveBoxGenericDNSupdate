# LiveBoxGenericDNSupdate
Permet de mettre à jour votre adresse IP sur un service type "DynDNS" non pris en charge par défaut par la LiveBox (OVH par défaut).
Le script est développé pour GNU/Linux et ne fonctionnera pas en l'état sous windows (par contre il devrait pouvoir fonctionner sur les systèmes type UNIX).

À chaque fois que le script `ipcheck.sh` est appelé, il effectue une requête sur la LiveBox afin d'en récupérer sont adresse IP(v4) qu'il compare avec la dernière adresse enregistrée (dans `ip.txt`). Si l'adresse est différente (et uniquement si c'est le cas), le DynDNS est mis à jour (via `ipupdage.py`).

Pour vérifier régulièrement l'adresse IP de la LiveBox, vous pouvez utiliser une tache cron du type `*/2 * * * * sh /path/to/LiveBoxGenericDNSupdate/ipchange.sh 2>&1` qui appelera le script toutes les 2 minutes (en remplaçant le chemin du script par le chemin où se trouve `ipchange.sh`).

**Attention** à bien configurer le paramètre `basedir` dans `ipcheck.sh` avec le chemin absolu (idéalement) du fichier et les paramètres dans `ipupdate.py` afin de définir le service (via son url, par défaut il s'agit d'OVH), le nom de domaine à modifier ainsi que les identifiant et mots de passe nécessaires pour la mise à jour.

## Dépendances

* Curl
* Python
* Cron (ou n'importe quel autre service permettant d'effectuer une tache régulièrement) pour automatiser le processus


