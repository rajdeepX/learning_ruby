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

# class Discounted_Product < Product
#     def initialize(name, price, discount)
#         super(name, price)
#         @discount = discount
#     end
#     def calc_discounted_price
#         @price - (@price * (@discount.to_f/100))
#     end
#     def discount_product_info
#         puts "#{name} : #{price} (Discounted price: #{calc_discounted_price})"
#     end
# end

# class Calculate_Cart_Total
#     def calculate_total(product)
#         product.sum {|item| item.is_a?(Discounted_Product) ? item.calc_discounted_price : item.price}
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
#         @products.each {|item| puts item.is_a?(Discounted_Product) ? "#{item.name} costs #{item.calc_discounted_price} (Discount)" : "#{item.name} costs #{item.price}" }
#     #     @products.each {|item|
#     #         if item.is_a?(Discounted_Product)
#     #             puts "#{item.name} costs #{item.calc_discounted_price} (Discount)"
#     #         else
#     #             puts "#{item.name} costs #{item.price}"
#     #         end
#     # }
#     end
#     def remove_products(name)
#         @products.reject! {|item| item.name == name}
#     end
# end

# class User
#     attr_accessor :name, :cart, :total_price
#     def initialize(name, total_price)
#         @name = name
#         @cart = Cart.new
#         @total_price = total_price
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
#         total = @total_price.calculate_total(@cart.products)
#         puts "---------"
#         puts "Your total amount is: #{total}"
#         puts "---------"
        
#     end

# end



# product1 = Product.new("Chips", 50)
# product2 = Product.new("Chocolate", 150)
# product3 = Product.new("Butter", 70)
# dProduct1 = Discounted_Product.new("Laptop", 18000, 20)
# dProduct2 = Discounted_Product.new("Watch", 1200, 40)

# dProduct1.discount_product_info

# total_price = Calculate_Cart_Total.new
# user = User.new("Sam", total_price)
# user.add_to_cart(product1)
# user.remove_from_cart("Chips")
# user.add_to_cart(product2)
# user.add_to_cart(product3)
# user.add_to_cart(dProduct1)
# user.add_to_cart(dProduct2)
# user.checkout()


# ****************************************

# GYM System



# class Gym_Membership
#     attr_accessor :member_type, :membership_type, :duration 
#     def initialize(member_name, membership_type, duration)
#         @member_name = member_name
#         @membership_type = membership_type
#         @duration = duration
#     end
#     def check_offers
#         if @duration >= 12
#             "10% discount is available"
#         else 
#             "No discount available"
#         end
#     end
#     def cal_fees
#         base_fee = 800
#         if @duration >= 12
#             discount = 0.1 * (base_fee * @duration)
#             total = (base_fee * @duration) - discount
#         else
#             total = base_fee * @duration
#         end
#     end
#     def member_info
#         puts "#{@member_name}."
#         puts "Membership: #{@membership_type}."
#         puts "Valid for: #{@duration} months."
#         puts "Discount: #{check_offers}"
#         puts "Membership Fee: #{cal_fees}."
#     end

# end

# class Premium_Membership < Gym_Membership
#     attr_accessor :member_name, :membership_type, :duration, :spa, :trainer
#     def initialize(member_name, membership_type, duration, spa, personal_trainer)
#         super(member_name, membership_type, duration)
#         @spa = spa
#         @personal_trainer = personal_trainer
#     end

#     def cal_fees
#         total = super
#         additional_fee = 0
#         if @spa && @personal_trainer
#             additional_fee = total + 1200
#         elsif @spa
#             additional_fee = total + 400
#         elsif @personal_trainer
#             additional_fee = total +1000
#         else total
#         end
#     end
#     def member_info
#         member_info = super
#         puts "Spa : #{ @spa ? "Yes" : "No"}"
#         puts "Personal trainer : #{ @personal_trainer ? "Yes" : "No"}"
#     end
        
# end

# class Gym_Manager
#     attr_accessor :member
#     def initialize
#         @members = []
#     end
#     def add_member(member)
#         @members << member
#     end
#     def list_members
#         puts "Gym members"
#         puts "-----"
#         @members.each {|person| puts "#{person.member_info}"}
#     end
# end


# user1 = Gym_Membership.new("Bully", "Basic", 6)
# user2 = Gym_Membership.new("Billy", "Basic", 12)
# user3 = Premium_Membership.new("Tommy", "Premium", 12, true, true)
# user4 = Premium_Membership.new("Mikey", "Premium", 6, false, true)
# # # user.member_info
# admin = Gym_Manager.new
# admin.add_member(user1)
# admin.add_member(user2)
# admin.add_member(user3)
# admin.add_member(user4)
# admin.list_members()

# ***********************************
 
class Bank_Account
    attr_accessor :account_holder, :account_num
    def initialize(account_holder, account_num, balance)
        @account_holder = account_holder
        @account_num = account_num
        @balance = balance
        @transactions = []
    end
    def withdraw(amount)
        if amount <= @balance
            @balance -= amount
        elsif amount > @balance
            puts "Insufficient balance"
        else 
            puts "Could not process"
        end
        @transactions << Transaction.new("Withdraw", amount)
    end
    def deposit(amount)
        @balance += amount
        @transactions << Transaction.new("Deposit", amount)
    end
    def view_balance
        puts "Your balance: #{@balance}"
    end
    def transaction_history
        if @transactions.empty?
            puts "No transactions done"
        else 
            puts "Transaction history"
            @transactions.each {|transaction| puts transaction.transaction_info}
        end
        view_balance()
    end


end


class Transaction
    attr_accessor :type, :amount
    def initialize(type, amount)
        @type = type
        @amount = amount
        @time = Time.now
    end
    def transaction_info
        "#{@type} of #{@amount} on #{@time}"
    end
end


user = Bank_Account.new("Eno", "112233", 5000)
user.deposit(1000)
user.deposit(1200)
user.deposit(100)
user.deposit(1300)
user.withdraw(2000)
user.withdraw(6000)
user.transaction_history()