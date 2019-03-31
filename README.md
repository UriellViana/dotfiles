# Set up

This dotfile config is meant to be ran on top of a manjaro-i3 clean install.

# Steps

1. Update pacman mirrors _(optional, slow)_:
```
sudo pacman-mirrors -f
```

2. Clone this repository, cd into it, give executable permissions to the script and run it:
```
git clone https://github.com/uriellviana/dotfiles
cd dotfiles
chmod +x ./install.sh
./install.sh
```

3. Switch to zsh shell:
```
zsh
```

4. Copy some of the prezto base dotfiles:
```
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

4.1. Configure font on `~/.Xresources`:
```
URxvt.font: xft:FuraCodeNerdFontMono:regular:pixelsize=12:antialias=true:hinting=true, xft:DejaVu Sans:pixelsize=18
URxvt.boldFont: xft:FuraCodeNerdFontMono:bold:pixelsize=12:antialias=true:hinting=true, xft:DejaVu Sans:pixelsize=18
URxvt.italicFont: xft:FuraCodeNerdFontMono:italic:pixelsize=12:antialias=true:hinting=true, xft:DejaVu Sans:pixelsize=18
URxvt.boldItalicFont: xft:FuraCodeNerdFontMono:bold:italic:pixelsize=12:antialias=true:hinting=true, xft:DejaVu Sans:pixelsize=18
```

6. Install prezto (for zsh):
```
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

9. Reboot (Super + 0 && R);
