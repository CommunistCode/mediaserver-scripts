#! /bin/bash

echo -e "\nWhat quality do you wish to scan at?"
echo -e ""
echo "1) Very quick and dirty (75dpi)"
echo "2) Quick (150dpi)"
echo "3) Average (300dpi)"
echo "4) Good (600dpi)"
echo "5) Best - very slow! (1200dpi)"
echo -e ""
echo "Please enter an option (1-5)"

read option

case $option in
"1")
  dpi="75"
  ;;
"2")
  dpi="150"
  ;;
"3")
  dpi="300"
  ;;
"4")
  dpi="600"
  ;;
"5")
  dpi="1200"
  ;;
esac

currentDate="$(date '+%Y%m%d-%M%S')"

scanimage -d pixma -p --mode=Color --resolution=${dpi} > scan.pnm

pnmtops scan.pnm > scan.ps
ps2pdf scan.ps

mv scan.pdf /mnt/seaRaid/scan-${currentDate}.pdf

rm scan.ps
rm scan.pnm
