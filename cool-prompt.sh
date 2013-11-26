#!/bin/bash
#
# DESCRIPTION:
#
#   Set the bash prompt according to:
#    * the active virtualenv
#    * the branch/status of the current git repository
#    * the return value of the previous command
#
# LINEAGE:
#
#   Based on work by woods and insin
#
#   https://gist.github.com/31967
## Detect whether the current directory is a git repository.

function is_git_repository {
    git branch > /dev/null 2>&1
}

# Detect whether the current directory is a hg repository.
function is_hg_repository {
    hg branch > /dev/null 2>&1
}

# Determine the branch/state information for this git repository.
function set_git_branch {
    # Capture the output of the "git status" command.
    git_status="$(git status 2> /dev/null)"

    # Set color based on clean/staged/dirty.
    if [[ ${git_status} =~ "working directory clean" ]]; then
        state="${GREEN}"
    elif [[ ${git_status} =~ "Changes to be committed" ]]; then
        state="${YELLOW}"
    else
        state="${RED}"
    fi

    # Set arrow icon based on status against remote.
    remote_pattern="# Your branch is (.*)"
    if [[ ${git_status} =~ ${remote_pattern} ]]; then
        if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
            git_remote="↓"
        else
            git_remote="↑"
        fi
    else
        git_remote=""
    fi
    diverge_pattern="# Your branch and (.*) have diverged"
    if [[ ${git_status} =~ ${diverge_pattern} ]]; then
        git_remote="↕"
    fi

    # Get the name of the branch.
    branch_pattern="^# On branch ([^${IFS}]*)"
    if [[ ${git_status} =~ ${branch_pattern} ]]; then
        branch=${BASH_REMATCH[1]}
    fi

    # Set the final branch string.
    BRANCH="${state}[git ${git_branch}]${git_remote}${COLOR_NONE} "
}

# Determine the branch/state information for this hg repository.
function set_hg_branch {
    # Capture the output of the "hg status" command.
    hg_status="$(hg status 2> /dev/null)"
    hg_branch="$(hg branch 2> /dev/null)"
    hg_phase="$(hg phase -r-1 2> /dev/null)"

    # Clean
    if [[ "${hg_status}" == "" ]]; then
        state="${GREEN}"
    # Modified, Added or Removed
    elif [[ "${hg_status}" =~ ^[M|A|R] ]]; then
        state="${YELLOW}"
    else
        state="${RED}"
    fi

    hg_shelve_status="$(hg shelve -l 2> /dev/null)"
    if [[ "$hg_shelve_status" != "" ]]; then
        hg_shelve_status=${BLUE}"[S]"
    fi
    # Set arrow icon based on status against remote.
    hg_draft_pattern="draft$"
    if [[ ${hg_phase} =~ ${hg_draft_pattern} ]]; then
            hg_remote="↑"
    else
        hg_remote=""
    fi
    #diverge_pattern="# Your branch and (.*) have diverged"
    #if [[ ${hg_status} =~ ${diverge_pattern} ]]; then
        #remote="↕"
    #fi

    # Set the final branch string.
    BRANCH="${state}[hg ${hg_branch}]${hg_remote} ${hg_shelve_status}${COLOR_NONE} "
}

# Determine active Python virtualenv details.
function set_virtualenv () {
    if test -z "$VIRTUAL_ENV" ; then
        PYTHON_VIRTUALENV=""
    else
        PYTHON_VIRTUALENV="${CYAN}[`basename \"$VIRTUAL_ENV\"`]${COLOR_NONE} "
    fi
}

