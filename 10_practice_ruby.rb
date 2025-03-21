
# # WEATHER API

# require "httparty"
# require "json"


# class Weather
#     attr_accessor :location, :region, :time, :temp, :feels, :condition
#     def initialize(location, region, time, temp, feels, condition)
#         @location = location
#         @region = region
#         @time = time
#         @temp = temp
#         @feels = feels
#         @condition = condition
#     end

#     def weather_info
#         puts "--Here is your weather report--"
#         puts "Location: #{@location}, #{@region}"
#         puts "Temperature #{@temp}°C (Feels like #{@feels}°C )" 
#         puts "Condition: #{@condition}"
#         puts "Time: #{@time}"
#     end
# end

# class Fetch_Weather
#     attr_accessor :weather
#     def fetch
#         print "Enter location: "
#         loc = gets.chomp().to_s.capitalize

#         response = HTTParty.get("http://api.weatherapi.com/v1/current.json?key=2988f044becb4c8e9a153542252103&q=#{loc}")

#         data = JSON.parse(response.body)

#         location = data["location"]
#         current = data["current"]
#         puts "\n"
#         loc = location["name"]
#         region = location["region"]
#         time = location["localtime"]
#         temp = current["temp_c"]
#         feels = current["feelslike_c"]
#         condition = current["condition"]["text"]

#         weather = Weather.new(loc, region, time, temp, feels, condition)
#         weather.weather_info()
#     end
# end

# report = Fetch_Weather.new()
# report.fetch()
        

# ***************************************

# NEWS API


# require "httparty"
# require "json"


# class News
#     attr_accessor :query
#     def initialize
#         @query = ""
#     end

#     def menu
#         loop do
#             puts "Select your news topic"
#             puts "1. Politics"
#             puts "2. Technology"
#             puts "3. Sports"
#             puts "4. Economy"
#             puts "5. Education"
#             puts "0. Exit"
#             print "Choose an option: "

#             choice = gets.chomp().to_i

#             case choice
#             when 1
#                 fetch_news("politics")
#             when 2
#                 fetch_news("technology")
#             when 3
#                 fetch_news("sports")
#             when 4
#                 fetch_news("economy")
#             when 5
#                 fetch_news("education")
#             when 0
#                 puts "Visit again!"
#                 break
#             else
#                 puts "Invalid selection"
#             end
#         end
#     end

#     def fetch_news(query)
#         response = HTTParty.get("https://newsapi.org/v2/top-headlines?q=#{query}&apiKey=c1cc9fae57254b9b9bfa2968008e4027")

#         data = JSON.parse(response.body)

#         # source = data["articles"]["sou"]

#         data["articles"].each {|x|
#         puts "\n"
#         puts "#{x["source"]["name"]} : #{x["author"]} : #{x["title"]}"
#         }
#         puts "\n"
#     end
# end

# news = News.new()
# news.menu