# required global variables:
# target, config_src, config_dst

opt_force=
opt_symlink=

# $1 - prompt
get-consent() {
	read -p "$1 (y/n): " -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		return 0
	fi
	return 1
}

install-target() {
	if [ -e "$config_dst" ] && [ -z "$opt_force" ]; then
		echo "Warning!!! $target configuration already exists. Are you sure you want to override it? This action cannot be reversed"
		get-consent "Delete existing $config_dst?" || return
	fi

	echo "Updating $config_dst file..."
	if [ -z $opt_symlink ]; then # install by copy
		install -v "$config_src" "$config_dst"
	else
		ln -fsv "$config_src" "$config_dst"
	fi
}

usage() {
	echo "This script automatically installs some keybindings and plugins for $target"
	echo "Options: "
	echo "  --opt_force                 # override existing $target config"
	echo "  --opt_symlink               # install config as opt_symlink to file in this repo"
	echo "  --help "
}

parse-options() {
	while [ $# != 0 ]; do
		case "$1" in
		"-f" | "--force") opt_force=1 ;;
		"-s" | "--symlink") opt_symlink=1 ;;
		"-h" | "--help") usage; exit ;;
		*) echo "$0: unknown option '$1'"; exit
		esac
		shift
	done
}