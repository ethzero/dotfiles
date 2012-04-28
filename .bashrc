# .bashrc
# Invoked upon creation of new shell

if [[ -n "$PS1" ]]; then
	echo "Exec'ing .bash_profile"
	source ~/.bash_profile
fi
echo ".bashrc Invoked"