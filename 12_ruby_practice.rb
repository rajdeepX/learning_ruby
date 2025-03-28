# MOVIE TICKET BOOKING

# class Movie
#     attr_accessor :movie_name, :duration, :genre, :seats_available
#     def initialize(movie_name, duration, genre, seats_available)
#         @movie_name = movie_name
#         @duration = duration
#         @genre = genre
#         @seats_available = seats_available
#     end

#     def movie_info
#         puts "Movie: #{@movie_name}"
#         puts "Genre: #{@genre}"
#         puts "Duration: #{@duration}"
#         puts "Seats available: #{@seats_available}"
#     end
# end


# class Customer
#     attr_accessor :name, :age
#     def initialize(name, age)
#         @name = name
#         @age = age
#     end
# end


# class Booking_Manager
#     attr_accessor :bookings, :movies
#     def initialize
#         @movies = []
#         @bookings = []
#     end

#     def add_movies(movie)
#         @movies << movie
#     end

#     def book_ticket(customer, movie, seats)
#         if seats <= movie.seats_available
#             movie.seats_available -= seats
#             ticket = {
#                 name: customer.name,
#                 movie_booked: movie.movie_name,
#                 seats: seats
#             }
#             @bookings << ticket
#             puts "#{seats} ticket(s) booked for #{customer.name} for '#{movie.movie_name}'."
#             display_seats(movie)
#             puts "----"
#         else
#           puts "Seats not available! Only #{movie.seats_available} left."
#         end
#     end

#     def cancel_ticket(customer, movie, seats)
#         booking = @bookings.find {|i| i[:name]== customer.name && i[:movie_booked] == movie.movie_name}
        
#         if booking
#             if seats <= booking[:seats]
#                 movie.seats_available += seats
#                 puts "Bookings for #{customer.name} for #{seats} has been cancelled!"
#                 display_seats(movie)
#                 if booking[:seats] == 0
#                     @bookings.delete(booking)
#                 end
#                 puts "----"
#             else
#                 puts "Cannot cancel more tickets than you have booked"
#             end
#         else
#             puts "No bookings found to cancel!"
#         end
#     end
    
#     def display_seats(movie)
#         puts "Available seats for '#{movie.movie_name}': #{movie.seats_available}"
#     end
# end

# movie1 = Movie.new("Inception", 148, "Sci-Fi", 10)
# movie2 = Movie.new("Avengers", 180, "Action", 30)

# customer1 = Customer.new("Nolan", 56)
# customer2 = Customer.new("Bay", 60)
# customer3 = Customer.new("Martin", 66)
# customer4 = Customer.new("David", 48)

# manager = Booking_Manager.new()
# manager.book_ticket(customer1, movie1, 3)
# manager.book_ticket(customer2, movie1, 4)
# manager.book_ticket(customer3, movie2, 3)
# manager.book_ticket(customer4, movie1, 2)
# manager.cancel_ticket(customer3, movie2, 3)
# manager.book_ticket(customer3, movie1, 1)


# **********************************************************

# CONTACT MANAGEMENT SYSTEM


# class Contact
#     attr_accessor :name, :phone, :email
#     def initialize(name, phone, email)
#         @name = name
#         @phone = phone
#         @email = email
#     end
# end


# class Contacts_Manager
#     FILE_NAME = "contacts.txt"

#     attr_accessor :contacts
#     def initialize
#         @contacts = []
#         load_contacts()
#     end

#     def add_contact(new_contact)
#         contact = {
#             Name: new_contact.name,
#             Phone: new_contact.phone,
#             Email: new_contact.email,
#         }

#         @contacts << contact
#         save_contacts()
#         puts "Contact successfully added!"
#         puts "----"
#     end

