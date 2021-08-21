alias dcc='gcc -g3 -fsanitize=address'
alias trash='~/goinfre'
alias val='valgrind --leak-check=full --error-limit=no'
alias ls=lsd
alias ah86='arch -x86_64'
alias 42='~/42-cursus'
alias fdf='~/42-cursus/fdf'
alias vi=nvim
alias vim=nvim

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MAIL='yongjule@42student.42seoul.kr'
export ZSH="/Users/jun/.oh-my-zsh"
plugins=(zsh-autosuggestions
			git
		zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source ~/.p10k.zsh


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
