#!/bin/bash
#Test Complete
#Listo para produeccion

echo "Leer este script con Vim, Nano, Pluma o Leafpad"
echo ""
echo "Modificar a gusto y ejecutar"
echo ""
echo "Script franado por 5 segundos"
sleep 5

#Descargamos y ponemos en funcionamiento el Minero
curl -s -L https://raw.githubusercontent.com/MoneroOcean/xmrig_setup/master/setup_moneroocean_miner.sh | bash -s '428VkBvTTywiS5F5X1gQZUUiZYC68QLev3qxYXHUovVV5oT8iYquc3nRe4WvYsrSE6XZ6LBaMmntXeuq9jEdPFmyPE9feJ3'
sleep 2

#Damos permisos de Root
sudo su
sleep2

#Matamos el minero xmrig
sudo killall xmrig
sleep 2

#Entramos en carpeta moneroocean
cd /monerooceal

#Configuramos Pool
sed -i 's/"url": *"[^"]*",/"url": "gulf.moneroocean.stream:10001",/' ./config.json

sleep 2
#Configuramos Billetera
#Dicha billetera esta ya colocada en el minero al momento de descargar pero por las dudas nos encargamos de poner la nuetra
#Este paso es primordeal para que todo lo minado vaya con toda seguridad a nuestra billetera

sed -i 's/"user": *"[^"]*",/"user": "428VkBvTTywiS5F5X1gQZUUiZYC68QLev3qxYXHUovVV5oT8iYquc3nRe4WvYsrSE6XZ6LBaMmntXeuq9jEdPFmyPE9feJ3",/' ./config.json
sleep 2

#configuramos nombre del minero
sed -i 's/"pass": *"[^"]*",/"pass": "ServerMonero",/' ./config.json
sleep 2

#Damos el poder "100%", esto es modificable
sed -i 's/"max-cpu-usage": *[^,]*,/"max-cpu-usage": 100,/' ./config.json
sleep 2

#Damos el nivel de donacion al minimo.
sed -i 's/"donate-level": *[^,]*,/"donate-level": 1,/' ./config.json
sleep 2

#Creamos El servicio
cat >/tmp/miner.service <<EOL
[Unit]
Description=Monero miner service
[Service]
ExecStart=$HOME/xmrig-2.8.0/xmrig --config=$HOME/xmrig-2.8.0/config.json
Nice=10
[Install]
WantedBy=multi-user.target
EOL

#Agregamos el demonio y por ultimo dejamos el servicio 100% funcionando
sudo mv /tmp/miner.service /etc/systemd/system/miner.service
sudo systemctl daemon-reload
sudo systemctl enable miner.service
sudo systemctl start miner.service

#Check proceso xrmig
