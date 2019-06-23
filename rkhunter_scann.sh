echo "" 
echo "EJECUTANDO RKHUNTER" 
echo "" 
rkhunter --check 
echo ""
echo "ABRIENDO LOG"
cat /var/log/rkhunter.log
echo ""
