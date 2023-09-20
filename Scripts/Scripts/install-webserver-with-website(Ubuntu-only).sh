#!/bin/bash

# Functie om de uitvoer naar de console in donkergeel te weergeven
print_yellow() {
  local yellow='\e[1;33m' # ANSI-escape-code voor donkergeel
  local reset='\e[0m'     # ANSI-escape-code om de kleur te resetten
  echo -e "${yellow}$1${reset}"
}

# Controleren of het script als root wordt uitgevoerd
if [ "$EUID" -ne 0 ]
  then echo "Dit script moet als root worden uitgevoerd. Probeer het met sudo."
  exit
fi

# Controleren of Apache2 is geïnstalleerd
if [ -x "$(command -v apache2)" ]; then
  print_yellow "Apache2 is already installed."
else
  print_yellow "Apache2 is not yet installed. Installing..."
  apt update
  apt install -y apache2
fi

# Controleren of Git is geïnstalleerd
if [ -x "$(command -v git)" ]; then
  print_yellow "Git is already installed."
else
  print_yellow "Git is not yet installed. Installing..."
  apt install -y git
fi

# De repository clonen
print_yellow "Cloning Git repository"
cd /var/www/html
git clone https://github.com/Kroketje292/uitprobeersel.git

# Eigenaar van de bestanden wijzigen naar www-data (de Apache-gebruiker)
chown -R www-data:www-data uitprobeersel

# Naar uitprobeersel directory gaan
cd /var/www/html/uitprobeersel 

# Bestanden van uitprobeerselfolder verplaatsen naar html directory
mv -v -f /var/www/html/uitprobeersel/* /var/www/html/
cd ..

# Lege git map verwijderen
rm -r uitprobeersel >/dev/null

# Even Apache2 herstarten om zeker te zijn
print_yellow "Restarting Apache2"
systemctl restart apache2


echo "-----------------------------------------"
echo ""
echo ""
echo ""
echo ""
echo "######  ####### #     # #######    ###" 
echo "#     # #     # ##    # #          ###"
echo "#     # #     # # #   # #          ###" 
echo "#     # #     # #  #  # #####       #" 
echo "#     # #     # #   # # #"              
echo "#     # #     # #    ## #          ###" 
echo "######  ####### #     # #######    ###"
echo ""
echo ""
echo ""
echo ""
echo "-----------------------------------------"

