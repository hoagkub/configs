cp -f configs/.tmux.conf .tmux.conf
cp -f configs/git-tools.sh git-tools.sh
echo "source \$HOME/git-tools.sh" >> $HOME/.bashrc