# class Dog

#     def initialize(name, color)
#         @name = name
#         @color = color
#     end

#     def identity
#         puts "Woof! I am #{@name}. I have a #{@color} nose"
#     end

# end

# dog1 = Dog.new("Cookie", "brown")


# dog1.identity()



# class Animal

#     def initialize(name, age)
#         @name = name
#         @age = age
#     end
#     def eat
#         puts "I am eating."
#     end

#     def speaks
#         puts "The name is #{@name} and I am #{@age} years old."
#     end
# end

# class Dog < Animal
#     def greet
#         puts "Hello! I am a puppy"
#     end
#     def bark
#         puts "Woof! Woof!"
#     end
# end

# dog1 = Dog.new("Cookie", 3)

# dog1.bark()
# dog1.greet()
# dog1.speaks()
# dog1.eat()




# class Vehicle
#     def initialize(wheel, capacity)
#         @wheel = wheel
#         @capacity = capacity
#     end

#     def vehicle_wheel
#         @wheel
#     end

#     def vehicle_capacity
#         @capacity
#     end

#     def modify_capacity(value)
#         @capacity = value
#     end

# end

# class Car < Vehicle
#     def initialize(name, make, wheel, capacity)
#         super(wheel, capacity)
#         @name = name
#         @make = make
#     end

#     def car_name
#         @name
#     end

#     def car_make
#         @make
#     end

# end

# car = Car.new("X1", 2023, 4, 5)

# puts car.car_name
# puts car.car_make
# puts car.vehicle_wheel
# puts car.vehicle_capacity

# car.modify_capacity(2024)

# puts car.vehicle_capacity


# class Car
#     attr_reader :model  # Read-only
#     attr_writer :color  # Write-only
  
#     def initialize(model, color)
#       @model = model
#       @color = color
#     end
#   end
  
#   my_car = Car.new('Sedan', 'Red')
#   puts my_car.model  # Output: Sedan
#   my_car.color = 'Blue'
#   puts my_car.color



# class Car
#     attr_reader :name
#     attr_accessor :colour

#     def initialize (name, colour)
#         @name = name
#         @colour = colour
#     end

# end

# car = Car.new("BMW", "black")

# puts car.name
# puts car.colour

# car.colour = "blue"

# puts car.colour



# *************

# INHERITANCE


# class Vehicle
#     def description
#         puts "This is a transportation vehicle"
#     end
# end

# class Car < Vehicle
#     def description
#         puts "this is a car"
#         super
#     end
# end

# class Bus < Vehicle
#     def bus_description
#         puts "this is a bus"
#     end
# end


# v1 = Car.new()
# v2 = Bus.new()

# v1.description
# v2.bus_description
# v2.description



# DERRIVED CLASS ATTRIBUTES

# class Vehicle 
#     attr_accessor :brand
#     attr_accessor :make

#     def initialize(brand, make)
#         @brand = brand
#         @make = make
#     end
# end

# class Car < Vehicle
#     attr_accessor :model

#     def initialize(brand, make, model)
#         super(brand, make)
#         @model = model
#     end
# end


# car = Car.new("BMW", 2024, "X1")

# puts "This is #{car.brand} #{car.model} manufactured in #{car.make}"


# PUBLIC AND PRIVATE

# class Vehicle
#     attr_accessor :name
#     attr_accessor :make
#     def initialize(name, make)
#         @name = name
#         @make = make
#     end

#     public

#     def display
#         greet() 
#         puts @name
#         puts @make
#     end

#     private

#     def greet
#         puts "Hello!"
#     end
# end

# obj = Vehicle.new("BMW", "X1")

# obj.display



# ****************************


# MODULES


# with using self ***********

# module NewModule
#     CONST_1 = 45
#     CONST_2 = 54

#     def self.source
#         puts "This is from the module NewModule"
#     end
# end


# puts NewModule::CONST_1
# NewModule::source()



# without using self **********

# module NewModule
#     CONST_1 = 10
#     CONST_2 = 20

#     def source
#         puts "this is from the NewModule"
#     end

# end

# # require "./NewModule.rb"  ---> This is used when the module is in another separate file

# class MyClass
#     include NewModule
# end

