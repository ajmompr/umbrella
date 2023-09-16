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

#Create hashes to locate the location latitude and longitude
results_array = parsed_response.fetch("results")
#pp results_array

results_hash = results_array.at(0)
#pp results_hash
#pp results_hash.keys

geometry_hash = results_hash.fetch("geometry")
#pp geometry_hash

location_hash = geometry_hash.fetch("location")
#pp location_hash

user_latitude = location_hash.fetch("lat")
pp user_latitude

user_longitude = location_hash.fetch("lng")
pp user_longitude
