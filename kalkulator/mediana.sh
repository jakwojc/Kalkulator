#!/bin/bash
kontynuacja=t
while [ "$kontynuacja" = "t" ]
do
clear
echo "Podaj zbior wartosci dla ktorych chesz policzyc mediane. (oddzielone spacjami, tylko liczby naturalne, niekoniecznie rosnaco/malejaco)"
poprzednie=0
ile=0
rm zbior.txt
read zbiorr
zbior=$zbiorr
for var in $zbior
do
echo "$var" >> zbior.txt
done
for var in $zbior
do
((ile++))
done
counter=0
while [ $counter -lt 30 ]
do
rm opzbior.txt
touch opzbior.txt
poprzednie=0
for var in $(cat zbior.txt)
do
aktualne=$var
if [ $aktualne -lt $poprzednie ]
then
echo -e "$aktualne\n$(cat opzbior.txt)" > opzbior.txt
elif [ $aktualne -ge $poprzednie ]
then
echo -e "$(cat opzbior.txt)\n$aktualne" > opzbior.txt
else
echo "Cos nie wyszlo. Prosze sprobowac jeszcze raz."
fi
poprzednie=$var
cat opzbior.txt > zbior.txt
done
((counter++))
done
let par=$(($ile%2))
if [ $par -eq 1 ]
then
cos=$((($ile+3)/2))
sed -n -i "$cos p" zbior.txt
wynik=$(cat zbior.txt)
elif [ $par -eq 0 ]
then
cat zbior.txt > azbior.txt
cos=$((($ile+2)/2))
coss=$((($ile+4)/2))
#cat zbior.txt |less
#cat azbior.txt |less
sed -n -i "$cos p" zbior.txt
sed -n -i "$coss p" azbior.txt
#cat zbior.txt |less
#cat azbior.txt |less
wyn=$(cat zbior.txt)
ik=$(cat azbior.txt)
wynik=$(echo "scale=2 ;($wyn+$ik)/2" |bc)
rm azbior.txt
fi
echo "Mediana podanego zbioru to: $wynik"
echo -e "Mediana z $zbiorr to\n$wynik" >> historia.txt
echo "Czy chcesz kontynuowac? (t/n)"
read kontynuacja
done
