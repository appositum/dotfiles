# alias inst='sudo apt install'
# alias remove='sudo apt remove'
# alias update='sudo apt update'
# alias upgrade='sudo apt upgrade'

# arch
alias inst='yay -S'
alias update='yay'
alias remove='yay -Rns'

alias ls='eza --icons=always'

alias tarxz='tar xvf'
alias targz='tar zxvf'
alias tarbz2='tar jxvf'

# apparently it's only "batcat" on debian
if test -e /usr/bin/batcat
  alias bat='batcat --theme base16'
end

alias tmuxl='tmux list-sessions'
alias tmuxk='tmux kill-session -t'
alias tmuxs='tmux switch -t'

alias gita='git add -A'
alias gits='git status'
alias gitd='git diff'
alias gitl='git log --graph'
alias gitcom='git commit'
alias gitch='git checkout'
alias gitb='git branch'
alias gitc='git checkout'
alias gitst='git stash'
alias gitp='git pull'
alias gitP='git push'

# count lines in a directory based on a file name match
function cl -a match dir
  find $dir -name $match | xargs wc -l
end

function fish_greeting
  # set last (last -R -F -1 $USER | tail -1)
  # set login_time (echo $last | awk '{print $3,$4,$5,$6,$7}')
  # echo -e "Last login: $login_time\n          .                      \n       . '                       \n   . '                           \n  .                              \n .                               \n .         .' '.            __   \n  .        .   .           (__\_ \n   .         .         . -{{_(|8)\n     ' .  . ' ' .  . '     (__/  \n" | lolcat -p 0.7
  echo -e "          .                      \n       . '                       \n   . '                           \n  .                              \n .                               \n .         .' '.            __   \n  .        .   .           (__\\ \n   .         .         . -{{_(|8)\n     ' .  . ' ' .  . '     (__/  \n" | lolcat -p 0.7
end

function fish_title
  set os (cat /etc/*-release | sed -En 's/^NAME="(.*)"/\1/p')

  if test -e hostname
    set h (hostname)
  else
    set h (hostnamectl hostname)
  end

  set d (dirs)

  echo "$d ❯ $os ❯ $h"
end

set red "\033[0;31m"
set green "\033[0;32m"
set yellow "\033[0;33m"
set blue "\033[0;34m"
set purple "\033[01;35m"
set cyan "\033[01;36m"
set white "\033[01;37m"
set white_thin "\033[0;37m"
set reset "\033[00m"

function fish_right_prompt
end

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_status (git status -s)

  set -l unstaged_add (git status -s | grep '^??')
  set -l unstaged_del (git status -s | grep '^ D')
  set -l unstaged_mod (git status -s | grep '^ M')
  set -l half_staged_mod (git status -s | grep '^MM')

  set -l staged_add (git status -s | grep '^A')
  set -l staged_del (git status -s | grep '^D')
  set -l staged_mod (git status -s | grep '^M')
  set -l rename (git status -s | grep '^R')

  set -l icon_unstaged_add ""
  set -l icon_unstaged_del ""
  set -l icon_unstaged_mod ""

  set -l icon_staged_add ""
  set -l icon_staged_del ""
  set -l icon_staged_mod ""
  set -l icon_ren ""

  if test -n "$unstaged_add"
    set icon_unstaged_add (printf "\uf0fe ")
  end

  if test -n "$unstaged_del"
    set icon_unstaged_del (printf "\uf146 ")
  end

  if test -n "$unstaged_mod"; or test -n "$half_staged_mod"
    set icon_unstaged_mod (printf "\uea71 ")
  end

  if test -n "$staged_add"
    set icon_staged_add (printf "\uf0fe ")
  end

  if test -n "$staged_del"
    set icon_staged_del (printf "\uf146 ")
  end

  if test -n "$staged_mod"
    set icon_staged_mod (printf "\uea71 ")
  end

  if test -n "$rename"
    set icon_ren (printf "\uf443 ")
  end

  set -l unstaged (set_color red; printf '%s%s%s' (echo -e $icon_unstaged_mod) (echo -e $icon_unstaged_add) (echo -e $icon_unstaged_del); set_color white)
  set -l staged (set_color green; printf '%s%s%s%s' (echo -e $icon_staged_mod) (echo -e $icon_staged_add) (echo -e $icon_staged_del) (echo -e $icon_ren); set_color white)

  if test -n "$git_status"
    printf '%s%s%s %s%s' (echo -e $yellow) (echo -e $branch) (echo -e $white) (echo -e $unstaged) (echo -e $staged)
  else
    printf '%s%s%s' (echo -e $green) (echo -e $branch) (echo -e $white)
  end
end

function fish_prompt
  set -l last_status $status
  set -l git_fork (set_color cyan; printf '\uf126')
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)
  set -l prompt_pwd (printf '%s%s' (echo -e $white) (prompt_pwd))
  set -l prompt_cmd

  if [ $last_status -ne 0 ]
    set prompt_cmd (printf ' %s❯ %s' (echo -e $red) (echo -e $reset))
  else
    set prompt_cmd (printf ' %s❯ %s' (echo -e $purple) (echo -e $reset))
  end

  if test -n "$git_dir"
    printf ' %s %s %s\n%s' (echo $prompt_pwd) (echo $git_fork) (parse_git_branch) (echo $prompt_cmd)
  else
    printf ' %s\n%s' (echo $prompt_pwd) (echo $prompt_cmd)
  end
end

eval (opam env)

set -gx PATH "$HOME/.local/share/bin:$PATH"

set -gx PATH "$HOME/.cargo/bin:$PATH"
set -gx PATH "$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

set -x GPG_TTY (tty)

# git commit
set -x VISUAL "vim"

# tmux
# if status is-interactive
# and not set -q TMUX
#     exec tmux -u
# end

# ssh agent
# if test -z (pgrep ssh-agent | string collect)
#     eval (ssh-agent -c)
#     set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
#     set -Ux SSH_AGENT_PID $SSH_AGENT_PID
# end

set -gx PATH "$HOME/.local/share/nvim/mason/bin:$PATH"
set -gx PATH "$HOME/.pack/bin:$HOME/.idris2/bin:$PATH"

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME; set -gx PATH $HOME/.cabal/bin $PATH /home/appositum/.ghcup/bin # ghcup-env

# LEAN lang
set -gx PATH "$HOME/.elan/bin:$PATH"
