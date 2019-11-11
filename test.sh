#!/bin/sh
. ./hook.sh --source-only

# Helper parser
to_issue() { echo $1 | parse_issue || echo NULL; }

# Parsing tests
test_numeral() {
    assertEquals 123 $(to_issue "feat/123-add-foo")
    assertEquals 6666 $(to_issue "backup/fix/6666-fix-foo")
    assertEquals 123 $(to_issue "123-ein-zwo")
    assertEquals 456 $(to_issue "fix/456-add-2-functions")
    assertEquals 550 $(to_issue "feat/550-add-missing-id")
    assertEquals 42 $(to_issue "42")
    assertEquals 666 $(to_issue "backup/fix/666-root-of-all-evol")
}

test_github() {
    assertEquals GH-2 $(to_issue "GH-2")
    assertEquals GH-456 $(to_issue "folder/#GH-456")
}

test_hash() {
    assertEquals 42 $(to_issue "jm/#42")
    assertEquals 21 $(to_issue "tracker:#21")
}

test_no_match() {
    assertEquals NULL $(to_issue "master")
    assertEquals NULL $(to_issue "feature/foobar-baz")
    assertEquals NULL $(to_issue "foo/bar")
}

# Hook tests

# Setup
setUp() {
    echo "Title" >MSG_BEFORE
    cat MSG_BEFORE >MSG_AFTER
}

tearDown() { rm -f MSG_BEFORE MSG_AFTER; }

# Current branch mock
current_branch() { echo "$ISSUE_MOCK"; }

# Hook tests
test_hook_missing_issue() {
    ISSUE_MOCK="master"
    $(hook MSG_AFTER)
    assertEquals SAME $(diff MSG_BEFORE MSG_AFTER &>/dev/null && echo SAME || echo DIFFERENT)
}

test_hook_found_issue() {
    ISSUE_MOCK="fix/123"
    $(hook MSG_AFTER)
    assertEquals DIFFERENT $(diff MSG_BEFORE MSG_AFTER &>/dev/null && echo SAME || echo DIFFERENT)
}

. ./shunit2
