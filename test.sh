#!/bin/sh
. ./hook.sh --source-only

test_without_prefix() {
    assertEquals $(echo "foo/bar/baz" | without_prefix) baz
}

test_parse_issue() {
    assertEquals $(echo "issue-a-b-c" | parse_issue) issue
}

to_issue() {
    echo $1 | without_prefix | parse_issue
}

test_1() {
    assertEquals $(to_issue "feat/123-add-foo") 123
    assertEquals $(to_issue "backup/fix/6666-fix-foo") 6666
    assertEquals $(to_issue "123-ein-zwo") 123
}

. ./shunit2
