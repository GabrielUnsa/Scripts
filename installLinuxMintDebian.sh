#!/bin/bash
# -*-ENCODING UTF-8 -*-

#Actualizacion postInstalacion
apt-get update -y
apt-get upgrade -y

#Instalacion del Servidor PHP
apt-get install apache2 -y
apt-get install php -y
wget https://dev.mysql.com/get/mysql-apt-config_0.8.30-1_all.deb
dpkg -i mysql-apt-config_0.8.30-1_all.deb
apt update
apt-get install mysql-server -y
apt-get install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y
nano /etc/apache2/apache2.conf
/etc/init.d/apache2 restart
dpkg-reconfigure phpmyadmin
phpenmod mbstring
mysql -u root -p

#Instalacion de mongoDB
apt-get install gnupg curl
curl -fsSL https://pgp.mongodb.com/server-7.0.asc |sudo gpg  --dearmor -o /etc/apt/trusted.gpg.d/mongodb-server-7.0.gpg
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
apt-get update
apt-get install -y mongodb-org
systemctl start mongod
systemctl daemon-reload

#Instalacion de nodeJS
apt-get update
apt-get upgrade -y
apt-get install python3-pip -y
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
apt update
apt-get install -y nodejs
apt-get update
apt list --upgradable
apt-get update -y
npm install -g npm@latest
npm cache clean -f
npm install -g n
n stable
npm install -g eslint

#Docker
apt install docker.io -y

#Instalacion Composer
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
apt-get install python3-full -y
apt install python3-venv python3-pip -y
mkdir /var/www/notebook 
cd /var/www/notebook
python3 -m venv notebook_env
source notebook_env/bin/activate
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
pip3 install torch torchvision torchaudio
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
apt-get install cheese -y
apt-get install geany -y
apt-get install python3-django -y
apt-get install python3-neovim -y
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
exit

