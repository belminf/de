install :
	yay -S --needed i3-gaps polybar mc rofi termite termite-terminfo xdotool dunst || true
	for d in desktop/*.desktop; do ln -sf $$(readlink -f $$d) ~/.local/share/applications/$$(basename $$d); done
	ln -sf .inputrc ~/.inputrc
	for c in termite polybar dunst rofi; do ln -sf $$(readlink -f $$c) ~/.config/; done
	xdg-mime default mc.desktop inode/directory
