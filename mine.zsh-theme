RED="%{$fg[red]%}"
GREEN="%{$fg[green]%}"
CYAN="%{$fg[cyan]%}"
RESET="%{$reset_color%}"

function my_prompt() {
	# if in git directory
	if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
		#check whether dirty or clean
		if [ -z "$(git status --porcelain)" ]; then
			PROMPT_COLOR=$GREEN
		else
			PROMPT_COLOR=$RED
		fi
	else
		PROMPT_COLOR=$CYAN
	fi
	echo "$PROMPT_COLOR>$RESET "
}
		
PROMPT='$(my_prompt)'
RPROMPT='$(git_prompt_info) %3~'

ZSH_THEME_GIT_PROMPT_PREFIX="(branch: "
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="$RED✗$RESET"
ZSH_THEME_GIT_PROMPT_CLEAN="$GREEN✓$RESET"
