all: oh-my-zsh install

oh-my-zsh:
	if ! [ -e ~/.oh-my-zsh ]; then \
	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh; fi

install:
	./bootstrap.sh

anyenv:
	git clone https://github.com/riywo/anyenv.git ~/.anyenv