#     def update_contact(name, new_name: nil, new_phone: nil, new_email: nil)
#         contact = @contacts.find {|x| x[:Name].downcase == name.downcase}
#         if contact
#             contact[:Name] = new_name if new_name
#             contact[:Phone] = new_phone if new_phone
#             contact[:Email] = new_email if new_email
#             puts "Contact updated!"
#             save_contacts()
#         else puts "Contact not found!"
#         end
#     end

#     def search_contact(name)
#         contact = @contacts.find {|x| x[:Name].downcase == name.downcase}
#         if contact
#             puts "Here are your results:"
#             puts "#{contact[:Name]} | #{contact[:Phone]} | #{contact[:Email]}"
#             puts "----"
#         else
#             puts "No contact found!"
#         end
#     end

#     def delete_contact(name)
#         contact = @contacts.find {|x| x[:Name].downcase == name.downcase}
#         if contact
#             @contacts.delete(contact)
#             puts "Contact deleted!"
#             save_contacts()
#         else
#             puts "No contact found!"
#         end
#     end
    
#     def display_contacts
#         if @contacts.empty?
#             puts "No contacts to display!"
#         else
#             @contacts.each {|x|
#             puts "#{x[:Name]} | #{x[:Phone]} | #{x[:Email]}"
#             }
#         end
#     end


#     private

#     def save_contacts
#         File.open(FILE_NAME, "w") { |file|
#             @contacts.each { |contact|
#                 file.puts "#{contact[:Name]}|#{contact[:Phone]}|#{contact[:Email]}"
#             }
#             }
#     end

#     def load_contacts
#         return unless File.exist?(FILE_NAME)

#         File.foreach(FILE_NAME) { |line|
#             name, phone, email = line.strip.split("|")
#             @contacts << { Name: name, Phone: phone, Email: email }
#         }
#     end
# end


# contact1 = Contact.new("David", 789456, "david@email.com")
# contact2 = Contact.new("Nolan", 965241, "nolanC@email.com")
# contact3 = Contact.new("Christian", 905042, "bale@email.com")

# manager = Contacts_Manager.new()

# manager.add_contact(contact1)
# manager.add_contact(contact2)
# manager.add_contact(contact3)

# manager.search_contact("christian")
# # manager.delete_contact("david")

# manager.display_contacts()

# manager.update_contact("nolan", new_phone: 965236)
# manager.display_contacts()


# *********************************************

# SIMPLE PASSWORD MANAGER


# class PasswordManager
#     def initialize
#       @passwords = {}
#     end

#     def menu
#         loop do
#             puts "\n--- Password Manager ---"
#             puts "1. Add Password"
#             puts "2. Retrieve Password"
#             puts "3. Update Password"
#             puts "4. Delete Password"
#             puts "5. List All Passwords"
#             puts "6. Exit"
#             print "Choose an option: "
          
#             choice = gets.chomp().to_i
          
#             case choice
#             when 1
#               print "Website: "
#               website = gets.chomp
#               print "Username: "
#               username = gets.chomp
#               print "Password: "
#               password = gets.chomp
#               add_password(website, username, password)
#             when 2
#               print "Website: "
#               website = gets.chomp
#               get_password(website)
#             when 3
#               print "Website: "
#               website = gets.chomp
#               print "New Password: "
#               new_password = gets.chomp
#               update_password(website, new_password)
#             when 4
#               print "Website: "
#               website = gets.chomp
#               delete_password(website)
#             when 5
#               list_passwords
#             when 6
#               puts "Goodbye!"
#               break
#             else
#               puts "Invalid choice!"
#             end
#           end
#     end

  
#     def add_password(website, username, password)
#       @passwords[website] = { username: username, password: password }
#       puts "Password saved!"
#     end
  
#     def get_password(website)
#       entry = @passwords[website]
#       if entry
#         puts "Website: #{website}"
#         puts "Username: #{entry[:username]}"
#         puts "Password: #{entry[:password]}"
#       else
#         puts "No password found for #{website}."
#       end
#     end
  
