# Package management
alias inst='sudo apt install'
alias remove='sudo apt remove'
alias update='sudo apt update; sudo apt upgrade'

# tar management
alias tarxz='tar xvf'
alias targz='tar zxvf'
alias tarbz2='tar jxvf'

# Tools
alias harv='/tools/harv/theHarvester.py'
alias sqlmap='/tools/sqlmap/sqlmap.py'
alias caesar='/tools/caesar.py'
alias geotrack='curl ipinfo.io/$IP'
alias daysleft='/tools/daysleft.py'
alias proc='/tools/check_process.sh'
alias recmem='/tools/record_memusage.sh'

# Tmux shortcuts
alias tmuxl='tmux list-sessions'
alias tmuxk='tmux kill-session -t'
alias tmuxs='tmux switch -t'

# git shortcuts
alias gita='git add -A'
alias gits='git status'
alias gitd='git diff'
alias gitl='git log --graph'
alias gitcom='git commit'
alias gitc='git checkout'
alias gitb='git branch'

set REPOS /home/$USER/Documents/gitrepos

function fish_greeting
end

function fish_title
  set h (hostname)
  set p (dirs)

  echo "$h ∑ $p"
end


# Colors for the prompt
set blue "\033[01;34m"
set red "\033[01;31m"
set white "\033[01;37m"
set white_thin "\033[0;37m"
set green "\033[01;32m"
set cyan "\033[01;36m"
set reset "\033[00m"

set fish_git_dirty_color red
set fish_git_not_dirty_color green

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_status (git status -s)

  if test -n "$git_status"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
  end
end

function fish_prompt
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)
  if test -n "$git_dir"

    if [ (id -u) = 0 ]
      printf '%s%s %s %s %s∑ %s' (echo -e $white) (basename (prompt_pwd)) (set fork (printf '\ue0a0'); echo -e $cyan$fork) (parse_git_branch) (echo -e $red) (echo -e $reset)
    else
      printf '%s%s %s %s %s∑ %s' (echo -e $white) (basename (prompt_pwd)) (set fork (printf '\ue0a0'); echo -e $cyan$fork) (parse_git_branch) (echo -e $cyan) (echo -e $reset)
    end

  else

    if [ (id -u) = 0 ]
      printf '%s%s %s∑ %s' (echo -e $white) (basename (prompt_pwd)) (echo -e $red) (echo -e $reset)
    else
      printf '%s%s %s∑ %s' (echo -e $white) (basename (prompt_pwd)) (echo -e $cyan) (echo -e $reset)
    end

  end
end

# git commit
set -x VISUAL "vim"

# tmux
if status is-interactive
and not set -q TMUX
    exec tmux
end

# nix search location
set -x NIX_PATH "nixpkgs=/home/eddie/.nix-defexpr/channels/nixpkgs"

# initialize ocaml stuff
eval (opam config env)
