#!/bin/bash
echo "Removendo arquivo do /dev/null"
rm /lib/systemd/system/x11-common.service
echo "Reiniciando daemon"
systemctl daemon-reload
echo "Criando arquivo de serviço"
echo "[Unit]" > /lib/systemd/system/x11vnc.service
echo "Description=Start x11vnc at startup." >> /lib/systemd/system/x11vnc.service
echo "After=multi-user.target" >> /lib/systemd/system/x11vnc.service
echo "[Service]" >> /lib/systemd/system/x11vnc.service
echo "Type=simple" >> /lib/systemd/system/x11vnc.service
echo "ExecStart=/usr/bin/x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /etc/x11vnc.pass -rfbport 5900 -shared" >> /lib/systemd/system/x11vnc.service
echo "[Install]" >> /lib/systemd/system/x11vnc.service
echo "WantedBy=multi-user.target" >> /lib/systemd/system/x11vnc.service
echo "Recarregando daemon"
systemctl daemon-reload
echo "Ativar inicialização"
systemctl enable x11vnc.service
echo "Iniciando serviço"
service x11-common start
echo "Criar senha"
x11vnc -storepasswd redes21 /etc/x11vnc.pass
echo "Iniciando serviço"
service x11vnc start

