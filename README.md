# Manual steps taken

1. Install Manjaro;
2. Install yay:
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```
3. Upgrade yay packages:
```
yay
```
3. Install Fura Code Nerd Fonts:
```
yay -S aur/nerd-fonts-fira-code
```
4. Configure font on `~/.Xresources`:
```
URxvt.font: xft:FuraCodeNerdFontMono:regular:pixelsize=12:antialias=true:hinting=true, xft:DejaVu Sans:pixelsize=18
URxvt.boldFont: xft:FuraCodeNerdFontMono:bold:pixelsize=12:antialias=true:hinting=true, xft:DejaVu Sans:pixelsize=18
URxvt.italicFont: xft:FuraCodeNerdFontMono:italic:pixelsize=12:antialias=true:hinting=true, xft:DejaVu Sans:pixelsize=18
URxvt.boldItalicFont: xft:FuraCodeNerdFontMono:bold:italic:pixelsize=12:antialias=true:hinting=true, xft:DejaVu Sans:pixelsize=18
```
5. Enter zsh:
```
zsh
```
6. Install prezto (for zsh):
```
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```
7. Add the following to `.zshrc`:
```
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
```
8. Set zsh as the default shell:
```
chsh -s $(which zsh)
```
9. Reboot (Super + 0 && R);
