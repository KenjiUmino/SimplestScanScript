#!/bin/bash

echo "Welcome to the Simplest Scan Script ever"
echo " "
PS3='Whatcha Wanna Do?: '
options=("Scan JPG @ 150dpi Grayscale" "Scan JPG @ 150dpi Color" "Scan PNG @ 300dpi Color" "Scan PDF @ 150dpi Grayscale" "Scan PDF @ 150dpi Color" "Quit")
select opts in "${options[@]}"; do
    case $opts in
        "Scan JPG @ 150dpi Grayscale")
            echo "Gotcha!"
	    scanimage -p -x 215 -y 297 --mode=Gray --format=jpeg --resolution=150 --output-file="/save/file/here/$(date +%F_%R)-150dpi-gray.jpg"
            ;;
        "Scan JPG @ 150dpi Color")
            echo "Gotcha!"
	    scanimage -p -x 215 -y 297 --mode=Color --format=jpeg --resolution=150 --output-file="/save/file/here/$(date +%F_%R)-150dpi-color.jpg"
            ;;
        "Scan PNG @ 300dpi Color")
            echo "Gotcha!"
	    scanimage -p -x 215 -y 297 --mode=Color --format=png --resolution=300 --output-file="/save/file/here/$(date +%F_%R)-300dpi-color.png"
            ;;
        "Scan PDF @ 150dpi Grayscale")
            echo "Gotcha!"
	    scanimage -p -x 215 -y 297 --mode=Gray --format=png --resolution=150 | convert png:- "/save/file/here/$(date +%F_%R)-150dpi-gray.pdf"
            ;;
        "Scan PDF @ 150dpi Color")
            echo "Gotcha!"
	    scanimage -p -x 215 -y 297 --mode=Color --format=png --resolution=150 | convert png:- "/save/file/here/$(date +%F_%R)-150dpi-color.pdf"
            ;;
        
        "Quit")
	    echo "goodbye"
	    exit
	    ;;
        *) echo "invalid option $REPLY";;
    esac
done
