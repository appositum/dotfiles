# Package/system management
alias inst='sudo apt install'
alias remove='sudo apt remove'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias reboot='sudo systemctl reboot'

# tar management
alias tarxz='tar xvf'
alias targz='tar zxvf'
alias tarbz2='tar jxvf'

# Tools
alias geotrack='curl ipinfo.io/$IP'

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
  set last (last -R -F -1 $USER | head -1)
  set login_time (echo $last | awk '{print $3,$4,$5,$6,$7}')
  set quote (fortune)
  echo -e "Last login: $login_time\n\n$quote" | cowsay | lolcat
end

function fish_title
  set h (hostname)
  set p (dirs)

  echo "$h ❯ $p"
end


# Colors for the prompt
set red "\033[0;31m"
set yellow "\033[0;33m"
set blue "\033[0;34m"
set purple "\033[0;35m"
set white "\033[01;37m"
set white_thin "\033[0;37m"
set green "\033[0;32m"
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
      printf '%s%s %s %s %s❯%s❯%s❯ %s' (echo -e $white) (basename (prompt_pwd)) (set fork (printf '\ue0a0'); echo -e $cyan$fork) (parse_git_branch) (echo -e $red) (echo -e $yellow) (echo -e $green) (echo -e $reset)
    else
      printf '%s%s %s %s %s❯%s❯%s❯%s❯ %s' (echo -e $white) (basename (prompt_pwd)) (set fork (printf '\ue0a0'); echo -e $cyan$fork) (parse_git_branch) (echo -e $red) (echo -e $yellow) (echo -e $green) (echo -e $purple) (echo -e $reset)
    end

  else
    if [ (id -u) = 0 ]
      printf '%s%s %s❯%s❯%s❯ %s' (echo -e $white) (basename (prompt_pwd)) (echo -e $red) (echo -e $yellow) (echo -e $green) (echo -e $reset)
    else
      printf '%s%s %s❯%s❯%s❯%s❯ %s' (echo -e $white) (basename (prompt_pwd)) (echo -e $red) (echo -e $yellow) (echo -e $green) (echo -e $purple) (echo -e $reset)
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
# set -x NIX_PATH "nixpkgs=/home/eddie/.nix-defexpr/channels/nixpkgs"

eval (opam env)

# yarn stuff to path
set -gx PATH /home/eddie/.yarn/bin $PATH

set -x XKB_DEFAULT_LAYOUT br
set -x XKB_DEFAULT_OPTIONS compose:ralt,ctrl:nocaps
