
# oh-my-zsh setting
# https://github.com/robbyrussell/oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

## anyenv
if [[ $SHELL =~ "zsh" ]]; then
    if [ -d ${HOME}/.anyenv ]; then
        export PATH="$HOME/.anyenv/bin:$PATH"
        eval "$(anyenv init -)"
    fi
else
    echo "skip setting anyenv. anyenv work when login shell is set on zsh"
fi

case "${OSTYPE}" in
    darwin*)
        if [ -f /Applications/Emacs.app/Contents/MacOS/Emacs ]; then
            alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
            alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
        fi
        ;;
esac
