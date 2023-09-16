require "http"
require "json"

puts "Where are you?"
location = gets.chomp
pp "You are currently located in #{location}."
