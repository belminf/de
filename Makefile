install :
	yay -S i3-gaps polybar mc rofi termite
	for d in desktop/*.desktop; do ln -sf $(readlink -f $d) ~/.local/share/applications/$(basename $d); done
	ln -sf .inputrc ~/.inputrc
	xdg-mime default mc.desktop inode/directory
