install :
	yay -S --needed --noconfirm i3-gaps polybar mc rofi kitty xdotool dunst autorandr zenity xautolock iwgtk || true
	for d in desktop/*.desktop; do ln -sf $$(readlink -f $$d) ~/.local/share/applications/$$(basename $$d); done
	ln -sf $$(readlink -f .inputrc) ~/.inputrc
	for c in i3 kitty polybar dunst rofi; do ln -sf $$(readlink -f $$c) ~/.config/; done
	xdg-mime default mc.desktop inode/directory
	ln -sf $$(readlink -f scripts/autorandr_post.sh) ~/.config/autorandr/postswitch
	sudo systemctl enable autorandr
