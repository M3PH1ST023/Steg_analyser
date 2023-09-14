#!/bin/bash
#update to latest version for the listed tools below
#exiftool, binwalk, strings, are pre-installed in linux machines (specifically Kali linux)
clear

echo "/\ Specially made for .png, .jpg, .jpeg /\ "
echo "Enter location of picture: "
read LOCATION
file $LOCATION
exiftool $LOCATION
pngcheck $LOCATION
binwalk $LOCATION

echo "Do you want to extract files? [y]"
read EXTRACT
if [ "$EXTRACT" = 'y' ];then
	binwalk --dd .* $LOCATION
fi

echo "Want to view the image? [y]"
read VIEW
if [ "$VIEW" = 'y' ];then
	eog $LOCATION
fi

echo "Tell me about flag format:"
read FLAG
strings $LOCATION > string.txt
echo "strings in file are saved in string.txt"
strings $LOCATION | grep "$FLAG"

echo "is there something hidden and do u have the password? [y]"
read HIDE
if [ "$HIDE" = 'y' ];then
	steghide --extract -sf $LOCATION
fi

tesseract $LOCATION tessaract

zsteg $LOCATION

echo "Do you want to see hex of the picture"
read HEX
if [ "$HEX" = 'y' ];then
	ghex $LOCATION
fi
