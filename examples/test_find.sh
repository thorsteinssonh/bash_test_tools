#! /usr/bin/env bash
# -*- coding: utf-8 -*-

source ../bash_test_tools

# setup / tear down
function setup
{
  mkdir -p work
  cd work
  touch some_file.txt
  touch other_file
}

function teardown
{
  cd ..
  rm -rf work
}

# Set up generic predefined tests
generic has_unix_conventions "find"

# Add test functions here
function test_find_local_directory
{
  # Run
  run "find ./"
  # Assert
  assert_success
  assert_output_contains "some_file.txt"
}

function test_find_txt_files
{
  # Run
  run "find ./ -name *.txt"
  # Assert
  assert_success
  assert_output_contains "some_file.txt"
  assert_output_not_contains "other_file"
}

function test_find_delete
{
  # Run
  run "find ./ -name *.txt -delete"
  # Assert
  assert_success
  assert_file_not_exists "some_file.txt"
  assert_file_exists "other_file"
}

function test_invalid_option
{
  # Run
  run "find --silly_bad_option"
  # Assert
  assert_fail
  assert_error_contains "unknown predicate"
}

function test_invalid_file_or_directory
{
  # Run
  run "find ./non_existing_path"
  # Assert
  assert_fail
  assert_error_contains "No such file or directory"
}

function test_new_feature
{
  ## In testdriven development we
  ## may implement a test for a feature yet to be implemented
  # Run
  run "find --new-feature"
  # Assert
  assert_success
}

# Run all test functions - optional argument passed to run specific tests only
testrunner
