install :
	for d in desktop/*.desktop; do ln -sf $(readlink -f $d) ~/.local/share/applications/$(basename $d); done
	ln -sf .inputrc ~/.inputrc
