source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

for file in ~/.{aliases,exports}; do
    [ -r "$file" ] && source "$file"
done
unset file

antigen bundle git
antigen bundle ruby
antigen bundle sudo
antigen bundle command-not-found
antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle history-substring-search
antigen bundle chrissicool/zsh-256color
antigen bundle tomsquest/nvm-auto-use.zsh

antigen theme denysdovhan/spaceship-prompt

antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
