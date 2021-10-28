#! /bin/bash

#початок програми
echo "Start check clock"

#введення часу очікування (в секундах)
echo "Write Waiting time (seconds)"
read WaitingTime
#Виведення дати
date

#повна дата + перевірка статусу синхронізації
timedatectl

#Увімкнути синхронизацію 
sudo timedatectl set-ntp on

#повна дата + перевірка статусу синхронізації
timedatectl

#Вимкнути синхронізацію 
sudo timedatectl set-ntp no

#повна дата + перевірка статусу синхронізації
timedatectl


#очікування часу оцінки
Timer=0
while [[ "$Timer" -lt $WaitingTime ]] 
do
	
	
	Timer=$(($Timer+1))
	
	sleep 1

done


#оцінка різниці часу в наносекундах перед увімкненням синхронізації (поки що на око)
	echo "Print time before syncing "

	DateSys=$(date --rfc-3339=ns )
	DateHW=$(sudo hwclock --show)
	echo "Systime $DateSys"
	echo "HWtime $DateHW"

	DateSys=$(date --rfc-3339=ns )
	DateHW=$(sudo hwclock --show)
	echo "Systime $DateSys"
	echo "HWtime $DateHW"

	DateSys=$(date --rfc-3339=ns )
	DateHW=$(sudo hwclock --show)
	echo "Systime $DateSys"
	echo "HWtime $DateHW"

#Відновлення синхронізації

#Увімкнути синхронизацію 
sudo timedatectl set-ntp on

#повна дата + перевірка статусу синхронізації
timedatectl

#оцінка різниці часу в наносекундах після увімкнення синхронізації (поки що на око)
	echo "Print time after syncing "
	
	DateSys=$(date --rfc-3339=ns )
	DateHW=$(sudo hwclock --show)
	echo "Systime $DateSys"
	echo "HWtime $DateHW"

	DateSys=$(date --rfc-3339=ns )
	DateHW=$(sudo hwclock --show)
	echo "Systime $DateSys"
	echo "HWtime $DateHW"

	DateSys=$(date --rfc-3339=ns )
	DateHW=$(sudo hwclock --show)
	echo "Systime $DateSys"
	echo "HWtime $DateHW"

# після виконання оцінити чи був стрибок в наносекундах перед синхронізацією і після
# не знайшов команду для виведення hwclock у наносекундах,
# тоді просто можна віднімати час системи і апаратний з похибкою на час виконання самої програми 
# тому робиться повторення для визначення похибки виконання