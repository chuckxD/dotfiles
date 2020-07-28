
# If not running interactively, don't do anything
# Important for ssh+svn support
if [[ -z ${PS1} ]]; then
    return
fi
# Variables and Path {{{1
export EDITOR=vim
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -\""
export GREP_OPTIONS='--color=auto --line-number --binary-files=without-match'

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export XDG_CONFIG_HOME="$HOME/.config"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# macbook only
export PATH="$PATH:$HOME/mongodb/bin:/Applications/MacVim.app/Contents/bin:/usr/local/Cellar/rabbitmq/3.2.1/sbin:export:$(brew --prefix)/bin:$HOME/nvim-osx64/bin:/Users/jcs/.rvm/gems/ruby-2.1.1/bin:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:/Users/jcs/Library/Python/2.7/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:$HOME/redis-stable/src/redis-server:$HOME/redis-stable/src/redis-cli:/Users/jcs/.rvm/gems/ruby-2.1.1/bin:$HOME/coding-configs/bin:${JAVA_HOME}:${HOME}/.bin"
export TCL_PATH="/usr/local/bin"

export PIP_PATH="/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages"
# Mac OS X {
if [[ ${OSTYPE} == darwin* ]]; then
    # turn on colors
    CLICOLOR=1
    # 0 a - black   , -------------------- DIR
    # 1 b - red     | ,------------------- SYM_LINK
    # 2 c - green   | | ,----------------- SOCKET
    # 3 d - yellow  | | | ,--------------- PIPE
    # 4 e - blue    | | | | ,------------- EXE
    # 5 f - magenta | | | | | ,----------- BLOCK_SP
    # 6 g - cyan    | | | | | | ,--------- CHAR_SP
    # 7 h - gray    | | | | | | | ,------- EXE_SUID
    #   x - default | | | | | | | | ,----- EXE_GUID
    # fore/back     | | | | | | | | | ,--- DIR_STICKY
    # upper = bold  | | | | | | | | | | ,- DIR_WO_STICKY
    LSCOLORS=ExGxFxdaCxdadahbadheec
    # LSCOLORS=BxBxhxDxfxhxhxhxhxcxcx
fi

# History 
HISTFILE=~/.bash_history
SAVEHIST=10000
HISTSIZE=10000

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
#if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
#	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
#	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
#elif [[ -f /usr/local/etc/bash_completion ]]; then
if [[ -f /usr/local/etc/bash_completion ]]; then
    source /usr/local/etc/bash_completion
fi


# Load other configurations
if [[ -f ~/.aliases ]]; then
    source ~/.aliases
fi

if [[ -f ~/.functions ]]; then
    source ~/.functions
fi

if [[ -f ~/.api-tokens ]]; then
    source ~/.api-tokens
fi

# enable igo aliases
if [[ -f ~/.igo_aliases ]]; then
    source ~/.igo_aliases
fi

# enable git completion
if [[ -f ~/.git-completion ]]; then
    source ~/.git-completion
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# old dotfile stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider

# paranoid nvm use
alias cd='cdnvm'
nvm use
