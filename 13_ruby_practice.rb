# LOGIN PAGE


# require "bcrypt"

# class Login
#     attr_accessor :users
#     def initialize
#         @users = {}
#     end

#     def menu
#         loop do
#             puts "LOGIN PAGE"
#             puts "\n1. Register\n2. Login\n3. Exit"
#             print "Choose an option: "
#             choice = gets.chomp.to_i
          
#             case choice
#             when 1
#               user_register(users)
#             when 2
#               user_login(users)
#             when 3
#               puts "Exiting!"
#               break
#             else
#               puts "Invalid choice! Try again."
#             end
#           end
#     end

#     def user_register(users)
#         print "Enter username: "
#         username = gets.chomp()

#         if @users.key?(username)
#             puts "User already exists!"
#         else
#             print "Enter password: "
#             password = gets.chomp()
#             enc_password = BCrypt::Password.create(password)
#             user = {
#                 name: username,
#                 password: enc_password
#             }
#             @users[username] = user
#             puts "Registration successfull!"
#             puts "-------"
#         end
#     end

#     def user_login(users)
#         print "Enter username: "
#         username = gets.chomp()

#         print "Enter password: "
#         user_password = gets.chomp()

#         if @users.key?(username)
#             if BCrypt::Password.new(@users[username][:password]) == user_password
#                 puts "Login successful!"
#                 puts "---------"
#                 access_user(users, username)
#             else
#                 puts "Incorrect credentials!"
#                 puts "---------"
#             end
#         else "No user found!"
#         end
#     end

#     def access_user(users, username)
#         loop do
#             puts "\nUser Menu"
#             puts "1. Edit Username"
#             puts "2. Edit Password"
#             puts "3. View User Details"
#             puts "4. Logout"
#             print "Choose an option: "
#             choice = gets.chomp.to_i
        
#             case choice
#             when 1
#               edit_username(users, username)
#             when 2
#               edit_password(users, username)
#             when 3
#               view_user_details(users, username)
#             when 4
#               puts "Logging out..."
#               break
#             else
#               puts "Invalid choice! Please try again."
#             end
#           end
#     end

#     def edit_username(users, old_username)
#         print "Enter new username: "
#         new_username = gets.chomp()

#         if users.key?(new_username)
#             puts "Username already exists!"
#         else
#             users[old_username][:name] = new_username
#             puts "Username successfully updated to '#{new_username}'"
#         end
#     end

#     def edit_password(users, username)
        
#     end

#     def view_user_details(users, username)
#         puts "\nUser Details:"
#         puts "Username: #{users[username][:name]}"
#         puts "Password: #{users[username][:password]}"
#     end


#     private
    
#     def load_users
#     end

#     def save_users
#     end

# end

# login = Login.new()
# login.menu()


# *********************************


