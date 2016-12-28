all: oh-my-zsh install

oh-my-zsh:
	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

install:
	./bootstrap.sh

# anyenv:
# 	git clone https://github.com/riywo/anyenv.git ~/.anyenv
