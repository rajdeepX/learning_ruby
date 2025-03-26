# # LOGIN PAGE

# require 'bcrypt'
# require 'json'

# class Login
#   attr_accessor :users

#   def initialize
#     @users = []
#     load_users
#   end

#   def menu
#     loop do
#       puts "LOGIN PAGE"
#       puts "\n1. Register\n2. Login\n3. Exit"
#       print "Choose an option: "
#       choice = gets.chomp.to_i

#       case choice
#       when 1
#         user_register
#       when 2
#         user_login
#       when 3
#         puts "Exiting!"
#         save_users
#         break
#       else
#         puts "Invalid choice! Try again."
#       end
#     end
#   end

#   def user_register
#     print "Enter Username: "
#     username = gets.chomp
#     print "Enter Password: "
#     password = gets.chomp

#     if @users.any? { |u| u[:user_name] == username }
#       puts "Username already taken!"
#       return
#     end

#     hashed_password = BCrypt::Password.create(password)
#     user = { user_name: username, user_password: hashed_password }
#     @users << user
#     puts "Registered successfully!"

#     view_user_details
#   end

#   def user_login
#     print "Enter Username: "
#     username = gets.chomp
#     print "Enter Password: "
#     password = gets.chomp

#     user = @users.find { |i| i[:user_name] == username }
#     if user
#       if BCrypt::Password.new(user[:user_password]) == password
#         puts "Login Successful"
#         access_user(user)
#       else
#         puts "Wrong password!\n"
#       end
#     else
#       puts "User not found!"
#     end
#   end

#   def access_user(user)
#     loop do
#       puts "\nUser Menu"
#       puts "1. Edit Username"
#       puts "2. Edit Password"
#       puts "3. View User Details"
#       puts "4. Logout"
#       print "Choose an option: "
#       choice = gets.chomp.to_i

#       case choice
#       when 1
#         edit_username(user)
#       when 2
#         edit_password(user)
#       when 3
#         view_user_details
#       when 4
#         puts "Logging out..."
#         break
#       else
#         puts "Invalid choice! Please try again."
#       end
#     end
#   end

#   def edit_username(user)
#     print "Enter new username: "
#     new_username = gets.chomp

#     if @users.any? { |i| i[:user_name] == new_username }
#       puts "Username already exists!"
#     else
#       user[:user_name] = new_username
#       puts "Username changed successfully to #{new_username}"
#       view_user_details
#     end
#   end

#   def edit_password(user)
#     print "Enter new password: "
#     new_password = gets.chomp
#     hashed_password = BCrypt::Password.create(new_password)
#     user[:user_password] = hashed_password
#     puts "Password changed successfully!"
#     view_user_details
#   end

#   def view_user_details
#     @users.each do |i|
#       puts "Username: #{i[:user_name]}"
#       puts "Password: #{i[:user_password]}"
#     end
#   end

#   private

#   def load_users
#     if File.exist?("users.json")
#       file = File.read("users.json")
#       @users = JSON.parse(file, symbolize_names: true)
#     end
#   end

#   def save_users
#     file = File.open("users.json", "w")
#     file.write(JSON.pretty_generate(@users))
#     file.close
#   end
# end

# login = Login.new
# login.menu


# ***************************************


# # BLOG_SYSTEM

# class BlogPost
#     attr_accessor :title, :content
  
#     def initialize(title, content)
#       @title = title
#       @content = content
#     end
#   end
  
#   class BlogSystem
#     def initialize
#       @posts = []
#     end
  
#     def create_post
#       puts "\nEnter the title of your post:"
#       title = gets.chomp
#       puts "Enter the content of your post:"
#       content = gets.chomp
  
#       post = BlogPost.new(title, content)
#       @posts << post
#       puts "Your post has been created successfully!"
#     end
  
