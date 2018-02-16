# Package management
alias inst='sudo pacman -S'
alias remove='sudo pacman -R'
alias update='sudo pacman -Syu'

alias insty='yaourt -S'
alias removy='yaourt -R'

# tar management
alias tarxz='tar xvf'
alias targz='tar zxvf'
alias tarbz2='tar jxvf'

alias pip3='sudo python3 -m pip'

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

# Fix atom flickering screen
alias atom='atom . --disable-gpu'

function fish_greeting
end

set REPOS /home/$USER/Documents/gitrepos

# Colors for the prompt
set blue "\033[01;34m"
set red "\033[01;31m"
set white "\033[01;37m"
set white_thin "\033[0;37m"
set green "\033[01;32m"
set cyan "\033[01;36m"
set reset "\033[00m"

## Brackets needed around non-printable characters in PS1
#set ps1_blue '\['"$blue"'\]'
#set ps1_red '\['"$red"'\]'
#set ps1_green '\['"$green"'\]'
#set ps1_white '\['"$white"'\]'
#set ps1_cyan '\['"$cyan"'\]'
#set ps1_reset '\['"$reset"'\]'
#
#function parse_git_branch
#  set -l gitstatus (git status 2> /dev/null)
#  if [ (echo $gitstatus | grep "Changes to be committed") != "" ]
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1***)/'
#  else if [ (echo $gitstatus | grep "Changes not staged for commit") != "" ]
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1**)/'
#  else if [ (echo $gitstatus | grep "Untracked") != "" ]
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1*)/'
#  else if [ (echo $gitstatus | grep "nothing to commit") != "" ]
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#  else
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1?)/'
#  end
#end
#
## Echo a non-printing color character depending on whether or not the current git branch is the master
## Does NOT print the branch name
## Use the parse_git_branch() function for that.
#function parse_git_branch_color
#  set br (parse_git_branch)
#  if [ $br = "(master)" ]; or [ $br = "(master*)" ]; or [ $br = "(master**)" ]; or [ $br = "(master***)" ]
#    echo -e "$blue"
#  else
#    echo -e "$green"
#  end
#end
#
#
#function fish_prompt
#  if [ (id -u) != 0 ]
#    printf "$white%s%s%s$cyan λ $reset" (basename $PWD) (parse_git_branch_color) (parse_git_branch)
#  else
#    printf "$redλ $white%s$white#$reset " (basename $PWD) (parse_git_branch_color) (parse_git_branch)
#  end
#end

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
    printf '%s%s %s %s %sλ %s' (echo -e $white) (basename (prompt_pwd)) (set fork (printf '\ue0a0'); echo -e $cyan$fork) (parse_git_branch) (echo -e $cyan) (echo -e $reset)
    #printf '%s λ %s%s%s %s %s> ' (basename $PWD) (set_color $fish_color_cwd) (set_color normal) (set fork (printf '\ue0a0'); echo $fork) (parse_git_branch)
  else
    printf '%s%s %sλ %s' (echo -e $white) (basename (prompt_pwd)) (echo -e $cyan) (echo -e $reset)
    #printf '%s λ %s%s%s' (basename $PWD) (set_color $fish_color_cwd) (set_color normal)
  end
end
