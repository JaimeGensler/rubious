#!/user/bin/ruby
require './lib/setup.rb'
require './lib/assets.rb'
require './config.rb'
require 'colorize'
include Assets
include Config
wizard = SetupWizard.new

system "clear"
Assets.inject_header

puts "What would you like you to call your project?"
wizard.create_new(gets.chomp, CONFIG[:path])
# project_name = wizard.create_new(gets.chomp)
puts ""

puts "What Gems do you want?"
wizard.write_gems(gets.chomp, CONFIG[:default_gems])
puts ""

# system "gem install bundler -​-install-dir #{CONFIG[:path]}/#{project_name}"
# system "bundle install --path #{CONFIG[:path]}/#{project_name}"
