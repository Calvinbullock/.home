# My bash Prompt
# 	Taken from a reddit post that forked it from stevelosh.
# 	SET UP look for PS1="...." in .bashrc and add source ~/.bash/prompt_bash.sh
# 	Source - https://www.reddit.com/r/commandline/comments/zt6x9/what_are_your_favorite_custom_prompts/
# 	Source - http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
#        
### PS1 SETTINGS =======================================================

# catppuccin based colour theme
# TODO see if i can get these to work - curently this is all not valid
#export PS1_USER="\[$(tput setaf 250;167;231)\]" # Light Pink (#faa7e7)
#export PS1_PWD="\[$(tput bold; tput setaf 245;156;137)\]" # Matcha Latte (muted green) #a89c89
#export PS1_SYSTEM="\[$(tput bold; tput setaf 208;198;195)\]" # Lavender Cream (soft purple) #d0c6c3
#export ?="\[$(tput bold; tput setaf 232;192;201)\]" # Rose Quartz (light pink) #e8c0c9
#export ?="\[$(tput bold; tput setaf 156;196;224)\]" # Sky Blue (calm blue) #9cc4e0
#export ?="\[$(tput bold; tput setaf 229;192;153)\]" # Honey Latte (muted yellow) (#e5c099)
#export ?="\[$(tput bold; tput setaf 242;166;119)\]" # Peach Nectar (soft orange) (#f2a677)
#export ?="\[$(tput bold; tput setaf 152;202;220)\]" # Mint Ice Cream (pastel blue) (#98cadc)
#export ?="\[$(tput bold; tput setaf 140;193;208)\]" # Ocean Waves (calm blue) (#8cc1d0)
#export PS1_GIT="\[$(tput bold; tput setaf 241;226;210)\]" # Latte (cream) (#f1e2d2)
#export ?="\[$(tput bold; tput setaf 30;30;30)\]"    # Mocha (dark brown) (#1e1e2e)

# show more git info in PS1
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true

# colors
export PS1_USER="\[$(tput bold; tput setaf 5)\]"                    # magenta
export PS1_SYSTEM="\[$(tput bold; tput setaf 3)\]"                  # yellow
export PS1_BG_TEXT="\[$(tput bold; tput setaf 0)\]"                 # background text - grey
export PS1_PWD="\[$(tput setaf 4; tput setaf 38; tput setaf 2)\]"   # Miku Green
export PS1_GIT="\[$(tput setaf 4; tput setaf 4)\]"                  # blue
export PS1_WHITE="\[$(tput bold; tput setaf 7)\]"                   # white
export PS1_RESET="\[$(tput sgr0)\]"                                 # reset to default


PS1="\n${PS1_USER}\u ${PS1_BG_TEXT}at${PS1_SYSTEM} \h ${PS1_BG_TEXT}in${PS1_PWD} \w ${PS1_GIT}\${GIT_INFO}\n\`if [ \$? = 0 ]; then echo \[\e[32m\]-\>\[\e[0m\]; else echo \[\e[31m\]-\>\[\e[0m\]; fi\` ${PS1_RESET}"

# function to set PS1
function _bash_prompt(){
    # git info
    export GIT_INFO=$(git branch &>/dev/null && echo "$(__git_ps1 '%s')")
}

# call _bash_prompt() each time the prompt is refreshed
export PROMPT_COMMAND=_bash_prompt

