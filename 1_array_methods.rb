fruits = ["mango", "pear", "apple", "amla", "tomato"]

# fruits.push("banana")
# print fruits

# fruits.pop
# print fruits

# print fruits.reverse

# print fruits.sort

# puts fruits.include?("litchi")
# print fruits.include?("pear")


if fruits.include?("amla")
    fruits.delete("amla")
    print fruits
else
    puts "Item not found"
end