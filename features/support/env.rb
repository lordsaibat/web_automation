#The env.rb file allows us to have special tasks run before and after the tests.
#We can also put in the requirements here instead of each step_def file.
require 'watir-webdriver'
require 'cucumber'
require 'test/unit/assertions'
include Test::Unit::Assertions

After do |scenario|
  @browser.close
end