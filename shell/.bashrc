export PATH="$HOME/.cargo/bin:$HOME/.ghcup/bin:$PATH"
export PS1='\[\e[36m\]\w \[\e[0m\]# '

# apt aliases
alias up='apt update && apt upgrade -y'
alias it='apt install -y'
alias rmf='apt autoremove -y --purge'

# improve ls command
alias ls='ls --color --group-directories-first'

# create directory and cd into it
mkcd() {
	if [[ ! "$*" ]]; then
		echo 'No name specified!'
		return 1
	fi

	if [[ -f "$*" ]]; then
		echo "'$*' already exists but isn't a directory!"
		return 1
	fi

	if [[ ! -d "$*" ]]; then
		mkdir "$*"
	fi

	cd "$*"
}

# remove current directory
rmpwd() {
	local confirm
	read -p "Remove '$PWD'? " confirm

	if [[ ! "$confirm" =~ ^y(es?)?$ ]]; then
		return 1
	fi

	rm -r "$@" "$PWD"
	cd ..
}
