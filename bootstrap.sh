#!/bin/sh

set -e

distributer_id=$(lsb_release -is)

if [ ! "$distributer_id" ]; then
	>&2 Unable to determine distribution!
	exit 1
fi

case $distributer_id in
	Ubuntu)
		sudo add-apt-repository --component universe --yes
		sudo apt install ansible git
	;;
esac

ansible-pull --version
