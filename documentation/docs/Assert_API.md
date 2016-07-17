
# Assert API
Currently the following assert functions have been implemented, Some useful asserts are probably still missing, so please contribute or ask for help.
If you want to develop, please take a look at functions beginning with `assert_`
in the `bash_test_tools` file.

## variables
The most elementary assert calls operate on environment variables within the shell.
Typically more specific assert statements, such as `assert_no_error` are composed of one or more of these
more elementary asserts.

####assert_contains
```bash
# Asserts that $var contains sub-string $string
# assert_contains "$var" "$string"    [var-alias [string-alias]]
# example: 
assert_contains "$output" "Hello World"
# or
assert_contains "$output" "Hello World" "standard output"
```

####assert_not_contains
```bash
# Asserts that $var does not contain a sub-string $string
# assert_not_contains "$string" [var-alias [string-alias]]
# example:
assert_not_contains "$output" "Hello World"
# or
assert_not_contains "$output" "Hello World" "standard output"
```

####assert_equal
```bash
# Asserts that $var1 equals $var2 - works on both numeric and strings
# assert_equal "$var1" "$var2"    [var1-alias [var2-alias]]
# example: 
assert_equal "$output" "Hello World"
assert_equal "$output1" "$output2" "run 1 output" "run 2 output"
```

####assert_not_equal
```bash
# Asserts that $var1 does not equal $var2 - works on both numeric and strings
# assert_not_equal "$var1" "$var2"    [var1-alias [var2-alias]]
# example: 
assert_not_equal "$output" "Hello World"
# or
assert_equal "$output1" "$output2" "run 1 output" "run 2 output"
```

####assert_greater_than
```bash
# Asserts that $var1 is greater than $var2 - works on numeric
# assert_greater_than "$var1" "$var2"    [var1-alias [var2-alias]]
# example: 
assert_greater_than "$thread_count" "4" "thread count"
```

####assert_less_than
```bash
# Asserts that $var1 is less than $var2 - works on numeric
# assert_less_than "$var1" "$var2"    [var1-alias [var2-alias]]
# example: 
assert_less_than "$thread_count" "4" "thread count"
```

####assert_empty
```bash
# Asserts that $var is "" or not set
# assert_empty "$var" [var-alias]
# example: 
assert_empty "$error" "std error"
```

####assert_not_empty
```bash
# Asserts that $var is not ""
# assert_not_empty "$var" [var-alias]
# example: 
assert_not_empty "$output" "std output"
```

####assert_matches_regex
```bash
# Asserts that $var matches regular expression $regex
# assert_matches "$var" "$regex" [var-alias]
# example: 
assert_matches_regex "$output" "^[0-9]+\.[0-9]+\.[0-9]+" "output version number"
# i.e. asserts that $output begins with ##.##.## version style numerics
```

## output

These asserts apply specifically to the **standard output**, variable `output`.

####assert_output_contains
```bash
# Asserts that $output contains a sub-string $string [string-alias]
# assert_output_contains "$string"
# example:
assert_output_contains "Hello World"
```

####assert_output_not_contains
```bash
# Asserts that $output does not contain a sub-string $string [string-alias]
# assert_output_not_contains "$string"
# example:
assert_output_not_contains "Hello world"
```

####assert_has_output
```bash
# Asserts that $output is not empty != ""
# assert_has_output
# example:
assert_has_output
```

####assert_no_output
```bash
# Asserts that $output is empty == ""
# assert_no_output
# example:
assert_no_output
```

## error

These asserts apply specifically to the **standard error**, variable `error`

####assert_error_contains
```bash
# Asserts that $error contains a sub-string $string [string-alias]
# assert_error_contains "$string"
# example:
assert_error_contains "could not open file"
```

####assert_has_error
```bash
# Asserts that $error is not empty != ""
# assert_has_error
# example:
assert_has_error
```

####assert_no_error
```bash
# Asserts that $error is empty == ""
# assert_no_error
# example:
assert_no_error
```

## termination

These asserts apply specifically to the variables `returnval`, `error` and `strace`.  They evaluate the conditions by which the executable terminated.

####assert_exit_success
```bash
# Asserts that $returnval is equal to 0 (SUCCESS)
# assert_exit_success
# example:
assert_exit_succes
```

####assert_exit_fail
```bash
# Asserts that $returnval is not equal to 0 (FAIL)
# assert_exit_fail
# example:
assert_exit_fail
```

####assert_terminated_normally
```bash
# Essentailly asserts that the executable exited without crashing.
# Asserts that $strace does no include substring "tgkill"
# assert_terminated_normally
# example:
assert_terminated_normally
```

####assert_success
```bash
# Asserts healthy success behavior
# Calls assert_terminated_normally, assert_exit_success, assert_no_error
# example:
assert_success
```

####assert_fail
```bash
# Asserts healthy fail behavior
# Calls assert_terminated_normally, assert_exit_fail, assert_has_error
# example:
assert_fail
```

## file system

These asserts apply to files and directories

####assert_file_exists
```bash
# asserts that file exists
# assert_file_exists "$file_path"
# example:
assert_file_exists "$file_path"
```

####assert_file_not_exists
```bash
# asserts that file does not exist
# assert_file_not_exists "$file_path"
# example:
assert_file_not_exists "$file_path"
```

####assert_dir_exists
```bash
# asserts that a directory exists
# assert_dir_exists "$dir_path"
# example:
assert_dir_exists "$dir_path"
```

####assert_tree_equal
```bash
# asserts that two directory trees are the same
# assert_tree_equal "$dir1" "$dir2"
# example:
assert_tree_equal "/some/dir1" "/some/other/dir2"
```

####assert_tree_not_equal
```bash
# asserts that two directory trees are not the same
# assert_tree_not_equal "$dir1" "$dir2"
# example:
assert_tree_not_equal "/some/dir1" "/some/other/dir2"
```

## services
These asserts apply to services, typically network services.

####assert_service_on_port
```bash
# asserts that a network service is listening on port $port
# assert_service_on_port "$port"
# example:
assert_service_on_port "8000"
```



