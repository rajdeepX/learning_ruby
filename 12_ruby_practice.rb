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

