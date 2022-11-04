export RUNZSH=no
sudo env http_proxy=$http_proxy apt-get update
sudo env http_proxy=$http_proxy apt-get install -y zsh silversearcher-ag tmux connect-proxy git curl
sudo locale-gen zh_CN.UTF-8
#sudo update-locale LANG=zh_CN.UTF-8 LANGUAGE=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## install plugins
# git clone https://github.com/sobolevn/sobole-zsh-theme.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes
# cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes
# ln -s $PWD/sobole-zsh-theme/sobole.zsh-theme .
# cd -
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i "35,38s/\(.*\)ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=.*/\1ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=\"fg=magenta\"/g" ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
git clone https://github.com/seebi/dircolors-solarized.git  ~/dircolors-solarized
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
cd ~
ln -s -f .tmux/.tmux.conf
sed -i "19,22s/set -g prefix2 C-a/#set -g prefix2 C-a/" ~/.tmux.conf
sed -i "19,22s/bind C-a send-prefix -2/#bind C-a send-prefix -2/" ~/.tmux.conf

echo "setw -g allow-rename off" >> ~/.tmux/.tmux.conf.local
echo >> ~/.tmux/.tmux.conf.local
echo "setw -g automatic-rename off" >> ~/.tmux/.tmux.conf.local
echo >> ~/.tmux/.tmux.conf.local
echo "set-window-option -g mode-keys vi" >> ~/.tmux/.tmux.conf.local
echo >> ~/.tmux/.tmux.conf.local

cp ~/.tmux/.tmux.conf.local ~/
# sed -i "s/^ZSH_THEME=.*\"/ZSH_THEME=\"gnzh\"/" ~/.zshrc
cd -
mv ~/.zshrc ~/.zshrc.bk
cp ./zshrc ~/.zshrc
mkdir -p ~/.ssh
