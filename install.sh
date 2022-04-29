#!/bin/sh
cd $HOME
echo "[-] Installing oh-my-zsh [-]"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "[-] Cloning powerlevel10k theme [-]"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k 
echo "[-] Cloning zsh-syntax-highlighting [-]"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "[-] Cloning zsh-autosuggestions [-]"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#echo "[-] Download fonts [-]"
#echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip"
#wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
#[ -e ~/.local/share/fonts ] || mkdir -p ~/.local/share/fonts
#unzip Meslo.zip -d ~/.local/share/fonts
#fc-cache -fv
#rm Meslo.zip
[ -e .zshrc ] || mv .zshrc .zshrc.before-dotfiles
[ -e .p10k.zsh ] || mv .p10k.zsh .p10k.zsh.before-dotfiles
ln -s dotfiles/.zshrc
ln -s dotfiles/.p10k.zsh

# Fix snaps being displayed in i3 launcher
appDirectory=~/.local/share/applications
[ -d $appDirectory ] || mkdir -p $appDirectory
ln -s /var/lib/snapd/desktop/applications $appDirectory

echo "done!"
