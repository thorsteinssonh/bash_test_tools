# bash_test_tools

```bash
source bash_test_tools

WORK="/tmp/work"

function setup
{
  mkdir -p "$WORK"
  cd "$WORK"
  touch some_file.txt
}

function teardown
{
  cd
  rm -rf "$WORK"
}

function test_find_local_directory
{
  # Run
  run "find ./"
  # Assert
  assert_success
  assert_output_contains "some_file.txt"
}

testrunner
```
Bash Test Tools is intended to be a simple to use framework for testing executables inside the
shell environment. The framework allows extraction and assert operations on parameters 
such as standard output, standard error, exit code, execution time, file system and network services.
Please read the full documentation located here [bash_test_tools docs](https://thorsteinssonh.github.io/bash_test_tools).

