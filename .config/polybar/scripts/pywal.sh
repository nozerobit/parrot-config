#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/colors.ini"
RFILE="$HOME/.config/polybar/scripts/themes/rofi/colors.rasi"

# Get colors
pywal_get() {
	wal -i "$1" -q -t
}

# Change colors
change_color() {
	# polybar
	sed -i -e "s/bg = #.*/bg = $FG/g" $PFILE
	sed -i -e "s/fg = #.*/fg = $FG/g" $PFILE
	sed -i -e "s/ac = #.*/ac = $FGA/g" $PFILE
	sed -i -e "s/*shade1 = #.*/*shade1 = $SH1/g" $PFILE
	sed -i -e "s/*shade2 = #.*/*shade2 = $SH2/g" $PFILE
	sed -i -e "s/*shade3 = #.*/*shade3 = $SH3/g" $PFILE
	sed -i -e "s/*shade4 = #.*/*shade4 = $SH4/g" $PFILE
	sed -i -e "s/*shade5 = #.*/*shade5 = $SH5/g" $PFILE
	sed -i -e "s/*shade6 = #.*/*shade6 = $SH6/g" $PFILE
	sed -i -e "s/*shade7 = #.*/*shade7 = $SH7/g" $PFILE
	sed -i -e "s/*shade8 = #.*/*shade8 = $SH8/g" $PFILE
	
	# rofi
    cat > $RFILE <<- EOF
    configuration {
      show-icons: true;
      font: "SauceCodePro Nerd Font Medium 10";
      drun-display-format: "{icon} {name}";
      display-run: " ";
      display-drun: " ";
      display-window: " ";
      modi: "window,run,drun";
    }
    * {
      background-color: ${FG}FF;
      bg-alt: #FFFFFF10;
      fg: ${SH2}FF;
      nord-blue-light: ${SH1}FF;
      nord-yellow: ${SH3}FF;
      border: 0;
      lines: 12;
      padding: 0;
      margin: 0;
      spacing: 0;
    }
    window {
      width: 30%;
      transparency: "real";
    }
    mainbox {
      children: [inputbar, listview];
    }
    listview {
      columns: 1;
    }
    element {
      padding: 12;
      orientation: vertical;
      text-color: @fg;
    }
    element selected {
      background-color: @bg-alt;
      text-color: @nord-blue-light;
    }
    inputbar {
      background-color: @background;
      children: [prompt, entry];
    }
    prompt {
      enabled: true;
      font: "SauceCodePro Nerd Font 12";
      padding: 12 0 0 12;
      text-color: @nord-yellow;
    }
    entry {
      padding: 12;
      text-color: @nord-yellow;
    }
EOF
    # enable-ipc
	polybar-msg cmd restart
}

# Main
if [[ -f "/usr/local/bin/wal" ]]; then
	if [[ "$1" ]]; then
		pywal_get "$1"

		# Source the pywal color file
		. "$HOME/.cache/wal/colors.sh"

		BG=`printf "%s\n" "$bg"`
		FG=`printf "%s\n" "$color0"`
		FGA=`printf "%s\n" "$color7"`
		SH1=`printf "%s\n" "$color1"`
		SH2=`printf "%s\n" "$color2"`
		SH3=`printf "%s\n" "$color1"`
		SH4=`printf "%s\n" "$color2"`
		SH5=`printf "%s\n" "$color1"`
		SH6=`printf "%s\n" "$color2"`
		SH7=`printf "%s\n" "$color1"`
		SH8=`printf "%s\n" "$color2"`

		change_color
	else
		echo -e "[!] Please enter the path to wallpaper. \n"
		echo "Usage : ./pywal.sh path/to/image"
	fi
else
	echo "[!] 'pywal' is not installed."
fi
