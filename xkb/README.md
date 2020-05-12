## TODO

Can no longer repeat characters

## Symlink files

    sudo ln -sf $(pwd)/symbols /usr/share/X11/xkb/symbols/win_remap
    sudo ln -sf $(pwd)/types /usr/share/X11/xkb/types/win_remap

## Modify existing files

### Include types

Add it to /usr/share/X11/xkb/types/complete

```
    include "win_remap"
```

### Add as available option

Add it to /usr/share/X11/xkb/rules/evdev
Under `shift:rshift_both_capslock_cancel = +shift(rshift_both_capslock_cancel)`

```
win_remap:super                    =       +win_remap(super)
```

### Setup keyboard

Add the option to /etc/X11/xorg.conf.d/90-keyboard.conf

```
 Option "XkbOptions" "caps:escape,shift:both_capslock_cancel,win_remap:super"
```

### Reload

```
xkbcomp map $DISPLAY
```