#     def update_password(website, new_password)
#       if @passwords.key?(website)
#         @passwords[website][:password] = new_password
#         puts "Password updated!"
#       else
#         puts "No entry found."
#       end
#     end
  
#     def delete_password(website)
#       if @passwords.delete(website)
#         puts "Password deleted!"
#       else
#         puts "No entry found."
#       end
#     end
  
#     def list_passwords
#       if @passwords.empty?
#         puts "No passwords stored!"
#       else
#         @passwords.each do |website, data|
#           puts "Website: #{website}, Username: #{data[:username]}, Password: #{data[:password]}"
#         end
#       end
#     end
# end

# manager = PasswordManager.new
# manager.menu()



# ***************************

# ATM SYSTEM


class BankAccount
attr_reader :account_number, :balance, :transactions
attr_accessor :pin

def initialize(account_number, pin, balance = 0)
    @account_number = account_number
    @pin = pin
    @balance = balance
    @transactions = []
    @daily_withdrawal_limit = 5000
    @withdrawn_today = 0
end

def deposit(amount)
    @balance += amount
    @transactions << "Deposited ₹#{amount}"
    puts "Deposited ₹#{amount}. New balance: ₹#{@balance}"
end

def withdraw(amount)
    if amount > @balance
    puts "Insufficient balance!"
    elsif @withdrawn_today + amount > @daily_withdrawal_limit
    puts "Withdrawal limit exceeded! You can withdraw up to ₹#{@daily_withdrawal_limit - @withdrawn_today} today."
    else
    @balance -= amount
    @withdrawn_today += amount
    @transactions << "Withdrew ₹#{amount}"
    puts "Withdrew ₹#{amount}. New balance: ₹#{@balance}"
    end
end

def check_balance
    puts "Current balance: ₹#{@balance}"
end

def change_pin(new_pin)
    @pin = new_pin
    puts "PIN changed successfully!"
end

def show_transactions
    puts "Transaction History:"
    @transactions.each { |t| puts "-- #{t}" }
end
end
  
class ATM
def initialize
    @accounts = {}
end

def menu
    loop do
        puts "\n1. Create Account\n2. Access Account\n3. Exit"
        print "Choose an option: "
        choice = gets.chomp.to_i
      
        case choice
        when 1
          create_account
        when 2
          access_account
        when 3
          puts "Thank you for using our ATM!"
          break
        else
          puts "Invalid choice! Try again."
        end
      end
end


def create_account
    print "Enter Account Number: "
    acc_num = gets.chomp
    print "Set a 4-digit PIN: "
    pin = gets.chomp

    @accounts[acc_num] = BankAccount.new(acc_num, pin, 1000)
    puts "Account created successfully! Your initial balance is ₹1000."
end

def access_account
    print "Enter Account Number: "
    acc_num = gets.chomp
    print "Enter PIN: "
    pin = gets.chomp

    account = @accounts[acc_num]

    if account && account.pin == pin
    puts "Login Successful!"
    atm_menu(account)
    else
    puts "Invalid Account Number or PIN!"
    end
end

def atm_menu(account)
    loop do
    puts "\n1. Deposit\n2. Withdraw\n3. Check Balance\n4. Change PIN\n5. Transaction History\n6. Exit"
    print "Choose an option: "
    choice = gets.chomp.to_i

    case choice
    when 1
        print "Enter amount to deposit: ₹"
        amount = gets.chomp.to_i
        account.deposit(amount)
    when 2
        print "Enter amount to withdraw: ₹"
        amount = gets.chomp.to_i
        account.withdraw(amount)
    when 3
        account.check_balance
    when 4
        print "Enter new PIN: "
        new_pin = gets.chomp
        account.change_pin(new_pin)
    when 5
        account.show_transactions
    when 6
        puts "Exiting ATM..."
        break
    else
        puts "Invalid choice! Try again."
    end
    end
end
end
  

atm = ATM.new
atm.menu()
  