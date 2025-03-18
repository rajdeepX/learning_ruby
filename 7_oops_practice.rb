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



