require 'json'

class Transaction
    attr_accessor :amount, :type, :category, :date
    def initialize(amount, type, category, date)
        @amount = amount
        @type = type
        @category = category
        @date = date
    end
    def transaction_info
        puts "#{@date} | #{@type} | #{@category} | #{@amount}"
    end
end

class Account
    attr_accessor :balance, :transactions
    def initialize
        @balance = 0
        @transactions = []
    end

    def add_transaction(transaction)
        @transactions << transaction
        update_balance()
    end

    def remove_transaction(transaction)
        @transactions.delete(transaction)
        update_balance()
    end
    def update_balance
        @balance = @transactions.reduce(0) {|sum, transaction|
        transaction.type == "income" ? sum + transaction.amount : sum - transaction.amount    
    }
    end
    def view_transactions
        @transactions.each {|x| puts x.transaction_info}
        # puts "Your balance is: #{@balance}"
    end

    def total_income
        total = 0
        @transactions.each {|t|
        if t.type == "income"
            total += t.amount
        end
        }
        total
    end

    def total_expense
        expense = 0
        @transactions.each {|t|
        if t.type != "income"
            expense += t.amount
        end
        }
        expense
    end

    def generate_report
        puts "Your total income is: #{total_income}"
        puts "Your total expense is: #{total_expense}"
        puts "Your balance: #{@balance}"
    end
    def save_to_file(filename)
        data = @transactions.map { |t| { amount: t.amount, category: t.category, type: t.type, date: t.date } }
        File.write(filename, JSON.dump(data))
    end

end


class Expense_Tracker
    attr_accessor :account
    def initialize
        @account = Account.new()
    end

    def menu
        loop do 
            puts "\n-- Personal Finance Tracker --"
            puts "1. Add Income"
            puts "2. Add Expense"
            puts "3. Remove Transaction"
            puts "4. View Transactions"
            puts "5. Generate Report"
            puts "6. Exit"
            print "Choose an option: "

            choice = gets.chomp().to_i
            case choice
            when 1
                add_transaction("income")
            when 2
                add_transaction("expense")
            when 3
                remove_transaction
            when 4
                view_transactions
            when 5
                generate_report
            when 6
                puts "Goodbye!"
                break
            else
                puts "Incorrect selection"
            end
            @account.save_to_file('transactions.json')
        end

    end

    def add_transaction(type)
        print "Enter amount: $"
        amount = gets.chomp.to_f
        print "Enter category: "
        category = gets.chomp
        print "Enter date (YYYY-MM-DD): "
        date = gets.chomp

        transaction = Transaction.new(amount, type, category, date)
        @account.add_transaction(transaction)
        puts "Transaction added!"
        puts "\n"
    end

    def remove_transaction
        puts "Select to remove:"
        @account.view_transactions
        print "Enter the transaction number to remove: "
        index = gets.chomp().to_i - 1 
        transaction = @account.transactions[index]
        @account.remove_transaction(transaction)
        puts "Transaction removed"
    end

    def view_transactions
        puts "All Transactions"
        @account.view_transactions
    end
    def generate_report
        @account.generate_report()
    end

    
end


tracker = Expense_Tracker.new
tracker.menu()