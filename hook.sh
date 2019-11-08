#!/bin/sh
# prepare-commit-msg git hook

# TODO DESCRIPTION

# Get current branch
current_branch() { git rev-parse --abbrev-ref HEAD; }
# Remove "folder" prefixes
without_prefix() { while read x; do echo "${x##*/}"; done; }
# Parse issue number from branch name without prefixes
parse_issue() { while read x; do echo "${x/%-*/}"; done; }

# Get issue from current branch
get_issue() { current_branch | without_prefix | parse_issue; }

hook() {
    COMMIT_MSG_FILE=$1
    git interpret-trailers --trailer "Related: #$(get_issue)" --in-place $COMMIT_MSG_FILE
    exit 0
}

if [ "${1}" != "--source-only" ]; then
    hook "${@}"
fi
