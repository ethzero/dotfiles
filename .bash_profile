# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

shopt -s dotglob

# Prefer US English and use UTF-8
export LC_ALL="en_GB.UTF-8"
export LANG="en_GB"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer" killall

umask 0002
export CLICOLOR=1;

if [ -f `brew --prefix`/Library/Contributions/brew_bash_completion.sh ]; then
	source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
fi
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
	source `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi
if [ -f `brew --prefix grc`/etc/grc.bashrc ]; then
	source `brew --prefix grc`/etc/grc.bashrc
fi


