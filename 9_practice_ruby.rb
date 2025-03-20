# EXPENSE TRACKER


# require 'json'

# class Transaction
#     attr_accessor :amount, :type, :category, :date
#     def initialize(amount, type, category, date)
#         @amount = amount
#         @type = type
#         @category = category
#         @date = date
#     end
#     def transaction_info
#         puts "#{@date} | #{@type} | #{@category} | #{@amount}"
#     end
# end

# class Account
#     attr_accessor :balance, :transactions
#     def initialize
#         @balance = 0
#         @transactions = []
#     end

#     def add_transaction(transaction)
#         @transactions << transaction
#         update_balance()
#     end

#     def remove_transaction(transaction)
#         @transactions.delete(transaction)
#         update_balance()
#     end
#     def update_balance
#         @balance = @transactions.reduce(0) {|sum, transaction|
#         transaction.type == "income" ? sum + transaction.amount : sum - transaction.amount    
#     }
#     end
#     def view_transactions
#         @transactions.each {|x| puts x.transaction_info}
#         # puts "Your balance is: #{@balance}"
#     end

#     def total_income
#         total = 0
#         @transactions.each {|t|
#         if t.type == "income"
#             total += t.amount
#         end
#         }
#         total
#     end

#     def total_expense
#         expense = 0
#         @transactions.each {|t|
#         if t.type != "income"
#             expense += t.amount
#         end
#         }
#         expense
#     end

#     def generate_report
#         puts "Your total income is: #{total_income}"
#         puts "Your total expense is: #{total_expense}"
#         puts "Your balance: #{@balance}"
#     end
#     def save_to_file(filename)
#         data = @transactions.map { |t| { amount: t.amount, category: t.category, type: t.type, date: t.date } }
#         File.write(filename, JSON.dump(data))
#     end

# end


# class Expense_Tracker
#     attr_accessor :account
#     def initialize
#         @account = Account.new()
#     end

#     def menu
#         loop do 
#             puts "Personal Expense Tracker"
#             puts "1. Add Income"
#             puts "2. Add Expense"
#             puts "3. Remove Transaction"
#             puts "4. View Transactions"
#             puts "5. Generate Report"
#             puts "6. Exit"
#             print "Choose an option: "

#             choice = gets.chomp().to_i
#             case choice
#             when 1
#                 add_transaction("income")
#             when 2
#                 add_transaction("expense")
#             when 3
#                 remove_transaction
#             when 4
#                 view_transactions
#             when 5
#                 generate_report
#             when 6
#                 puts "Goodbye!"
#                 break
#             else
#                 puts "Incorrect selection"
#             end
#             @account.save_to_file('transactions.json')
#         end

#     end

#     def add_transaction(type)
#         print "Enter amount: $"
#         amount = gets.chomp.to_f
#         print "Enter category: "
#         category = gets.chomp
#         print "Enter date (YYYY-MM-DD): "
#         date = gets.chomp

#         transaction = Transaction.new(amount, type, category, date)
#         @account.add_transaction(transaction)
#         puts "Transaction added!"
#         puts "\n"
#     end

#     def remove_transaction
#         puts "Select to remove:"
#         @account.view_transactions
#         print "Enter the transaction number to remove: "
#         index = gets.chomp().to_i - 1 
#         transaction = @account.transactions[index]
#         @account.remove_transaction(transaction)
#         puts "Transaction removed"
#     end

#     def view_transactions
#         puts "All Transactions"
#         @account.view_transactions
#     end
#     def generate_report
#         @account.generate_report()
#     end

    
# end


# tracker = Expense_Tracker.new
# tracker.menu()


# **********************************


# NOTES APP



require "json"

class Note
    attr_accessor :note
    def initialize(note)
        @note = note
    end

    def note_info
        @note
    end
end

class List
    attr_accessor :notes
    def initialize
        @notes = []
        load_from_file("test.json")
    end
    def add_to_list(note)
        @notes << note
    end
    def remove_from_list(note)
        @notes.delete(note)
    end

    def view_list
        puts "Your Notes"
        @notes.each {|i| puts i.note_info}
    end

    def save_to_file(filename)
        data = @notes.map {|i| {note: i.note}}
        File.write(filename, JSON.dump(data))

    end

    def load_from_file(filename)
        if File.exist?(filename)
          file_data = File.read(filename)
          notes_array = JSON.parse(file_data)
          @notes = notes_array.map { |data| Note.new(data['note']) }
        end
      end
end

class Create_Note
    def initialize
        @list = List.new
    end

    def menu
                loop do 
                    puts "Note"
                    puts "1. Add Note"
                    puts "2. Remove Note"
                    puts "3. View Notes"
                    puts "0. Exit"
                    print "Choose an option: "
        
                    choice = gets.chomp().to_i
                    case choice
                    when 1
                        add_note
                    when 2
                        remove_note
                    when 3
                        view_note
                    when 0
                        puts "Good bye!"
                        break
                    else
                        puts "Incorrect selection"
                    end
                    @list.save_to_file("test.json")
                end
        
            end

    def add_note
        puts "Your note: "
        text = gets.chomp().to_s

        note = Note.new(text)
        @list.add_to_list(note)
        puts "Your note is added!"
        puts "\n"
    end
    def remove_note
        puts "Select your note to remove"
        @list.view_list()
        print "Select the number to remove: "
        index = gets.chomp().to_i - 1
        note = @list.notes[index]
        @list.remove_from_list(note)
        puts "Your note is removed!"
        puts "\n"
    end
    def view_note
        @list.view_list
        puts "\n"
    end
end


note = Create_Note.new()
note.menu()