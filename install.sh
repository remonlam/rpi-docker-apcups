#!/bin/sh

###############################################
# Author: Remon Lam                           #
# Source: https://github.com/remonlam/rpi-ups #
###############################################

# Install APCUPSD on Raspbian

# Update system

# Install APCUPS, APCUPSD-CGI and Apache
apt-get -y install apcupsd apcupsd-cgi apache2 --quiet



# Wget config files from github
wget -P /etc/default https://raw.githubusercontent.com/remonlam/rpi-ups/master/apcupsd
# cp /sources/apcupsd /etc/default

# Wget config files from github
wget -P /etc/apcupsd https://raw.githubusercontent.com/remonlam/rpi-ups/master/apcupsd.conf

# Wget config files from github
wget -P /etc/apache2 https://raw.githubusercontent.com/remonlam/rpi-docker-apcups/master/apache2.conf

# Create directory
mkdir -p /etc/apache2/conf.d

# Restart apcupsd service
service apcupsd restart

# Add cgi-bin to Apache config
# /bin/su -c "echo >> 'ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/' >> /etc/apache2/apache2.conf"

# Restart apache (httpd) service
service apache2 restart
a2enmod cgi
service apache2 restart

echo "ACCESS THE UPC WEB PAGE: http://YOUR-PI-UPS/cgi-bin/apcupsd/multimon.cgi"
