# == BEGIN KANAGAWA THEME ==

# Kanagawa Fish shell theme
# A template was taken and modified from Tokyonight:
# https://github.com/folke/tokyonight.nvim/blob/main/extras/fish_tokyonight_night.fish
set -l foreground DCD7BA normal
set -l selection 2D4F67 brcyan
set -l comment 727169 brblack
set -l red C34043 red
set -l orange FF9E64 brred
set -l yellow C0A36E yellow
set -l green 76946A green
set -l purple 957FB8 magenta
set -l cyan 7AA89F cyan
set -l pink D27E99 brmagenta

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

# ==   END KANAGAWA THEME ==

# alias inst='sudo apt install'
# alias remove='sudo apt remove'
# alias update='sudo apt update'
# alias upgrade='sudo apt upgrade'

# arch
alias inst='yay -S'
alias update='yay'
alias remove='yay -Rns'

alias ls='eza --icons=always -s type'

alias tarxz='tar xvf'
alias targz='tar zxvf'
alias tarbz2='tar jxvf'

alias icat='kitty icat'

# apparently it's only "batcat" on debian
if test -e /usr/bin/batcat
  alias bat='batcat --theme base16 --decorations=never'
else
  alias bat='bat --theme base16 --decorations=never'
end

function json
  $argv | python -m json.tool | bat -l json --decorations=never --paging=never
end

function req -a method url data
  switch $method
    case 'get'
      curl -sS -X $method $url
    case 'post'
      curl -sS --header "Content-Type: application/json" -X $method $url -d $data
    case 'put'
      curl -sS --header "Content-Type: application/json" -X $method $url -d $data
    case 'patch'
      curl -sS --header "Content-Type: application/json" -X $method $url -d $data
    case 'delete'
      curl -sS -X $method $url
  end
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
  # set os (cat /etc/*-release | sed -En 's/^NAME="(.*)"/\1/p')
  #
  # if test -e hostname
  #   set h (hostname)
  # else
  #   set h (hostnamectl hostname)
  # end

  set d (dirs)

  echo "$d"
end

# set red "\033[01;31m"
# set green "\033[0;32m"
# set yellow "\033[0;33m"
# set blue "\033[0;34m"
# set purple "\033[01;35m"
# set cyan "\033[01;36m"
# set white "\033[01;37m"
# set white_thin "\033[0;37m"
# set reset "\033[00m"

function fish_right_prompt
  printf '%s' (set_color brblack; date +'%H:%M:%S'; set_color reset)
end

