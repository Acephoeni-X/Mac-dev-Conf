# all exports
export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"   #JAVA11 path (install cask and intall java11)
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"      #NODE16 path
export PATH="$HOME/.composer/vendor/bin:$PATH"
export TERM="screen-256color"					# color scheme inside tmux session (always run 'tmux -2')

# adding color to directories
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

alias ls="ls -alG"
alias python3="python3.9"
alias la="ls -alG -a"
alias g++="g++ -std=c++11"
alias nodp="echo \"qekm<=(!mK)<5&rcj@APj'4._8k7!MS28f=9T^&Zcw8WMB}L$>Ug{@NQL?}xNzQAnBR=j\" | pbcopy"
alias pdf='(){asciidoctor-pdf -a allow-uri-read $1}'

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/git-branch-name/git-branch-name.zsh


#VSCODE
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

PROMPT='%F{208}%n%f : %F{226}%~%f -> '
