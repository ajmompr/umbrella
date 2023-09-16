require "http"
require "json"

#Get user location
puts "Where are you?"
location = gets.chomp
pp "You are currently located in #{location}."


# Assemble google geocode API URL
google_maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + location + "&key=" + ENV.fetch("GMAPS_KEY")

# Place GET request to the google geocode API URL
raw_response = HTTP.get(google_maps_url)

# Parse the HTTP Response with JSON
parsed_response = JSON.parse(raw_response)

#pp parsed_response
