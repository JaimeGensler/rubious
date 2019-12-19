#!/user/bin/ruby
require './lib/setup.rb'
require 'colorize'
wizard = SetupWizard.new

system "clear"
wizard.inject_header
puts ""

puts " What would you like you to call your project?"
print "    ➢ ".blink
wizard.start(gets)
puts ""

puts " What Gems do you want?"
print "    ➢ ".blink
wizard.get_gems(gets)
puts ""

puts " What classes would you like?"
print "    ➢ ".blink
wizard.get_classes(gets)
puts ""

wizard.finish
