#!/bin/bash
# -*-ENCODING UTF-8 -*-

#Actualizacion postInstalacion
apt-get update -y
apt-get upgrade -y

#Instalacion del Servidor PHP
apt-get install apache2 -y
apt-get install php -y
apt-get install mysql-server -y
apt-get install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y
nano /etc/apache2/apache2.conf
/etc/init.d/apache2 restart
dpkg-reconfigure phpmyadmin
phpenmod mbstring
mysql -u root

#Instalacion de mongoDB
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
touch /etc/apt/sources.list.d/mongodb-org-4.4.list
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
apt-get update 
apt-get install -y mongodb-org
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-database hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections
systemctl start mongod
systemctl daemon-reload

#Instalacion de nodeJS
apt-get update
apt-get upgrade -y
apt-get install python3-pip -y
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
apt-get update
apt-get install nodejs -y
apt-get install npm -y
npm install -g npm@latest
npm cache clean -f
npm install -g n
n stable
npm install -g eslint

#Instalacion Composer
apt install docker.io -y
curl -L "https://github.com/docker/compose/releases/download/2.18.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#Instalacion Postgresql
apt-get update
apt-get upgrade -y
apt-get -y install postgresql

#Apps DataScience
apt-get install r-base -y
wget https://download1.rstudio.org/electron/jammy/amd64/rstudio-2023.12.1-402-amd64.deb
dpkg -i rstudio-2023.12.1-402-amd64.deb
apt-get install -f
dpkg -i rstudio-2023.12.1-402-amd64.deb
pip3 install jupyterlab
pip3 install pandas
pip3 install numpy
pip3 install plotly
pip3 install scikit-learn
pip3 install category_encoders
pip3 install imbalanced-learn
pip3 install lightgbm
pip3 install keras
pip3 install tensorflow
pip3 install shap
pip3 install scipy
pip3 install pytorch
pip3 install nltk
pip3 install spacy


#Apps
apt-get install texlive-base -y
apt-get install texlive-full -y
apt-get install texstudio -y
apt-get install git -y
apt-get install curl -y
apt-get install unrar -y
apt-get install xclip -y
apt-get install xsel -y
add-apt-repository ppa:mikhailnov/pulseeffects
apt-get update
apt-get install pulseeffects -y
apt-get install -f
apt-get install cheese -y
apt-get install geany -y
apt-get install python3-django -y
apt-get install python3-neovim -y
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
exit

