install :
	# Installs
	yay -S --needed --noconfirm \
		sway \
		swaybg \
		swayimg \
		keyd \
		jq \
		mako \
		waybar \
		otf-font-awesome \
		swayidle \
		cliphist \
		sway-contrib \
		grim \
		gammastep \
		iwgtk \
		kanshi
	
	# Link custom configs
	sudo ln -sf $$(readlink -f keyd/default.conf) /etc/keyd/default.conf
	ln -sf $$(readlink -f .inputrc) ~/.inputrc
	
	# .config configs
	for c in sway waybar gammastep rofi kanshi mako; do ln -sf $$(readlink -f $$c) ~/.config/; done
	
	# Services
	sudo systemctl enable keyd --now
