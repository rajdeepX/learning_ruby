# age = 19
# case age
# when 0..21
#     puts "study"
# when 22..60
#     puts "career"
# when 61..100
#     puts "rest"
# end


greet = gets.chomp.capitalize

case greet
when "English" then puts "Hello"
when "Spanish" then puts "Hola"
when "French" then puts "Bonjour"
when "German" then puts "Hallo"
when "Italian" then puts "Ciao"
else puts "No idea"
end


