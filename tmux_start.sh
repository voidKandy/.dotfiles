#!/bin/zsh                                                                                                   

SESSIONNAME="home"
tmux has-session -t $HOME &> /dev/null

if [ $? != 0 ] 
 then
    tmux new-session -s $HOME -n obsidian -d
    tmux send-keys -t $HOME:obsidian "source ~/.zshrc; obs;clear;nv Welcome.md" C-m 

    tmux new-window -t $HOME -n dotfiles 
    tmux send-keys -t $HOME:dotfiles "cd ~/.dotfiles;clear;tree" C-m 

    tmux new-window -t $HOME -n desktop
    tmux send-keys -t $HOME:desktop "cd ~/Desktop;clear" C-m 

    tmux new-window -t $HOME -n downloads
    tmux send-keys -t $HOME:downloads "cd ~/Downloads;clear" C-m 

    tmux new-window -t $HOME -n projects
    tmux send-keys -t $HOME:projects "cd ~/Documents/projects;clear;nvim" C-m 

    tmux new-window -t $HOME -n zsh
    tmux send-keys -t $HOME:zsh "cd ~/Documents/projects;clear;ls" C-m 

    tmux select-window -t $HOME:obsidian
fi

tmux attach -t $HOME

