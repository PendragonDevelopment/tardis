echo "source /home/vagrant/zsh-git-prompt/zshrc.sh" >> ~/.zshrc
echo "PROMPT='%B%m%~%b$(git_super_status) $ '" >> ~/.zshrc