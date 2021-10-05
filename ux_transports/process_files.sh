#!/bin/bash
# NOTE : Quote it else use array to avoid problems #
cd ~/abaptransports

FILES=R*   #data files
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  docker cp $f a4h:/usr/sap/trans/data
  docker exec -it a4h chmod -R 777 /usr/sap/trans/data

done
  
  
FILES=K*  #control files
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  docker cp $f a4h:/usr/sap/trans/cofiles
  docker exec -it a4h chmod -R 777 /usr/sap/trans/cofiles
  tfile=${f:8}${f:0:7}  #construct transport file pattern
  docker exec -it a4h su - a4hadm -c "tp addtobuffer $tfile A4H pf=/usr/sap/trans/bin/TP_DOMAIN_A4H.PFL u168"
done

mv ~/TRANSPORTS.ON ~/TRANSPORTS.OFF
