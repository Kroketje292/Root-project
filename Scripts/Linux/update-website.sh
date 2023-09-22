#!/bin/bash

# Naar directory gaan
cd /var/www/html

# Oude directory's verwijderen
sudo rm -r *

# De repository clonen
echo "Cloning Git repository"
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
echo "Restarting Apache2"
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

