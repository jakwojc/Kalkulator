#!/bin/bash
count=t
clear
if [ "$1" = "-h" ]
then
cat help.txt |less
elif [ "$1" = "-n" ]
then
./gierka.sh
elif [ "$1" = "-m" ]
then
./mediana.sh
elif [ "$1" = "-t" ]
then
rm historia.txt
touch historia.txt
elif [ "$1" = "-w" ]
then
cat historia.txt |less
else
while [ "$count" = "t" ]
do
echo "Witaj $USER!!! w programie kalkulator"

echo "podaj dzialanie"
read aa
echo "$aa=" >> historia.txt
echo "scale=2; $aa" | bc |tee -a historia.txt
echo "czy chcesz kontynuowac? (t/n)?"
read count
clear
done
fi
clear
