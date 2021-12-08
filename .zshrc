
# oh-my-zsh setting
# https://github.com/robbyrussell/oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

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
        if [ -d $HOME/Library/Python/2.7/bin ]; then
            export PATH=$PATH:$HOME/Library/Python/2.7/bin
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
if [ -d '' ]; then
    export PATH=/usr/local/opt/go@1.14/bin:$PATH
fi
if which go >/dev/null; then
    export GOPATH=$(go env GOPATH)
fi

## anyenv
if [[ $SHELL =~ "zsh" ]]; then
    if which anyenv > /dev/null; then
        export PATH="$HOME/.anyenv/bin:$PATH"
        eval "$(anyenv init -)"
    fi
else
    echo "skip setting anyenv. anyenv work when login shell is set on zsh"
fi
