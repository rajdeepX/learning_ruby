# LIBRARY SYSTEM: ADDED FEATURE TO BORROW AND RETURN BOOKS


# class Book
#     attr_accessor :title, :author, :isbn
#     def initialize(title, author, isbn)
#         @title = title
#         @author = author
#         @isbn = isbn 
#         @checked = false
#     end

#     def info
#         puts "#{@title} by #{@author}. ISBN: #{@isbn}. Availability: #{@checked ? "No" : "Yes"}"
#     end
    
#     def checkout
#         @checked = true
#     end
#     def returned
#         @checked = false
#     end


# end

# class Library
#     def initialize(name)
#         @name = name
#         @books = []
#     end
#     def add_books(book)
#         @books << book
#     end
#     def list_books
#         @books.each {|item| puts item.info}
#     end
#     def find_book(isbn)
#         searched_book = @books.find {|item| item.isbn == isbn}
#         return searched_book
#     end
# end

# class User
#     def initialize(username, id, library)
#         @username = username
#         @id = id
#         @library = library
#     end
#     def borrow_book(isbn)
#         book = @library.find_book(isbn)
#         if book && book.checkout
#             puts "#{@username} has borrowed #{book.title}"
#             book.checkout()
#             puts book.info
            
#         else puts "Book is unavailable"
#         end
#     end
#     def return_book(isbn)
#         book = @library.find_book(isbn)
#         # puts book.info
#         if book && book.checkout
#             puts "#{@username} returned the book #{book.title}"
#             book.returned()
#             puts book.info
#         else puts "Incorrect details."
#         end
#     end
# end


# book1 = Book.new("How not to", "Legend", "1122")

# library = Library.new("Young")
# library.add_books(book1)
# library.list_books()

# user = User.new("God", "007", library)
# user.borrow_book("1122")
# user.return_book("1122")



# *****************************
# calculating areas and perimeter of shapes


# class Shape
#     attr_accessor :color
#     def initialize(color)
#         @color = color
#     end
#     def area
#         raise NotImplementedError, 'Must be overridden in the subclass'
#     end
#     def perimeter
#         raise NotImplementedError, 'Must be overridden in the subclass'
#     end
#     def info
#         puts "This is a #{color} coloured shape. Area: #{area} and Perimeter: #{perimeter}"
#     end
    
# end

# class Rectangle < Shape
#     def initialize(width, height, color)
#         super(color)
#         @width = width
#         @height = height
#     end
#     def area
#         @width*@height
#     end
#     def perimeter
#         2*(@width + @height)
#     end
# end

# class Square < Shape
#     def initialize(side, color)
#         super(color)
#         @side = side
#     end
#     def area
#         @side**2
#     end
#     def perimeter
#         4*@side
#     end
# end

# class Triangle < Shape
#     def initialize(base, height, side1, side2, color)
#         super(color)
#         @base = base
#         @height = height
#         @side1 = side1
#         @side2 = side2
#     end
    
#     def area
#             if @side1 + @side2 > @base && @base + @side1 > @side2 && @base + @side2 > @side1
#                 0.5*@base*@height
#             else puts "Invalid input for a triangle."
#             end
#     end
#     def perimeter
#             if @side1 + @side2 > @base && @base + @side1 > @side2 && @base + @side2 > @side1
#                 @side1 + @side2 + @base
#             else puts "Invalid input for a triangle."
#             end
#     end
# end

# class Circle < Shape
#     def initialize(radius, color)
#         super(color)
#         @radius = radius
#     end
#     def area
#         Math::PI * @radius**2
#     end
#     def perimeter
#         2*Math::PI*@radius
#     end
# end

# obj1 = Rectangle.new(10, 25, "Red")
# puts obj1.area
# puts obj1.perimeter
# obj1.info
# puts "\n"
# obj2 = Square.new(20, "Green")
# puts obj2.area
# puts obj2.perimeter
# obj2.info
# puts "\n"
# obj3 = Circle.new(7, "Blue")
# puts obj3.area
# puts obj3.perimeter
# obj3.info
# puts "\n"
# obj4 = Triangle.new(7, 5, 6, 9, "Yellow")
# puts obj4.area
# puts obj4.perimeter
# obj4.info


# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


# class Animal
#     attr_accessor :name, :species
#     def initialize(name, species)
#         @name = name
#         @species = species
#     end
#     def speak
#         puts "Animals have their own sound"
#     end
#     def move
#         puts "Animals move around the jungle"
#     end
# end

# class Lion < Animal
#     def initialize(name, species)
#         super(name, species)
#     end
#     def speak
#         puts "ROAR!!"
#     end
#     def info
#         puts "#{name} is a #{species}"
#     end
#     def move
#         puts "#{species} moves rapidly"
#     end
# end

