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