function parse_git_branch
  set -l branch_name (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l branch_rebasing (echo $branch_name | grep -e '^(no branch, rebasing')
  set -l branch_detached (echo $branch_name | grep -e '^(HEAD detached')
  set -l branch_conflict (git status 2> /dev/null | sed -n '2p' | grep -e 'You have unmerged paths.')
  set -l branch_merging (git status 2> /dev/null | sed -n '2p' | grep -e 'All conflicts fixed but you are still merging.')

  set -l git_status (git status -s)

  set -l unstaged_add (git status -s | grep '^??')
  set -l unstaged_del (git status -s | grep '^ D')
  set -l unstaged_mod (git status -s | grep '^ M')
  set -l half_staged_mod (git status -s | grep '^MM')

  set -l staged_add (git status -s | grep '^A')
  set -l staged_del (git status -s | grep '^D')
  set -l staged_mod (git status -s | grep '^M')
  set -l rename (git status -s | grep '^R')

  set -l unmerged_paths (git status -s | grep '^UU')

  set -l icon_unstaged_add ""
  set -l icon_unstaged_del ""
  set -l icon_unstaged_mod ""

  set -l icon_staged_add ""
  set -l icon_staged_del ""
  set -l icon_staged_mod ""
  set -l icon_ren ""

  set -l icon_unmerged_paths ""

  if test -n "$unstaged_add"
    set icon_unstaged_add (printf "\uf0fe ")
  end

  if test -n "$unstaged_del"
    set icon_unstaged_del (printf "\uf146 ")
  end

  if test -n "$unstaged_mod"; or test -n "$half_staged_mod"
    set icon_unstaged_mod (printf "\uf0c8 ")
  end

  if test -n "$staged_add"
    set icon_staged_add (printf "\uf0fe ")
  end

  if test -n "$staged_del"
    set icon_staged_del (printf "\uf146 ")
  end

  if test -n "$staged_mod"
    set icon_staged_mod (printf "\uf0c8 ")
  end

  if test -n "$rename"
    set icon_ren (printf "\uf443 ")
  end

  if test -n "$unmerged_paths"
    set icon_unmerged_paths (printf "\uf440 ")
  end

  set -l unstaged (set_color red; printf '%s%s%s%s' (echo -e $icon_unmerged_paths) (echo -e $icon_unstaged_mod) (echo -e $icon_unstaged_add) (echo -e $icon_unstaged_del); set_color white)
  set -l staged (set_color green; printf '%s%s%s%s' (echo -e $icon_staged_mod) (echo -e $icon_staged_add) (echo -e $icon_staged_del) (echo -e $icon_ren); set_color white)

  set -l git_fork (set_color cyan; printf '\uf126')

  if test -n "$branch_rebasing"
    set git_fork (set_color cyan; printf '\ue727')
  else if test -n "$branch_detached"
    set git_fork (set_color cyan; printf '\ueafc')
  else if test -n "$branch_conflict"
    set git_fork (set_color cyan; printf '\ue728')
  else if test -n "$branch_merging"
    set git_fork (set_color cyan; printf '\ue726')
  end

  printf '%s ' (echo $git_fork) # default icon
  if test -n "$git_status"
    printf '%s%s%s %s%s' (set_color yellow) (echo -e $branch_name) (set_color white) (echo -e $unstaged) (echo -e $staged)
  else
    printf '%s%s%s' (set_color green) (echo -e $branch_name) (set_color white)
  end
end

# fish :)
# ⋊>
# ⧕>
# ⋊›
# ⧕›
# ❯

function fish_prompt
  set -l last_status $status
  set -l git_fork (set_color cyan; printf '\uf126')
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)
  set -l prompt_pwd (printf '%s%s' (set_color white) (prompt_pwd))
  set -l prompt_cmd

  if [ $last_status -ne 0 ]
    set prompt_cmd (printf ' %sλ %s' (set_color red) (set_color reset))
  else
    set prompt_cmd (printf ' %sλ %s' (set_color purple) (set_color reset))
  end

  if test -n "$git_dir"
    printf ' %s %s\n%s' (echo $prompt_pwd) (parse_git_branch) (echo $prompt_cmd)
  else
    printf ' %s\n%s' (echo $prompt_pwd) (echo $prompt_cmd)
  end
end

set -gx PATH "$HOME/.local/share/bin:$PATH"

set -gx PATH "$HOME/.cargo/bin:$PATH"
set -gx PATH "$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

set -x GPG_TTY (tty)

# git commit
set -x VISUAL vim

# tmux
# if status is-interactive
# and not set -q TMUX
#   exec tmux -u
# end
#
# tmux source ~/.tmux.conf

# ssh agent
# if test -z (pgrep ssh-agent | string collect)
#   eval (ssh-agent -c)
#   set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
#   set -Ux SSH_AGENT_PID $SSH_AGENT_PID
# end

set -gx PATH "$HOME/.local/share/nvim/mason/bin:$PATH"
set -gx PATH "$HOME/.pack/bin:$HOME/.idris2/bin:$PATH"

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $PATH $HOME/.ghcup/bin # ghcup-env

# LEAN lang
set -gx PATH "$HOME/.elan/bin:$PATH"

# swi-prolog
set -gx PATH "$HOME/.prolog/bin:$PATH"

# asdf
set -gx PATH "$HOME/.asdf/shims:$PATH"
