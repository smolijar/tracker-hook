#!/bin/sh
. ./hook.sh --source-only

to_issue() {
    echo $1 | parse_issue
}

test_numeral() {
    assertEquals 123 $(to_issue "feat/123-add-foo")
    assertEquals 6666 $(to_issue "backup/fix/6666-fix-foo")
    assertEquals 123 $(to_issue "123-ein-zwo")
    assertEquals 456 $(to_issue "fix/456-add-2-functions")
}

test_github() {
    assertEquals GH-2 $(to_issue "GH-2")
}

test_hash() {
    assertEquals 42 $(to_issue "jm/#42")
}

test_no_match() {
    assertEquals NULL $(to_issue "master" || echo NULL)
    assertEquals NULL $(to_issue "feature/foobar-baz" || echo NULL)
}

. ./shunit2
