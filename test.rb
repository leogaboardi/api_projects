#replicating tutorial
require 'open-uri'
require 'json'
url = "http://maps.googleapis.com/maps/api/geocode/json?address=the+corner+of+foster+and+sheridan&sensor=false"
raw_data = open(url).read
parsed_data = JSON.parse(raw_data)
#puts parsed_data.class
#puts parsed_data.keys
results = parsed_data["results"]
first = results[0]
#puts first .class
#puts first.keys
geometry = first["geometry"]
location = geometry["location"]
puts location["lat"]
puts location["lng"]
