HISTFILE=${HOME}/.zsh_history
SAVEHIST=10000

# install Zinit
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  curl -L https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh
fi

source $HOME/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light romkatv/powerlevel10k
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

bindkey "\ef" emacs-forward-word

if type "xsel" >/dev/null 2>&1; then
  alias pbc="xsel --clipboard --input"
  alias pbp="xsel --clipboard --output"
fi

if [[ -f $HOME/.p10k.zsh ]]; then
  source $HOME/.p10k.zsh
fi

if [[ -f $HOME/.fzf.zsh ]]; then
  source $HOME/.fzf.zsh
fi