#     def view_posts
#       if @posts.empty?
#         puts "There are no posts to display."
#       else
#         puts "\n--- All Blog Posts ---"
#         @posts.each_with_index do |post, index|
#           puts "\nPost ##{index + 1}"
#           puts "Title: #{post.title}"
#           puts "Content: #{post.content}"
#         end
#       end
#     end
  
#     def run
#       loop do
#         puts "\nWelcome to the Simple Blog System!"
#         puts "1. Create a new post"
#         puts "2. View all posts"
#         puts "3. Exit"
#         choice = gets.chomp.to_i
  
#         case choice
#         when 1
#           create_post
#         when 2
#           view_posts
#         when 3
#           puts "Goodbye!"
#           break
#         else
#           puts "Invalid choice. Please try again."
#         end
#       end
#     end
#   end
  
#   BlogSystem.new.run
  

# *********************


# INVENTORY SYSTEM

# require 'json'

# class Inventory
#   def initialize
#     @inventory_file = 'inventory.json'
#     load_inventory
#   end

#   def load_inventory
#     if File.exist?(@inventory_file)
#       file = File.read(@inventory_file)
#       @inventory = JSON.parse(file)
#     else
#       @inventory = {}
#     end
#   end

#   def save_inventory
#     File.write(@inventory_file, JSON.pretty_generate(@inventory))
#   end

#   def add_product
#     puts "Enter product name:"
#     name = gets.chomp
#     puts "Enter product price:"
#     price = gets.chomp.to_f
#     puts "Enter product stock quantity:"
#     stock = gets.chomp.to_i

#     @inventory[name] = { price: price, stock: stock }
#     save_inventory
#     puts "Product added successfully!"
#   end

#   def update_product
#     puts "Enter product name to update:"
#     name = gets.chomp
#     if @inventory.key?(name)
#       puts "Enter new price (current: #{@inventory[name][:price]}):"
#       price = gets.chomp.to_f
#       puts "Enter new stock quantity (current: #{@inventory[name][:stock]}):"
#       stock = gets.chomp.to_i

#       @inventory[name] = { price: price, stock: stock }
#       save_inventory
#       puts "Product updated successfully!"
#     else
#       puts "Product not found."
#     end
#   end

#   def delete_product
#     puts "Enter product name to delete:"
#     name = gets.chomp
#     if @inventory.delete(name)
#       save_inventory
#       puts "Product deleted successfully!"
#     else
#       puts "Product not found."
#     end
#   end

#   def process_sale
#     puts "Enter product name to sell:"
#     name = gets.chomp
#     if @inventory.key?(name)
#       puts "Enter quantity to sell:"
#       quantity = gets.chomp.to_i

#       if @inventory[name][:stock] >= quantity
#         @inventory[name][:stock] -= quantity
#         save_inventory
#         total_price = @inventory[name][:price] * quantity
#         puts "Sale processed. Total: $#{total_price}"
#       else
#         puts "Not enough stock."
#       end
#     else
#       puts "Product not found."
#     end
#   end

#   def view_inventory
#     puts "Current Inventory:"
#     @inventory.each do |name, details|
#       puts "#{name} - Price: $#{details[:price]} - Stock: #{details[:stock]}"
#     end
#   end

#   def show_menu
#     puts "Inventory Management System"
#     puts "1. View Inventory"
#     puts "2. Add Product"
#     puts "3. Update Product"
#     puts "4. Delete Product"
#     puts "5. Process Sale"
#     puts "6. Exit"
#     print "Choose an option: "
#     gets.chomp.to_i
#   end

#   def run
#     loop do
#       case show_menu
#       when 1
#         view_inventory
#       when 2
#         add_product
#       when 3
#         update_product
#       when 4
#         delete_product
#       when 5
#         process_sale
#       when 6
#         puts "Exiting system."
#         break
#       else
#         puts "Invalid option. Try again."
#       end
#     end
#   end
# end


# system = Inventory.new
# system.run



# *******************************