# class Elephant < Animal
#     def initialize(name, species)
#         super(name, species)
#     end
#     def speak
#         puts "TRUMPET!!"
#     end
#     def info
#         puts "#{name} is a #{species}"
#     end
#     def move
#         puts "#{species} moves slowly"
#     end
# end

# lion = Lion.new("Leo", "Lion")
# lion.speak
# lion.info
# lion.move
# puts "\n"
# ele = Elephant.new("Manny", "Elephant")
# ele.speak
# ele.info
# ele.move



# |||||||||||||||||||||||||||||||||||||||||||||||||||

# Ecommerce


# class Product 
#     attr_accessor :name, :price
#     def initialize(name, price)
#         @name = name
#         @price = price
#     end
#     def details
#         puts "#{@name} : #{@price}"
#     end
# end

# class Cart
#     attr_accessor :products
#     def initialize
#         @products = []
#     end

#     def add_products (products)
#         @products << products
#     end
#     def list_products
#         @products.each {|item| puts "#{item.name} costs #{item.price}"}
#     end
#     def remove_products(name)
#         @products.reject! {|item| item.name == name}
#     end
#     def cart_total
#         @products.sum {|item| item.price }
#     end
# end

# class User
#     attr_accessor :name, :cart
#     def initialize(name)
#         @name = name
#         @cart = Cart.new
#     end
#     def add_to_cart(product)
#         @cart.add_products(product)
#     end
#     def view_cart
#         @cart.list_products()
#     end
#     def remove_from_cart(name)
#         @cart.remove_products(name)
#     end
#     def checkout
#         puts "Checkout Items:"
#         @cart.list_products()
#         total = @cart.cart_total()
#         puts "Your total amount is: #{total}"
        
#     end

# end


# item1 = Product.new("Coke", 40)
# item2 = Product.new("Campa", 20)
# item3 = Product.new("Table", 2000)
# item4 = Product.new("Chair", 1500)

# # cart = Cart.new("")
# # cart.add_products(item1)
# # cart.add_products(item2)

# # cart.list_products

# user = User.new("Tom")
# user.add_to_cart(item1)
# user.add_to_cart(item2)
# user.add_to_cart(item3)
# user.add_to_cart(item4)
# # user.view_cart()

# user.remove_from_cart("Coke")
# puts "\n"
# # user.view_cart()
# user.checkout()


# *****************************
# |||||||||||||||||||||||||||||

# VENDING MACHINE



# class Product
#     attr_accessor :name, :price
#     def initialize(name, price)
#         @name = name
#         @price = price
#     end
# end

# class Stock
#     attr_accessor :product
#     def initialize
#         @product = []
#     end

#     def add_product(product)
#         @product << product
#     end 
#     def view_products
#         @product.each {|item| puts "#{item.name}: #{item.price}"}
#     end
#     def remove_product(item)
#         @product.delete(item)
#     end
# end

# class Transactions
#     attr_accessor :balance, :amount
#     def initialize
#         @balance = 0
#     end
#     def add_balance(amount)
#         @balance += amount
#     end
#     def deduct_balance(amount)
#         @balance -= amount
#     end
   
    
# end

# class Vending_Machine
#     attr_accessor :stock, :transaction, :name, :loaded_item
#     def initialize(name)
#         @name = name
#         @stock = Stock.new
#         @transaction = Transactions.new
#         @loaded_item = nil
#     end

#     def add_to_stock(product)
#         @stock.add_product(product)
#     end
#     def list_items
#         @stock.view_products
#     end

#     def add_coin(amount)
#         @transaction.add_balance(amount)
#     end
#     def view_amount
#         @transaction.balance
#     end
#     def buy_item(item_name)
#         @loaded_item = @stock.product.find {|x| x.name == item_name}
#         if @loaded_item && @transaction.balance >= @loaded_item.price
#             @transaction.deduct_balance(@loaded_item.price)
#             @stock.remove_product(@loaded_item)
#             puts "Please collect your #{item_name}"
#         elsif @loaded_item.price > @transaction.balance
#             puts "Insufficient balance"
#         else puts "Try again"
#         end
#     end
            
    
# end



# item1 = Product.new("Cola", 50)
# item2 = Product.new("GummyBear", 30)
# item3 = Product.new("Chips", 50)
# machine = Vending_Machine.new("Vending")
# machine.add_to_stock(item1)
# machine.add_to_stock(item2)
# machine.add_to_stock(item3)
# machine.list_items()
# puts "\n"
# machine.add_coin(70)
# puts machine.view_amount()
# puts "\n"
# machine.buy_item("Cola")
# puts "\n"
# machine.buy_item("Chips")
# puts "\n"
# puts machine.view_amount()


# ****************************************************

