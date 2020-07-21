# Ruby scripting test
This repository was made to reply to the "Smart" ruby test, that can be found [here](https://github.com/mgrassotti/smart_ruby_test/blob/master/docs/smart_ruby_test.pdf).

## Requirements
In order to launch the script, you need `ruby` to be installed on your machine. Please check out the installation instructions here https://www.ruby-lang.org/en/documentation/installation/.

For the exact ruby version, please check the `.ruby-version` file.

## Launch the script
After downloading the repository to your machine, run this command inside the code directory:
```
$ ./parse.rb <log_file_name>
```
To see the example output, you can run:
```
$ ./parse.rb webserver.log
```

## Running tests
In order to run the test suite, you need to install `rspec`.

If you didn't installed it before:
```
$ gem install rspec
```
Then you can run it, inside the project folder:
```
$ rspec
```

## Feedbacks
Please open a new Github issue for any comment.
