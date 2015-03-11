# encoding: utf-8

# this is needed for guard to work, not sure why :(
require 'bundler'
Bundler.setup

root = Pathname(__FILE__).dirname

Dir[root.join('support/**/*.rb').to_s].each { |file| require file }
Dir[root.join('shared/**/*.rb').to_s].each { |file| require file }
