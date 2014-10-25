require 'open-uri'
require 'json'

puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp

puts "What is the longitude?"
the_longitude = gets.chomp

# Your code goes below. Use the same approach as you did in
#   address_to_coords.rb to read from a remote API and parse
#   the results.

# Ultimately, we want the following line to work when uncommented:

#the_latitude = 37.8267
#the_longitude = -122.423

url ="https://api.forecast.io/forecast/2ea3b5cd98865a722f256df27dc3609e/"+the_latitude.to_s+","+the_longitude.to_s
raw_data = open(url).read
parsed_data = JSON.parse(raw_data)

# puts parsed_data.class
# puts parsed_data.keys
#puts  parsed_data

the_temperature = parsed_data["currently"]["temperature"]

#converting from F to C (just for fun)
the_temperature = ((the_temperature -32) / 1.8).round(1)

#puts the_temperature
the_hour_outlook = parsed_data["hourly"]["summary"]

the_day_outlook = parsed_data["daily"]["data"][0]["summary"]

puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
