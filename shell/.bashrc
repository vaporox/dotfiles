export PS1='\[\e[36m\]\w \[\e[0m\]$ '

# dnf aliases
alias up='sudo dnf update -y'
alias it='sudo dnf install -y'
alias rmf='sudo dnf remove -y'

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
	echo "Do you really want to remove '$PWD'?"

	local confirm
	read confirm

	if [[ ! "$confirm" =~ ^y(es?)?$ ]]; then
		return 1
	fi

	rm -r "$@" "$PWD"
	cd ..
}
