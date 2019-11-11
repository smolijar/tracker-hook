#!/bin/sh
# prepare-commit-msg git hook

# TODO DESCRIPTION

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
