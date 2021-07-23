source "$HOME/.cargo/env"
source "$HOME/.prompt"

alias up='apt update && apt upgrade -y'
alias it='apt install -y'
alias rmf='apt autoremove -y --purge'

alias ls='ls --color --group-directories-first'
alias back='cd $OLDPWD'

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

rmpwd() {
	local confirm
	read -p "Remove '$PWD'? " confirm

	if [[ ! "$confirm" =~ ^y(es?)?$ ]]; then
		return 1
	fi

	rm -r "$@" "$PWD"
	cd ..
}
