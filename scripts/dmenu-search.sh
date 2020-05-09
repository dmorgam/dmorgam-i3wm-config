#!/bin/sh

OPCIONES="Man\nArch-wiki\nGoogle\nYouTube\nWikipedia\nDuckDuckgo"

DMENUOPTS="-h 29 -nb #222 -nf #fff -sb #cddc39 -sf #222 -b -fn NotoMonoRegular:bold:pixelsize=17 -w 1100 -x 100 -y 10"

CHOICE=$(echo -e $OPCIONES | dmenu $DMENUOPTS -p 'Busqueda:' )

case $CHOICE in
	Man)
	  BROWSER=surf man --html $(find /usr/share/man/man1/ -type f | awk -F '/' '/1/ {print $6}' | sed 's/.1.gz//g' | dmenu $DMENUOPTS -p 'Man:')
	  ;;
	Arch-wiki)
	  surf "https://wiki.archlinux.org/index.php?search=$(echo '' | dmenu $DMENUOPTS -p 'Arch Wiki:')"
	  ;;
	Google)
	  surf "https://www.google.com/search?q=$(echo '' | dmenu $DMENUOPTS -p 'Google:')"
	  ;;
	YouTube)
	  surf "https://www.youtube.com/results?search_query=$(echo '' | dmenu $DMENUOPTS -p 'YouTube:')"
	  ;;
	Wikipedia)
	  surf "https://es.wikipedia.org/w/index.php?search=$(echo '' | dmenu $DMENUOPTS -p 'Wikipedia:')"
	  ;;	
	DuckDuckgo)
	  surf "https://duckduckgo.com/?q=$(echo '' | dmenu $DMENUOPTS -p 'DuckDuckgo:')"
	  ;;
esac

