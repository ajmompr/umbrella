require "http"
require "json"

#Get user location
puts "Where are you?"
location = gets.chomp
pp "You are currently located in #{location}."


# Assemble google geocode API URL
google_maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + location + "&key=" + ENV.fetch("GMAPS_KEY")

