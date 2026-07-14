cp -f configs/.tmux.conf $HOME/.tmux.conf
cp -f configs/git-tools.sh $HOME/git-tools.sh
echo "source \$HOME/git-tools.sh" >> $HOME/.bashrc

# lf
wget https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz
tar -xzf lf-linux-amd64.tar.gz
wget https://raw.githubusercontent.com/gokcehan/lf/master/etc/lfcd.sh
echo "source \$HOME/lfcd.sh" >> $HOME/.bashrc
