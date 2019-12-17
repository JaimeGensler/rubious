#!/user/bin/ruby
require './lib/setup.rb'
require 'colorize'

wizard = SetupWizard.new

system "clear"
wizard.inject_header

puts "What would you like you to call your project?"
wizard.create_new(gets)
puts ""

puts "What Gems do you want?"
wizard.get_gems(gets)
puts ""

puts "What classes would you like?"
wizard.make_classes(gets)
puts ""

wizard.open_project
