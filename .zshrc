bindkey -v
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

#workaround for using nvm in tmux/byobu
PATH="/usr/local/bin:$(getconf PATH)"

## sdkman
if [ -f $HOME/.sdkman/bin/sdkman-init.sh ]; then
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

#kerl
if [ -d $HOME/kerl/21.0 ]; then
    . $HOME/kerl/21.0/activate
fi

case "${OSTYPE}" in
    darwin*)
        if [ -f /Applications/Emacs.app/Contents/MacOS/Emacs ]; then
            alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
            alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
        fi
        #for homebrew
        if [ -f /opt/homebrew/bin/brew ]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
        #adb
        if [ -f $HOME/Library/Android/sdk/platform-tools/adb ]; then
            export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools:$HOME/Library/Android/sdk/tools
        fi
        #my tools
        if [ -d $HOME/tools/android-ndk ]; then
            export PATH=$PATH:$HOME/tools/android-ndk
        fi
        #nvm
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

        #sdkman java
        if ! java -version |& grep HotSpot > /dev/null; then
            if [ -d $HOME/.sdkman/candidates/java/oraclejdk1.8.0 ]; then
                sdk default java oraclejdk1.8.0 > /dev/null
            fi
        fi

        source "$HOME/.functions"

        #ruby
        if [ -d /opt/homebrew/opt/ruby/bin ]; then
            export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
        fi

        #pip lib
        if [ -d $HOME/Library/Python/3.9/bin ]; then
            export PATH=$PATH:$HOME/Library/Python/3.9/bin
        fi
        if [ -d $HOME/Library/Python/3.11/bin ]; then
            export PATH=$PATH:$HOME/Library/Python/3.11/bin
        fi

        #vscode
        if [ -d '/Applications/Visual Studio Code.app/Contents/Resources/app/bin' ]; then
            export PATH=$PATH:'/Applications/Visual Studio Code.app/Contents/Resources/app/bin'
        fi

        #flutter
        if [ -d "$HOME/flutter" ]; then
            export PATH=$PATH:$HOME/flutter/bin
        fi

        if [ -d '/usr/local/share/dotnet' ]; then
            export PATH=$PATH:'/usr/local/share/dotnet'
        fi

        #rust
        if [ -d "$HOME/.cargo" ]; then
            source $HOME/.cargo/env
        fi

        #n
        #https://github.com/tj/n#optional-environment-variables
        mkdir -p $HOME/.n
        export N_PREFIX=$HOME/.n
        export PATH=$N_PREFIX/bin:$PATH

        export PATH=$PATH:${HOME}/tools/bin

        # The next line updates PATH for the Google Cloud SDK.
        if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
        if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
        ;;
esac

## go
if [ -d '/usr/local/go/bin' ]; then
   export PATH=/usr/local/go/bin:$PATH
fi
if [ -d "$HOME/go/bin" ]; then
   export PATH=$HOME/go/bin:$PATH
fi
if which go >/dev/null; then
    export GOPATH=$(go env GOPATH)
fi

## nodenv
if which nodenv > /dev/null; then
    eval "$(nodenv init -)"
fi

## pyenv
if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi

## rbenv
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

## check if python and python3 are installed
## if phython not installed and python3 installed, set python3 as python
if ! which python > /dev/null && which python3 > /dev/null; then
    alias python=python3
    alias pip=pip3
fi

## local
if [[ -f ~/.zshenv_local ]]; then
    source ~/.zshenv_local
fi

#alias
alias ll="ls -l"
alias g="git"
alias m="make"

#for dlv
#https://github.com/voyagegroup/fluct_dlv
if [ -d "/opt/homebrew/opt/php@8.2" ]; then
    export PATH="/opt/homebrew/opt/php@8.2/bin:$PATH"
    export PATH="/opt/homebrew/opt/php@8.2/sbin:$PATH"
    export CPPFLAGS="-I/opt/homebrew/include"
fi

# x11
if [ -d /opt/X11/bin ]; then
    export PATH=/opt/X11/bin:$PATH
fi

# git alias
git config --global include.path "$HOME/gitalias.txt"
