#!/bin/zsh                                                                                                   
source ~/.zshrc
HOMESESSION="home"
tmux has-session -t $HOMESESSION &> /dev/null

if [ $? != 0 ] 
 then
    tmux new-session -s $HOMESESSION -n obsidian -d
    tmux send-keys -t $HOMESESSION:obsidian "obs;clear;nv Welcome.md" C-m 

    tmux new-window -t $HOMESESSION -n dotfiles 
    tmux send-keys -t $HOMESESSION:dotfiles "cd ~/.dotfiles;clear;tree -L 2" C-m 

    tmux new-window -t $HOMESESSION -n desktop
    tmux send-keys -t $HOMESESSION:desktop "cd ~/Desktop;clear" C-m 

    tmux new-window -t $HOMESESSION -n downloads
    tmux send-keys -t $HOMESESSION:downloads "cd ~/Downloads;clear" C-m 

    tmux new-window -t $HOMESESSION -n projects
    tmux send-keys -t $HOMESESSION:projects "proj;clear;nvim" C-m 

    tmux new-window -t $HOMESESSION -n zsh
    tmux send-keys -t $HOMESESSION:zsh "proj;clear;ls" C-m 

    tmux select-window -t $HOMESESSION:obsidian
fi

ESPX="espx"
tmux has-session -t $ESPX &> /dev/null

if [ $? != 0 ] 
 then
    tmux new-session -s $ESPX -n 'lsp-zsh' -d
    tmux send-keys -t $ESPX:'lsp-zsh' "proj;cd espx-ls;clear;tree -L 2" C-m 

    tmux new-window -t $ESPX -n 'lsp-nvim'
    tmux send-keys -t $ESPX:'lsp-nvim' "proj;cd espx-ls;clear;nvim" C-m 

    tmux new-window -t $ESPX -n 'lsp-testing'
    tmux send-keys -t $ESPX:'lsp-testing' "proj;cd espx-ls/testing;clear;tree -L 2" C-m 

    tmux new-window -t $ESPX -n 'lib-nvim'
    tmux send-keys -t $ESPX:'lib-nvim' "proj;cd espionox;clear;nvim" C-m 

    tmux new-window -t $ESPX -n 'lib-zsh'
    tmux send-keys -t $ESPX:'lib-zsh' "proj;cd espionox;clear;tree -L 2" C-m 


    tmux select-window -t $ESPX:'lsp-zsh'
fi


PRATTL="prattl"
tmux has-session -t $PRATTL &> /dev/null
# prattl, prattl-web, go-pyenv

if [ $? != 0 ] 
 then
    tmux new-session -s $PRATTL -n zsh -d
    tmux send-keys -t $PRATTL:zsh "proj;cd prattl;clear;tree -L 2" C-m 

    tmux new-window -t $PRATTL -n nvim
    tmux send-keys -t $PRATTL:nvim "proj;cd prattl;clear;nvim" C-m 

    tmux new-window -t $PRATTL -n 'go-pyenv-zsh' 
    tmux send-keys -t $PRATTL:'go-pyenv-zsh' "proj;cd go-pyenv;clear;tree -L 2" C-m 

    tmux new-window -t $PRATTL -n 'go-pyenv-nvim'
    tmux send-keys -t $PRATTL:'go-pyenv-nvim' "proj;cd go-pyenv;clear;nvim" C-m 

    tmux new-window -t $PRATTL -n 'web-zsh' 
    tmux send-keys -t $PRATTL:'web-zsh' "proj;cd prattl-web;clear;tree -L 2" C-m 

    tmux new-window -t $PRATTL -n 'web-nvim'
    tmux send-keys -t $PRATTL:'web-nvim' "proj;cd prattl-web;clear;nvim" C-m 


    tmux select-window -t $PRATTL:zsh
fi

LLMCHAIN="llmchain"
tmux has-session -t $LLMCHAIN &> /dev/null
# prattl, prattl-web, go-pyenv

if [ $? != 0 ] 
 then
    tmux new-session -s $LLMCHAIN -n zsh -d
    tmux send-keys -t $LLMCHAIN:zsh "proj;cd llm_chain;clear;tree -L 2" C-m 

    tmux new-window -t $LLMCHAIN -n nvim
    tmux send-keys -t $LLMCHAIN:nvim "proj;cd llm_chain;clear;nvim" C-m 

    tmux select-window -t $LLMCHAIN:zsh
fi

tmux attach -t $HOMESESSION

