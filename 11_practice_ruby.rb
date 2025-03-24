# POLYMORPHISM

# class Customer
#     attr_accessor :name, :address, :phone
#     def initialize(name, address, phone)
#         @name = name
#         @address = address
#         @phone = phone
#     end

#     def customer_info
#         puts "#{@name}, from #{@address}. Ph.no.: #{@phone}"
#     end

#     def vip_discount
#         customer_info()
#         puts "You are not eligible for VIP discount!"
#     end
# end

# class Vip < Customer

#     def initialize(name, address, phone)
#         super(name, address, phone)
#     end

#     def vip_discount
#         customer_info()
#         puts "Hey! you are eligible for a VIP discount of 30%!!"
#     end

# end


# customer = Customer.new("Canon", "Somewhere", 789)
# vip = Vip.new("Pixel", "Everywhere", 987)

# customer.vip_discount()
# puts "\n"
# vip.vip_discount()

# *************************************************

