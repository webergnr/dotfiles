
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="half-life"
plugins=(git)

source $ZSH/oh-my-zsh.sh

#git stuff
alias git-clean-merged="git branch --merged | egrep -v \"(^\*|master|main)\" | xargs git branch -d"
alias git-prlog="git log --format=format:\"- %h **%s**%n%n%w(0,2,2)%b\" --reverse origin/HEAD..HEAD"
alias my-prs-open="gh pr list -A @me -S review:required --json number,url,title --template '{{range .}}{{tablerow (printf \"#%v\" .number | autocolor \"green\") .title .url}}{{end}}'"
alias my-prs-changes="gh pr list -A @me -S review:changes-requested --json number,url --template '{{range .}}{{tablerow (printf \"#%v\" .number | autocolor \"green\") .url}}{{end}}'"
alias my-prs-approved="gh pr list -A @me -S review:approved --json number,url --template '{{range .}}{{tablerow (printf \"#%v\" .number | autocolor \"green\") .url}}{{end}}'"

#shortcuts
alias b="byobu"
alias c="code ."
alias lg="lazygit"

# . /opt/homebrew/opt/asdf/libexec/asdf.sh

# pnpm
export PNPM_HOME="/Users/wlg/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export GOPATH=$HOME/.gopath

export PATH=$PATH:$HOME/development/flutter/bin

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
export PATH=$HOME/.config/emacs/bin:$PATH


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# printf '\n%.0s' {1..100}
# printf "\e[H\ec\e[${LINES}B"


if [ "$TERM_PROGRAM" = tmux ]; then
	#echo ''
else
	byobu
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
alias python=python3

eval "$(goenv init -)"

export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet


export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools



export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

export PATH=$PATH:/Applications/Alacritty.app/Contents/MacOS

export DOTNET_ROOT=/usr/local/share/dotnet


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
