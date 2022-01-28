#!/bin/sh
cd $HOME
echo "[-] Installing oh-my-zsh [-]"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "[-] Cloning powerlevel10k theme [-]"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10kecho 
echo "[-] Cloning zsh-syntax-highlighting [-]"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "[-] Cloning zsh-autosuggestions [-]"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "[-] Download fonts [-]"
echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d ~/.local/share/fonts
fc-cache -fv
mv .zshrc .zshrc.before-dotfiles
mv .p10k.zsh .p10k.zsh.before-dotfiles
ln -s dotfiles/.zshrc
ln -s dotfiles/.p10k.zsh
echo "done!"
