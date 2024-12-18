
# git aliases
alias gs='git status'
alias gp='git push'
alias gb='git branch -a'
alias gad='git add .'
alias gcd="git commit -a -m '.'"
alias gd='git diff'


# zsh aliases
alias rc='nvim ~/.zshrc'
alias rcs='source ~/.zshrc'

# common
alias cl='clear'
alias l='ls -al'

# docker
alias di='docker images'
alias dc='docker container ls -a'

# ros2
if [ -f /opt/ros/humble/setup.zsh ]; then
  source /opt/ros/humble/setup.zsh
  export ROS_WS=~/dev/ros2/ros2_ws
  alias b='cd $ROS_WS && colcon build --symlink-install && source install/setup.zsh'
  alias s='cd $ROS_WS && source install/setup.zsh'
fi
