# pair = {
#     "Dog" => "Bark",
#     "Cat" => "Meow",
#     "Carrot" => "Vegie",
#     1 => 2,
#     "arr" => [1,2,3]
# }

# # puts pair["Dog"]
# puts pair

# pair["Tomato"] = "Fruit"

# pair.delete("Cat")
# pair.delete(1)


# puts pair


# Loops in hash

# pair.each {|key, value|
    # puts "#{key}: #{value}"
# }


# pair.each_key {|x| 
#     puts "#{x}"
# }

# pair.each_value {|x| 
#     puts "#{x}"
# }


# puts pair.fetch("Dog")
# 
# print pair.keys 
# 
# print pair.values

# puts pair.length


# another = {
#     "Road" => "Traffic",
#     "Car" => "Wheels",
#     "House" => "Roof",
# }


# new_hash = another.merge(pair)
# print new_hash



# *********************

# info = {
#     "name" => "Tom",
#     "age" => 56,
#     "city" => "Tompur",
# }

# puts info.fetch("city")

# info["profession"] = "dev"

# info["age"] = 65

# print info



# *****************

# cart = {
#     "snack" => 50,
#     "sauce" => 56,
#     "noodles" => 150,
# }

# sum = 0;
# cart.each { |key, value|
#     sum = sum+value
# }
# puts sum


# cart["apple"] = 110

# puts cart

# cart.delete("snack")
# puts cart

# puts cart.include?("apple") ? "Apples are there" : "They are not"


# **********************************8


# list = {}
# puts "For how many items: "

# num = gets.chomp.to_i

# num.times {
#     puts "Enter your key: "
#     key = gets.chomp

#     puts "Enter your value for #{key}"
#     value = gets.chomp

#     list[key] = value
# }

# print list



# *****************************


