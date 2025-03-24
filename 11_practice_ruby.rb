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


# students data

# class Student
#     def initialize
#         @student_name = ""
#         @student_regst_no = ""
#         @student_batch_no = ""
#     end

#     def get_student_name
#         puts @student_name
#     end
#     def set_student_name(name)
#         @student_name = name
#     end

#     def get_student_regst_no
#         puts @student_regst_no
#     end
#     def set_student_regst_no(regst_no)
#         @student_regst_no = regst_no
#     end
    
#     def get_student_batch_no
#         puts @student_batch_no
#     end
#     def set_student_batch_no(batch_no)
#         @student_batch_no = batch_no
#     end

#     def student_info
#         puts "Name: #{@student_name}. Registration no.: #{@student_regst_no}. Batch no.: #{@student_batch_no}"
#     end

# end

# std = Student.new()
# std.set_student_name("Norman")
# std.set_student_regst_no(5156)
# std.set_student_batch_no("111")

# std.get_student_name()
# std.get_student_regst_no()
# std.get_student_batch_no()
# puts "\n"
# std.student_info()

# *********************

# class Student
#     attr_accessor :name, :regst, :batch
#     def initialize(name, regst, batch)
#         @name = name
#         @regst = regst
#         @batch = batch
#     end
#     def student_info
#         puts "Name: #{@name}. Registration no.: #{@regst}. Batch no.: #{@sbatch}"
#     end
# end

# student = Student.new("Ram", 512, "B-16")
# puts student.name
# puts student.regst
# puts student.batch

# puts "\n"
# student.student_info()


# *****************************************8


class Vehicle
    attr_accessor :model, :brand, :rental_price, :availability
    def initialize(model, brand, rental_price, availability)
        @model = model
        @brand = brand
        @rental_price = rental_price
        @availability = true
    end

    def rent_vehicle
        @availability = false
    end

    def return_vehicle
        @availability = true
    end
end

class Car < Vehicle
    attr_accessor :fuel_type
    def initialize(model, brand, rental_price, availability, fuel_type)
        super(model, brand, rental_price, availability)
        @fuel_type = fuel_type
    end
end

class Bike < Vehicle
    attr_accessor :engine_capacity
    def initialize(model, brand, rental_price, availability, engine_capacity)
        super(model, brand, rental_price, availability)
        @engine_capacity = engine_capacity
    end
end

class Truck < Vehicle
    attr_accessor :cargo_load
    def initialize(model, brand, rental_price, availability, cargo_load)
        super(model, brand, rental_price, availability)
        @cargo_load = cargo_load
    end
end


class Customer
    attr_accessor :name, :id
    def initialize(name, id)
        @name = name
        @id = id
        @rented_vehicles = []
    end

    def rent_vehicle(vehicle)
        if @rented_vehicles.length > 2
            puts "Cannot rent more than 3 vehicles!"
        else
            @rented_vehicles << vehicle
            puts "#{@name} has rented #{vehicle.model}"
            vehicle.rent_vehicle()
        end
    end

    def return_rented_vehicle(vehicle)
        # vehicle = @rented_vehicles.find {|x| x.model == model}
        # @rented_vehicles.delete(vehicle)
        if @rented_vehicles.include?(vehicle)
            @rented_vehicles.delete(vehicle)
            vehicle.return_vehicle()
        else
            puts "#{vehicle.model} was not rented by #{@name}."
        end
    end

    def veiw_rented_vehicles
        @rented_vehicles.each {|x| 
        puts "#{x.model}, #{x.brand}"
        }
    end

end

class Rental_Service
    attr_accessor :available_vehicles
    def initialize
        @available_vehicles = []
    end

    def add_vehicle(vehicle)
        @available_vehicles << vehicle
    end
    def remove_vehicle(vehicle)
        if @available_vehicles.include?(vehicle)
            @available_vehicles.delete(vehicle)
        else 
            puts "No vehicle found!"
        end
    end

    def show_available_vehicles
        puts "Cars available for rent"
        @available_vehicles.each {|x|
        if x.availability
            puts "#{x.model}. #{x.brand}. Rental price: #{x.rental_price}/hour."
        end
        }
        puts "---"
    end

    def process_rental_request(customer, vehicle)
        if vehicle.availability
            customer.rent_vehicle(vehicle)
        else
            puts "#{vehicle.model} is not available for rent!"
        end
    end

    def process_return_request(customer, vehicle)
        customer.return_rented_vehicle(vehicle)
        puts "#{customer.name} has returned #{vehicle.model}"
    end


end


car1 = Car.new("Swift", "MS", 1800, true, "petrol")
bike1 = Bike.new("R15", "Yamaha", 500, true, "150cc")
truck1 = Truck.new("207Di", "TATA", 3000, true, "1500kg")
car2 = Car.new("Compass", "JEEP", 3500, true, "diesel")

rental_service = Rental_Service.new
rental_service.add_vehicle(car1)
rental_service.add_vehicle(car2)
rental_service.add_vehicle(bike1)
rental_service.add_vehicle(truck1)

customer = Customer.new("John", 1122)
customer2 = Customer.new("Selmon Bhoi", 2211)


rental_service.show_available_vehicles()

rental_service.process_rental_request(customer, car2)
puts "\n"
rental_service.process_rental_request(customer, bike1)
puts "\n"
rental_service.process_rental_request(customer, truck1)
puts "\n"
rental_service.process_rental_request(customer, car1)
puts "\n"
rental_service.process_return_request(customer, car2)
puts "\n"
rental_service.process_rental_request(customer2, car2)
puts "\n"
rental_service.show_available_vehicles()
# customer.rent_vehicle(car1)
# customer.rent_vehicle(car2)
# customer.rent_vehicle(car3)
# customer.veiw_rented_vehicles()
# puts "\n"
# customer.rent_vehicle(car4)
# customer.return_rented_vehicle("Harrier")
# customer.rent_vehicle(car4)