# obj = MyClass.new()
# puts NewModule::CONST_1
# obj.source()



# %%%%%%%%%%%%%%%%%%%%%%%%
# MIXINS
# %%%%%%%%%%%%%%%%%%%%%%%%

# module Greet
#     def source
#         puts "Hello!"
#     end
# end

# class MyClass
#     include Greet
#     attr_reader :name
#     def initialize(name)
#         @name = name
#     end

#     def display
#         puts "Oye #{name}"
#     end
# end

# obj = MyClass.new("Bablu")
# obj.display()
# obj.source()




# ******************
# PRACTICE
# ******************

# Adding and finding books in a library


# class Book
#     def initialize(title, author, isbn)
#         @title = title
#         @author = author
#         @isbn = isbn

#     end


#     def info
#         puts "#{@title} by #{@author}."
#     end

#     def isbn
#         @isbn
#     end

# end


# class Library
#     def initialize(lib_name)
#         @lib_name = lib_name
#         @books = []
#     end

#     def add_book(book)
#         @books << book
#     end

#     def list_books
#         puts "#{@lib_name.upcase} books collection"
#         @books.each {|book| puts book.info}
#     end

#     def remove_book(isbn)
#         @books.reject! {|book| book.isbn == isbn}
#     end

#     def find_book(isbn)
#         searched_book = @books.find {|book| book.isbn == isbn}
#         puts searched_book.info
#     end

# end



# book1 = Book.new("The Great Gatsby", "F. Scott Fitzgerald", "1234")
# book2 = Book.new("1984", "George Orwell", "9876")
# book3 = Book.new("To Kill a Mockingbird", "Harper Lee", "1122")

# # book1.info()

# lib = Library.new("New Gen")
# lib.add_book(book1)
# lib.add_book(book2)
# lib.add_book(book3)
# lib.list_books()
# puts "\n"

# lib.find_book("9876")




# book1 = Book.new("The Great Gatsby", "F. Scott Fitzgerald", "1234")
# book2 = Book.new("1984", "George Orwell", "9876")
# book3 = Book.new("To Kill a Mockingbird", "Harper Lee", "1122")

# lib = Library.new("linux")
# lib.add_book(book1)
# lib.add_book(book2)
# lib.add_book(book3)

# lib.list_books




# *****************************

# online store



# class Product
#     attr_accessor :name, :price, :quantity
#     def initialize(name, price, quantity)
#         @name = name
#         @price = price
#         @quantity = quantity
#     end

#     def info
#         puts "#{name} : #{price} (Stock left: #{quantity})"
#     end
# end


# class Customer
#     attr_accessor :name
#     def initialize(name)
#         @name = name
#         @cart = []
#     end

#     def buy_prod(product)
#         @cart << product
#         # puts "Purchased #{product.name}"
#         product.quantity -= 1
#     end

#     def orders
#         puts "John's cart: "
#         # @cart.each {|x| puts "#{x.name}"}
#     end
# end


# product1 = Product.new("Mango", 120.00, 50)
# product2 = Product.new("Lemon", 49.99, 10)


# user = Customer.new("John")
# user.buy_prod(product1)
# user.buy_prod(product2)
# user.orders()

# puts "\n"


# product1.info()
# product2.info()
    


# **************************
# Transactions


class Account
    attr_accessor :holder, :balance
    def initialize(holder, balance)
        @holder = holder
        @balance = balance
    end 

    def withdraw(amt)
        if amt > @balance
            puts "#{@holder}, you have insufficient balance"
        else 
            @balance -= amt
            puts "#{amt} has been withdrawn, #{@holder}"
        end
    end

    def deposit(amt)
        @balance += amt
        puts "#{amt} has been added to your acc #{@holder}"
    end

    def checkBalance
        puts "#{@holder}, you have in your acc: #{@balance}"
    end

end

user1 = Account.new("Bob", 5000)
user2 = Account.new("John", 500)
user3 = Account.new("Gullu", 1500)

user1.checkBalance()
user1.withdraw(6000)
user1.checkBalance()
puts "\n"

user2.withdraw(200)
user2.checkBalance()
puts "\n"


user3.deposit(100)
user3.checkBalance()
