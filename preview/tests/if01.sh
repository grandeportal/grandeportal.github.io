echo -n "Sim ou Não? (s/n) "
read answer
if [ "$answer" == "s" ]; then
    echo "Sim"
else
    echo "Não"
fi
