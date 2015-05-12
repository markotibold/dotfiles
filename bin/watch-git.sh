#!/bin/bash
# pip me into gource like so:

# ./watch.sh| gource --log-format git -

pushd $1

SINCE='1971-01-01'

# initial gource call (fills up ui)
git --no-pager log $word --pretty=format:user:%aN%n%at --reverse --raw --encoding=UTF-8 --all --no-renames --after=$SINCE


function eval_changes {
    changes="$(git fetch 2>&1 )"
    if [[ "${changes}" == "" ]]; then
        return
    else
        # loop over changes
        for word in $changes; do 
            if [[ $word =~ ".." ]]; then
                git --no-pager log $word --pretty=format:user:%aN%n%at --reverse --raw --encoding=UTF-8 --all --no-renames --after=$SINCE
            fi
        done
    fi
}

while true; do
   eval_changes
   sleep 15
done

