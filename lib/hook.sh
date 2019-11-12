#!/bin/sh
# tracker-hook
#
# Tries to detect current feature's tracker reference from the current Git branch.
# If succesfull, prepares the reference in the commit message's trailers.
#
# Intended `prepare-commit-msg` git hook
#
# https://github.com/grissius/tracker-hook
# version: 0.1.0
# author: Jaroslav Šmolík
# license: MIT
#

# Get current branch
current_branch() { git rev-parse --abbrev-ref HEAD; }

# Parse issue number from branch name
parse_issue() {
    while read x; do
        NUMERAL=$(echo $x | grep -o -E '(GH-)?[0-9]+' | head -1)
        [[ $NUMERAL ]] && echo "$NUMERAL" && return
    done
}

# Get issue from current branch
get_issue() { current_branch | parse_issue; }

hook() {
    COMMIT_MSG_FILE=$1
    ISSUE="$(get_issue)"
    [[ $ISSUE ]] && git interpret-trailers --trailer "Related: #$ISSUE" --in-place $COMMIT_MSG_FILE
    exit 0
}

if [ "${1}" != "--source-only" ]; then
    hook "${@}"
fi
