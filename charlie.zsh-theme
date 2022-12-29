# https://github.com/jackharrisonsherlock/common

# Prompt symbol
COMMON_PROMPT_SYMBOL="❯"

# Colors
CHARLIE_COLORS_MACHINE=brown
CHARLIE_COLORS_HOST_ME=green
CHARLIE_COLORS_HOST_AWS_VAULT=yellow
CHARLIE_COLORS_CURRENT_DIR=yellow
CHARLIE_COLORS_RETURN_STATUS_TRUE=green
CHARLIE_COLORS_RETURN_STATUS_FALSE=red
CHARLIE_COLORS_GIT_STATUS_DEFAULT=green
CHARLIE_COLORS_GIT_STATUS_STAGED=red
CHARLIE_COLORS_GIT_STATUS_UNSTAGED=yellow
CHARLIE_COLORS_GIT_PROMPT_SHA=green
CHARLIE_COLORS_BG_JOBS=brown

# Left Prompt
 PROMPT='$(common_host)$(common_current_dir)$(common_bg_jobs)$(common_return_status)'

# Right Prompt
 RPROMPT='$(common_git_status)'

# Enable redrawing of prompt variables
 setopt promptsubst

# Prompt with current SHA
# PROMPT='$(common_host)$(common_current_dir)$(common_bg_jobs)$(common_return_status)'
# RPROMPT='$(common_git_status) $(git_prompt_short_sha)'

# Host
common_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    me="%{$fg[$CHARLIE_COLORS_MACHINE]%}%n @ %m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[$CHARLIE_COLORS_HOST_ME]%}$me%{$reset_color%}:"
  fi
  if [[ $AWS_VAULT ]]; then
    echo "%{$fg[$CHARLIE_COLORS_HOST_AWS_VAULT]%}$AWS_VAULT%{$reset_color%} "
  fi
}

# Current directory
common_current_dir() {
  NEWLINE=$'\n'
  echo -n "%{$fg[$CHARLIE_COLORS_CURRENT_DIR]%}[%c] "
  echo "${NEWLINE} "
}

# Prompt symbol
common_return_status() {
  echo -n "%(?.%F{$CHARLIE_COLORS_RETURN_STATUS_TRUE}.%F{$CHARLIE_COLORS_RETURN_STATUS_FALSE})$COMMON_PROMPT_SYMBOL%f "
}

# Git status
common_git_status() {
    local message=""
    local message_color="%F{$CHARLIE_COLORS_GIT_STATUS_DEFAULT}"

    # https://git-scm.com/docs/git-status#_short_format
    local staged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU]")
    local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU? ][MADRCU?]")

    if [[ -n ${staged} ]]; then
        message_color="%F{$CHARLIE_COLORS_GIT_STATUS_STAGED}"
    elif [[ -n ${unstaged} ]]; then
        message_color="%F{$CHARLIE_COLORS_GIT_STATUS_UNSTAGED}"
    fi

    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n ${branch} ]]; then
        message+="${message_color}${branch}%f"
    fi

    echo -n "${message}"
}

# Git prompt SHA
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{%F{$CHARLIE_COLORS_GIT_PROMPT_SHA}%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%} "

# Background Jobs
common_bg_jobs() {
  bg_status="%{$fg[$CHARLIE_COLORS_BG_JOBS]%}%(1j.↓%j .)"
  echo -n $bg_status
}
