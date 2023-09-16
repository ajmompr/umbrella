require "http"
require "json"

#Get user location
puts "Where are you?"
location = gets.chomp
puts "Checking the weather at #{location}..."


# Assemble google geocode API URL
google_maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + location + "&key=" + ENV.fetch("GMAPS_KEY")

# Place GET request to the google geocode API URL
raw_response_google = HTTP.get(google_maps_url)

# Parse the HTTP Response with JSON
parsed_response_google = JSON.parse(raw_response_google)

#pp parsed_response

#Create hashes to locate the location latitude and longitude
results_array = parsed_response_google.fetch("results")
#pp results_array

results_hash = results_array.at(0)
#pp results_hash
#pp results_hash.keys

geometry_hash = results_hash.fetch("geometry")
#pp geometry_hash

location_hash = geometry_hash.fetch("location")
#pp location_hash

# Store user's latitude based on location
user_latitude = location_hash.fetch("lat")

# Store user's longitude based on location
user_longitude = location_hash.fetch("lng")

#Display your coordinates print stament
user_coord = "Your coordinates are " + user_latitude.to_s + ", " + user_longitude.to_s
puts user_coord

#Assemble pirate weather url
pirate_weather_url = "https://api.pirateweather.net/forecast/" + ENV.fetch("PIRATE_WEATHER_KEY") + "/" + user_latitude.to_s + "," + user_longitude.to_s

# Place GET request to pirate weather
raw_response_pir = HTTP.get(pirate_weather_url)

# Parse the HTTP response with JSON
parsed_response_pir = JSON.parse(raw_response_pir)
#pp parsed_response_pir

currently_hash = parsed_response_pir.fetch("currently")
#pp currently_hash

user_temp = currently_hash.fetch("temperature")

current_temp_statement = "It is currently #{user_temp}" + "\u{00B0}" + "F."
puts current_temp_statement

hourly_hash = parsed_response_pir.fetch("hourly")
#pp hourly_hash
data_array = hourly_hash.fetch("data")
#pp data_array


data_hash_next_hr = data_array.at(1)
#pp data_hash

next_hour = data_hash_next_hr.fetch("summary")
puts "Next hour: " + next_hour

# data_array[1..13].each do |data_hash|
#   if data_hash.fetch("precipProbability") > 10.0
#     pp "You might want to carry an umbrella."
#   else
#     pp "You probably won't need an umbrella today."
#   end  
# end

#pp data_array[1..13]

# precip_array = []

# data_array[1..12].each do |index_hash|
#   precip_array.push(index_hash.fetch("precipProbability"))
# end
