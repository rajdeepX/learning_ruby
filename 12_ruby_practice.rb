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


