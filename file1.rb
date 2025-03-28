# finding the sum of numbers in a range ***** 

# sum = 0
# 
# for i in 1..5
#     sum = sum + i;
# end
# 
# puts sum
# 


# String methods using with our without bang (!) operator

# # text = "hello"

# puts text.upcase
# puts text
# puts "\n\n"
# # puts text.upcase!
# puts text


# Strings are treated as an array

# text = "Hello World"

# puts text[0]
# puts text[2]

# puts "\n\n"

# puts text[1, 6]

# puts "\n"


# Include method ***************

# puts text.include? "Hi"
# puts text.include? "World"

# puts "\n"

# puts text.split(" ")
# puts "\n"


# Spliting an url*********

# file_url = "github.com/rajdeepX/learning_ruby/"
# puts file_url.split("")
# puts "\n"
# puts file_url.split("/")
# puts "\n"
# puts file_url.split("_")
# puts "\n"

# puts file_url.split("/")[-2] 


# Find and replace string***********



# file_url = "github.com/rajdeepX/learning_ruby/"


# replace with one character
# puts file_url.gsub("i", "e")
# puts file_url.gsub(/i/, "e")

# replace an expression
# puts file_url.gsub(/[aeiou]/, "")  
# puts file_url.sub("i", "e")  



# text = "hello everyone out there"
# 
# new_text = text.split(" ")
# puts new_text.reverse()



# Taking inputs from user***********

# puts "Your name please?"
# user_input = gets.capitalize
# puts "Thank you #{user_input}, have a seat."

# using .chomp (removes trailing character) *******

# puts "Your name please?"
# user_input = gets.capitalize.chomp
# puts "Thank you #{user_input}, have a seat."


# adding two numbers from user input

# puts "What you want to add?"
# a = gets.chomp
# b = gets.chomp
# puts "Your result is #{a+b}"
# puts "\n"
# puts "Your result is #{a.to_i + b.to_i}"


# text = "aeroplane"

# puts text.slice(1,4)
# puts text.center(20)

# text = "          aeroplane      "
# puts text.split




# Iterating over arrays

# s = ["ham", "swiss"]
# s.each {|i| puts "#{i}"}


# Iterating over 2D-arrays

# s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]
# 
# s.each {|i| 
#   i.each{|j| puts "#{j}"}
# }



# Iterating over hash

# secret_identities = {
#   "The Batman" => "Bruce Wayne",
#   "Superman" => "Clark Kent",
#   "Wonder Woman" => "Diana Prince",
#   "Freakazoid" => "Dexter Douglas"
# }
#   
# secret_identities.each {|x, y|
#   puts "#{x}: #{y}"
# }