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
        state="${green}"
    elif [[ ${git_status} =~ "Changes to be committed" ]]; then
        state="${yellow}"
    elif [[ ${git_status} =~ "no changes added to commit" ]]; then
        state="${black}"
    else
        state="${red}"
    fi

    # Set arrow icon based on status against remote.
    remote_pattern="Your branch is (.*)"
    if [[ ${git_status} =~ ${remote_pattern} ]]; then
        if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
            git_remote="↑"
        elif [[ ${BASH_REMATCH[1]} == "up-to-date" ]]; then
            git_remote=""
        elif [[ ${BASH_REMATCH[1]} == "behind" ]]; then
            git_remote="↓"
        fi
    else
        git_remote=""
    fi
    diverge_pattern="Your branch and (.*) have diverged"
    if [[ ${git_status} =~ ${diverge_pattern} ]]; then
        git_remote="↕"
    fi

    # Get the name of the branch.
    branch_pattern="On branch ([^${IFS}]*)"
    if [[ ${git_status} =~ ${branch_pattern} ]]; then
        branch=${BASH_REMATCH[1]}
    fi

    # Any active stashes?
    git_stash_status="$(git stash list 2> /dev/null)"
    if [[ "$git_stash_status" != "" ]]; then
        git_stash_status=${blue}"[S]"
    fi

    # Set the final branch string.
    BRANCH="${state}[git ${git_remote}]${git_stash_status}\n${cyan}${branch}${reset} "
}

function eval_hg_repo {
    hg_status="$(hg status 2> /dev/null)"
    hg_branch="$(hg branch 2> /dev/null)"
    hg_phase="$(hg phase -r-1 2> /dev/null)"

    # Clean
    if [[ "${hg_status}" == "" ]]; then
        state="${green}"
    # Modified, Added or Removed
    elif [[ "${hg_status}" =~ ^[M|A|R] ]]; then
        state="${yellow}"
    else
    # Dirty
        state="${red}"
    fi

    # Any active shelves?
    hg_shelve_status="$(hg shelve -l 2> /dev/null)"
    if [[ "$hg_shelve_status" != "" ]]; then
        hg_shelve_status=${blue}"[S]"
    fi

    # Set arrow icon based on status against remote.
    hg_draft_pattern="draft$"
    if [[ ${hg_phase} =~ ${hg_draft_pattern} ]]; then
            hg_remote="↑"
    else
        hg_remote=""
    fi
}

# Determine the branch/state information for this hg repository.
function set_hg_branch {
    eval_hg_repo
    # Set the final branch string.
    BRANCH="${state}[hg ${hg_branch}]${hg_remote} ${hg_shelve_status}${reset} "
}

# Determine active Python virtualenv details.
function set_virtualenv () {
    if test -z "$VIRTUAL_ENV" ; then
        PYTHON_VIRTUALENV=""
    else
        PYTHON_VIRTUALENV="${cyan}[`basename \"$VIRTUAL_ENV\"`]${reset} "
    fi
}

