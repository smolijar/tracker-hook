#!/bin/sh
# tracker-hook
#
# Tries to detect current feature's tracker reference from the current Git branch.
# If successful, prepares the reference in the commit message's trailers.
#
# Intended `prepare-commit-msg` git hook
#
# https://github.com/grissius/tracker-hook
# version: 0.1.1
# author: Jaroslav Šmolík
# contributors: Sandra Tatarevićová
# license: MIT
#

# Get current branch
current_branch() {
    git rev-parse --abbrev-ref HEAD
}

# Parse issue number from branch name
parse_issue() {
    local branch_name=$1
    echo "$branch_name" | grep -o -E '([A-Z][A-Z0-9_]*-)?[0-9]+' | head -1
}

# Get issue from current branch
get_issue() {
    parse_issue "$(current_branch)"
}

hook() {
    COMMIT_MSG_FILE=$1
    ISSUE="$(get_issue)"
    [ -n "$ISSUE" ] && git interpret-trailers --trailer "Related: #$ISSUE" --in-place "$COMMIT_MSG_FILE"
    return 0
}

if [ "${1}" != "--source-only" ]; then
    hook "${@}"
fi
