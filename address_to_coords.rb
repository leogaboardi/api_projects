require 'open-uri'
require 'json'

puts "What is the address you would like to find the latitude and longitude of?"

# Gets a string from the user and chomps off the carriage return at the end
the_address = gets.chomp

# Replaces spaces and other URL-illegal characters in the string
url_safe_address = URI.encode(the_address)
# Your code goes below. Hints:

url_of_data_we_want = "http://maps.googleapis.com/maps/api/geocode/json?address="+url_safe_address
raw_data = open(url_of_data_we_want).read
parsed_data = JSON.parse(raw_data)
#puts parsed_data.class
#puts parsed_data.keys
results = parsed_data["results"]
first = results[0]
#puts first .class
#puts first.keys
geometry = first["geometry"]
location = geometry["location"]

# Let's store the latitude in a variable called 'the_latitude',
#   and the longitude in a variable called 'the_longitude'.


the_latitude = location["lat"]
the_longitude = location["lng"]

# Ultimately, we want the following line to work when uncommented:

# puts "The latitude of #{the_address} is #{the_latitude} and the longitude is #{the_longitude}."
puts "The latitude of #{the_address} is #{the_latitude} and the longitude is #{the_longitude}."
