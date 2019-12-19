#!/user/bin/ruby
require './lib/setup.rb'
require 'colorize'

wizard = SetupWizard.new

system "clear"
wizard.inject_header
puts ""

puts "What would you like you to call your project?"
print "  ➢ ".blink
wizard.new_project(gets)
puts ""

puts "What Gems do you want?"
print "  ➢".blink
wizard.setup_gems(gets)
puts ""

puts "What classes would you like?"
print "  ➢".blink
wizard.setup_classes(gets)
puts ""

wizard.open_project
