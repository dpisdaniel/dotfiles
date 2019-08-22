export ZSH=~/.oh-my-zsh

alias vim='nvim'    
export EDITOR='nvim'    

alias fzgrep="grep --line-buffered --color=never -r "" * | fzf"    
alias tmux="env TERM=xterm-256color tmux"

export PATH=$PATH:~/.local/bin    

ZSH_THEME="jispwoso"    
HYPHEN_INSENSITIVE="true"    
DISABLE_AUTO_UPDATE="true"    

[ -f ~/usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh    
    
plugins=(    
		git    
		zsh-autosuggestions
		zsh-syntax-highlighting
	)    

source $ZSH/oh-my-zsh.sh    
  
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh    

color00='#ffffff'    
color01='#e0e0e0'    
color02='#d6d6d6'    
color03='#8e908c'    
color04='#969896'    
color05='#4d4d4c'    
color06='#282a2e'    
color07='#1d1f21'    
color08='#c82829'
color09='#f5871f'    
color0A='#eab700'    
color0B='#718c00'    
color0C='#3e999f'    
color0D='#4271ae'    
color0E='#8959a8'    
color0F='#a3685a'    

export FZF_DEFAULT_OPTS="    
--color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D    
--color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C    
--color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D    
"    

if command -v tmux>/dev/null; then    
[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux -u -2
fi    

