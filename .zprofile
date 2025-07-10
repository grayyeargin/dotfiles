# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,zsh_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
setopt NO_CASE_GLOB

# Append to the history file, rather than overwriting it
setopt APPEND_HISTORY

# Autocorrect typos in path names when using `cd`
setopt CORRECT

# Enable auto-cd (you can type a directory name and it will `cd` into it)
setopt AUTO_CD

# Enable recursive globbing, e.g., **/*.txt
setopt GLOB_STAR_SHORT

# Add tab completion (Zsh uses a different system than Bash)
autoload -Uz compinit
compinit

# Git completion (Zsh has native support, or use oh-my-zsh/git plugin if using a framework)
# You can also manually source Git completions if needed:
# source /path/to/git-completion.zsh (optional)

# SSH host autocomplete based on ~/.ssh/config, ignoring wildcards
if [[ -f ~/.ssh/config ]]; then
  zstyle ':completion:*:*:ssh:*' hosts \
    ${${(f)"$(grep '^Host ' ~/.ssh/config | grep -v '[*?]' | cut -d ' ' -f2-)"}}
fi

# You can write Zsh-native completion rules using `compdef`, but they're usually handled by plugins or compinit
