#! /usr/bin/env bash
# -*- coding: utf-8 -*-

source ../bash_test_tools

# setup / tear down
function setup
{
  mkdir -p work
  cd work
}

function teardown
{
  cd ..
  rm -rf work
}

# Add test functions here
function test_nc_listen_on_port
{
  # queue an assert on backgrounded run
  add_background_assert "assert_service_on_port 1234"
  #run
  run "nc -l 1234" background 2 SIGTERM
  #assert
  assert_terminated_normally
  assert_no_error
}

# Run all test functions - optional argument passed to run specific tests only
testrunner
