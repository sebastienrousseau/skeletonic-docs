#
#  _                ____
# | |    ___  ___  |  _ \  ___   ___ ___
# | |   / _ \/ __| | | | |/ _ \ / __/ __|
# | |__|  __/\__ \ | |_| | (_) | (__\__ \
# |_____\___||___/ |____/ \___/ \___|___/
# 
#  ____  _        _      _              _
# / ___|| | _____| | ___| |_ ___  _ __ (_) ___
# \___ \| |/ / _ \ |/ _ \ __/ _ \| '_ \| |/ __|
#  ___) |   <  __/ |  __/ || (_) | | | | | (__
# |____/|_|\_\___|_|\___|\__\___/|_| |_|_|\___|
#  
#
# Documentation de la Bibliothèque Stylus Skeletonic v0.0.1
# https://docs.skeletonic.io/fr
#
# Scripts de configuration pour la Documentation de la Bibliothèque Skeletonic Stylus (v0.0.1).
#
# Ce script de construction a les fonctions suivantes:
#
#   function docComplets ():
#     - Exécutez toutes les commandes de configuration chronologiquement. 
#
#   function docDependances ():
#     - Installez les bibliothèques et dépendances externes requises. 
#
#   function docVersion ():
#     - Affichez la version du "mkdocs" installée localement.
#
#   function docNettoyage ():
#     - Nettoyez le dossier du site web existant.
#
#   function docConstruction ():
#     - Construisez la documentation localisée. (Anglais et Français par défaut)
#
#   function docSite ():
#     - Préparez le dossier du site web
#
#   function docWeb ():
#     - Prévisualisez le site à l'aide d'un serveur HTTP local (serve).
#
#   function docAide ():
#     - Présentez le menu d'aide contextuelle.
#
# (c) Sébastien Rousseau 2021.
# Licencié sous la licence MIT
#

# Liste des couleurs:
Noir='\033[0;90m'       # Noir
Bleu='\033[0;94m'       # Bleu
Cyan='\033[0;96m'       # Cyan
Vert='\033[0;92m'       # Vert
Violet='\033[0;95m'     # Violet
Rouge='\033[0;91m'      # Rouge
Reinitialiser='\033[0m' # Réinitialiser
Blanc='\033[0;97m'      # Blanc
Jaune='\033[0;93m'      # Jaune

# docComplets: Exécutez toutes les commandes de configuration chronologiquement.
function docComplets () {
	docDependances
  docVersion
  docNettoyage
  docConstruction    
  docSite
  docWeb
}

# docDependances: Installez les bibliothèques et dépendances externes requises.
function docDependances () {
  echo
  echo "${Vert}[NOTES:]${Reinitialiser} Installation des bibliothèques et dépendances externes."
  FILE=requirements.txt
  if [ -f "$FILE" ]; then
    echo "${Bleu}[INFO:]${Reinitialiser} Mise à jour des dépendances.\n"
    pip install -r $FILE;
  else 
    echo "${Rouge}[ERREUR:]${Reinitialiser} Le fichier "$FILE" n'existe pas.\n"
    exit 1;
  fi
  echo
}

# docVersion: Affichez la version du "mkdocs" installée localement.
function docVersion () {
  echo
  echo "${Vert}[NOTES:]${Reinitialiser} Affichage de la version du "mkdocs" installée localement."
  echo
	echo "${Bleu}[INFO:]${Reinitialiser} La version actuelle disponible est:"
  echo
	pip freeze | grep mkdocs
  echo
}

# docNettoyage: Nettoyez du dossier de site web existant.
function docNettoyage () {
  echo
  echo "${Vert}[NOTES:]${Reinitialiser} Nettoyage du dossier de site web existant."
  DIRECTORY=site
  if [ -d $DIRECTORY ]; then
    rm -rf site/;
    mkdir -p site;
    echo "${Bleu}[INFO:]${Reinitialiser} Le nettoyage du dossier "site" a été effectué avec succès!"
  else 
    echo "${Rouge}[ERREUR:]${Reinitialiser} Le dossier "$DIRECTORY" n'existe pas.\n"
    exit 1;
  fi
  echo
}

