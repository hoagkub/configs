# lf
wget https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz
tar -xzf lf-linux-amd64.tar.gz
mkdir -p ~/.local/bin
mv ~/lf ~/.local/bin/
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
wget https://raw.githubusercontent.com/gokcehan/lf/master/etc/lfcd.sh
echo "source \$HOME/lfcd.sh" >> $HOME/.bashrc

# tmux
cp -f configs/.tmux.conf $HOME/.tmux.conf

# git
cp -f configs/git-tools.sh $HOME/git-tools.sh
echo "source \$HOME/git-tools.sh" >> $HOME/.bashrc
