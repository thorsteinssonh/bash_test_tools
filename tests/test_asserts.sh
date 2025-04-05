#! /usr/bin/env bash
# -*- coding: utf-8 -*-

source ../bash_test_tools

echo "Preprocessing Assert Statmenents"
# Testing the framework asserts requires some hacking
echo "Running Asserts that should evaluate as OK"
_assert_condition=0
assert_equal 1234 1234
assert_not_equal 1234 1235
assert_equal "bla\notherline" "bla\notherline" "multiline1" "multiline2"
error="something"; assert_has_error
output="some output"; assert_has_output
error=""; assert_no_error
output=""; assert_no_output
assert_contains "some text here" "text h" "string" "substring"
assert_contains "some text\nhere" "text\nh" "string" "stubstring w newline"
assert_not_contains "some text here" "text-h" "string" "substring"
assert "./arg_is_foobar.py foobar"

total_fail1=$_assert_condition

echo "Running Asserts that should evaluate as FAIL"
_assert_condition=0
assert_equal 34 35
assert_not_equal 12 12
assert_equal "bla\notherline" "blabla\notherline" "multiline1" "multiline2"
error=""; assert_has_error
output=""; assert_has_output
error="abc"; assert_no_error
output="abc"; assert_no_output
assert_contains "some text here" "texth" "string" "substring"
assert_contains "some text here" "text\nh" "string" "stubstring w newline"
assert_not_contains "some text here" "text h" "string" "substring"
assert "./arg_is_foobar.py notfoobar"

total_fail2=$_assert_condition

function test_ok_asserts
{
  # Assert
  assert_equal "$total_fail1" "0" "no. of ok asserts failed should be"
}

function test_fail_asserts
{
  # Assert
  assert_equal "$total_fail2" "11" "no. of fail asserts failed should be"
}

# Run all test functions - optional argument passed to run specific tests only
testrunner
