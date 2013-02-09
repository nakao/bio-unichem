#!/bin/sh

# testing script for Jnekins task
# test/test.sh test_bio-unichem-model.rb

cd /Users/mitsuteru/Applications/biogems/bioruby-unichem/
/opt/local/bin/ruby1.9 -I lib -I test test/${1}
