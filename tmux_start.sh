#!/bin/zsh                                                                                                   

SESSIONNAME="home"
# I cant source from .zshrc for some reason when i start the server
tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ] 
 then
    tmux new-session -s $SESSIONNAME -n obsidian -d
    tmux send-keys -t $SESSIONNAME:obsidian "source ~/.zshrc;obs;clear" C-m 

    tmux new-window -t $SESSIONNAME -n dotfiles 
    tmux send-keys -t $SESSIONNAME:dotfiles "cd ~/.dotfiles;clear;tree" C-m 

    tmux new-window -t $SESSIONNAME -n desktop
    tmux send-keys -t $SESSIONNAME:desktop "cd ~/Desktop;clear" C-m 

    tmux new-window -t $SESSIONNAME -n downloads
    tmux send-keys -t $SESSIONNAME:downloads "cd ~/Downloads;clear" C-m 

    tmux new-window -t $SESSIONNAME -n projects
    tmux send-keys -t $SESSIONNAME:projects "cd ~/Documents/projects;clear;nvim" C-m 

    tmux new-window -t $SESSIONNAME -n zsh
    tmux send-keys -t $SESSIONNAME:zsh "cd ~/Documents/projects;clear;ls;" C-m 

    tmux select-window -t $SESSIONNAME:obsidian
fi

tmux attach -t $SESSIONNAME

