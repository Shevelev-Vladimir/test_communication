# encoding: utf-8

# 
VERSION = 5

#
require_relative "./lib/test"
require_relative "./lib/inference"

#
name = ARGV[0]

#
test = Test.new
inference = Inference.new(name)

#
inference.print_version(VERSION)
#
inference.say_hi

#
while test.in_progress?
  test.following_question
end

#
inference.print_result(test)
