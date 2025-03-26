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
  