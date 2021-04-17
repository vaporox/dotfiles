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
		echo 'No name specified.'
		return 1
	fi

	mkdir "$*"
	cd "$*"
}

# remove current directory
rmpwd() {
	echo -e "Do you really want to remove \e[36m$PWD\e[0m?"
	local confirm
	read confirm

	if [[ ! "$confirm" =~ ^y(es?)?$ ]]; then
		return 1
	fi

	rm -r "$@" "$PWD"
	cd ..
}

# run an npm script from a project
run() {
	if [[ ! "$1" ]]; then
		echo 'No script specified.'
		return 1
	fi

	if [[ ! "$2" ]]; then
		echo 'No project specified.'
		return 1
	fi

	if [[ ! -d ~/Git/"$2" ]]; then
		echo "Invalid project: $2"
		return 1
	fi

	cd ~/Git/"$2"
	npm run "$1"
}