# docConstruction: Construisez la documentation localisée. (Anglais et Français par défaut)
function docConstruction () {
  echo
  echo "${Vert}[NOTES:]${Reinitialiser} Installation de la documentation anglaise"
  cd en;
  mkdocs build;
  cd ..;
  echo
  echo "${Vert}[NOTES:]${Reinitialiser} Installation de la documentation française"
  cd fr;
  mkdocs build;
  cd ..;
}

# docSite: Prépare le dossier du site web
function docSite () {
  echo
  echo "${Vert}[NOTES:]${Reinitialiser} Préparation du site anglais"
  mv en/site site/en;
  echo
  echo "${Vert}[NOTES:]${Reinitialiser} Préparation du site français"
  mv fr/site site/fr;
  echo
  echo "<meta http-equiv=\"refresh\" content=\"0; url=/fr/\">" > site/index.html;
  echo
}

# docWeb: Prévisualisez le site à l'aide d'un serveur HTTP local (serve).
function docWeb () {
  
  if [ -z "$(command -v serve)" ]; then
    echo "${Rouge}[ERREUR:]${Reinitialiser} Il vous manque le serveur HTTP local "serve".";
    echo "${Bleu}[INFO:]${Reinitialiser} Installez simplement le paquet à l'aide du gestionnaire Yarn en exécutant la commande:";
    echo "yarn global add serve" | pbcopy;
    echo "$(pbpaste)"
    exit 1;
  fi
  
  echo
	echo "Démarrage du serveur Web sur le port 8000:"
  serve -p 8000 site
  echo
}

# docAide: Présentez le menu d'aide contextuelle.
function docAide() {  
  echo
  echo "${Jaune}┌──────────────────────────────────────────────────────────────┐${Reinitialiser}" 
  echo "${Jaune}│ ${Blanc}💀 Documentation de la Bibliothèque Stylus Skeletonic v0.0.1${Reinitialiser} ${Jaune}│${Reinitialiser}"
  echo "${Jaune}└──────────────────────────────────────────────────────────────┘${Reinitialiser}"
  echo
  echo "${Bleu}[INFO:]${Reinitialiser} ${Yellow}Options disponibles:${Reinitialiser}"
  echo "
  ${Vert}[0]${Reinitialiser} Quittez le menu.
  ${Vert}[1]${Reinitialiser} Exécutez toutes les commandes de configuration chronologiquement.
  ${Vert}[2]${Reinitialiser} Installez les bibliothèques et dépendances externes requises. 
  ${Vert}[3]${Reinitialiser} Affichez la version du "mkdocs" installée localement.
  ${Vert}[4]${Reinitialiser} Nettoyez le dossier du site web existant.
  ${Vert}[5]${Reinitialiser} Construisez la documentation localisée. (Anglais et Français par défaut)
  ${Vert}[6]${Reinitialiser} Préparez le dossier du site web
  ${Vert}[7]${Reinitialiser} Prévisualisez le site à l'aide d'un serveur HTTP local (serve).
  ${Vert}[8]${Reinitialiser} Présentez le menu d'aide contextuelle."
  echo
  echo "${Bleu}[INFO:]${Reinitialiser} ${Yellow}Choisissez une option et appuyez sur [ENTRÉE]:${Reinitialiser}" 
  read a
    case $a in
      0) exit 0 ;;
      1) docComplets ; docAide ;;
      2) docDependances ; docAide ;;
      3) docVersion ; docAide ;;
      4) docNettoyage ; docAide ;;
      5) docNettoyage ; docAide ;;
      6) docSite ; docAide ;;
      7) docWeb ; docAide ;;
      8) docAide ; docAide ;;      
  *) echo "${Rouge}[ERREUR:]${Reinitialiser} Paramètre incorrect.";;
  esac
}

docAide