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

# VEHICLE RENTAL SERVICE


# class Vehicle
#     attr_accessor :model, :brand, :rental_price, :availability
#     def initialize(model, brand, rental_price, availability)
#         @model = model
#         @brand = brand
#         @rental_price = rental_price
#         @availability = true
#     end

#     def rent_vehicle
#         @availability = false
#     end

#     def return_vehicle
#         @availability = true
#     end
# end

# class Car < Vehicle
#     attr_accessor :fuel_type
#     def initialize(model, brand, rental_price, availability, fuel_type)
#         super(model, brand, rental_price, availability)
#         @fuel_type = fuel_type
#     end
# end

# class Bike < Vehicle
#     attr_accessor :engine_capacity
#     def initialize(model, brand, rental_price, availability, engine_capacity)
#         super(model, brand, rental_price, availability)
#         @engine_capacity = engine_capacity
#     end
# end

# class Truck < Vehicle
#     attr_accessor :cargo_load
#     def initialize(model, brand, rental_price, availability, cargo_load)
#         super(model, brand, rental_price, availability)
#         @cargo_load = cargo_load
#     end
# end


# class Customer
#     attr_accessor :name, :id
#     def initialize(name, id)
#         @name = name
#         @id = id
#         @rented_vehicles = []
#     end

#     def rent_vehicle(vehicle)
#         if @rented_vehicles.length > 2
#             puts "Cannot rent more than 3 vehicles!"
#         else
#             @rented_vehicles << vehicle
#             puts "#{@name} has rented #{vehicle.model}"
#             vehicle.rent_vehicle()
#         end
#     end

#     def return_rented_vehicle(vehicle)
#         # vehicle = @rented_vehicles.find {|x| x.model == model}
#         # @rented_vehicles.delete(vehicle)
#         if @rented_vehicles.include?(vehicle)
#             @rented_vehicles.delete(vehicle)
#             vehicle.return_vehicle()
#         else
#             puts "#{vehicle.model} was not rented by #{@name}."
#         end
#     end

#     def veiw_rented_vehicles
#         @rented_vehicles.each {|x| 
#         puts "#{x.model}, #{x.brand}"
#         }
#     end

# end

# class Rental_Service
#     attr_accessor :available_vehicles
#     def initialize
#         @available_vehicles = []
#     end

#     def add_vehicle(vehicle)
#         @available_vehicles << vehicle
#     end
#     def remove_vehicle(vehicle)
#         if @available_vehicles.include?(vehicle)
#             @available_vehicles.delete(vehicle)
#         else 
#             puts "No vehicle found!"
#         end
#     end

#     def show_available_vehicles
#         puts "Cars available for rent"
#         @available_vehicles.each {|x|
#         if x.availability
#             puts "#{x.model}. #{x.brand}. Rental price: #{x.rental_price}/hour."
#         end
#         }
#         puts "---"
#     end

#     def process_rental_request(customer, vehicle)
#         if vehicle.availability
#             customer.rent_vehicle(vehicle)
#             puts "----"
#         else
#             puts "#{vehicle.model} is not available for rent!"
#         end
#     end
    
#     def process_return_request(customer, vehicle)
#         customer.return_rented_vehicle(vehicle)
#         puts "#{customer.name} has returned #{vehicle.model}"
#         puts "----"
#     end


# end


# car1 = Car.new("Swift", "MS", 1800, true, "petrol")
# bike1 = Bike.new("R15", "Yamaha", 500, true, "150cc")
# truck1 = Truck.new("207Di", "TATA", 3000, true, "1500kg")
# car2 = Car.new("Compass", "JEEP", 3500, true, "diesel")

# rental_service = Rental_Service.new
# rental_service.add_vehicle(car1)
# rental_service.add_vehicle(car2)
# rental_service.add_vehicle(bike1)
# rental_service.add_vehicle(truck1)

# customer = Customer.new("John", 1122)
# customer2 = Customer.new("Selmon Bhoi", 2211)


# rental_service.show_available_vehicles()

# rental_service.process_rental_request(customer, car2)

# rental_service.process_rental_request(customer, bike1)

# rental_service.process_rental_request(customer, truck1)

# rental_service.process_rental_request(customer, car1)

# rental_service.process_return_request(customer, car2)

# rental_service.process_rental_request(customer2, car2)

# rental_service.show_available_vehicles()



# ******************************************


class Employee
    attr_accessor :name, :id, :position, :salary, :department
    def initialize(name, id, position, salary)
        @name = name
        @id = id
        @position = position
        @salary = salary
        @department = nil
    end

    def update_salary(new_salary)
        @salary += new_salary
        puts "Salary updated!"
    end

    def display_details
        puts "Emp. name: #{@name}. Emp. Id.: #{@id}. Position: #{@position}. Salary: #{@salary}"
    end
end


class Manager < Employee
    def initialize(name, id, position, salary, department, team_size)
        super(name, id, position, salary)
        @department = department
        @team_size = team_size
    end

    def assign_department(employee, department)
        if self.position == "Manager"
            employee.department = department
            puts "#{employee.name} has been assigned to the #{department} department by #{self.name}."
        else
            puts "#{self.name} does not have permission to assign employees to departments."
        end
    end

    def display_manager_details
        display_details
        puts "Department: #{@department}"
        puts "Team Size: #{@team_size}"
    end
end

class Company
    def initialize
        @employees = []
    end

    def add_employee(employee)
        @employees << employee
        puts "#{employee.name} has been added."
    end

    def list_employees_in_department(department)
        @employees.each {|x|
        if x.department == department
            puts "Emp. name: #{x.name}. Emp. Id.: #{x.id}. Position: #{x.position}. Salary: #{x.salary}"    
        end
        }
    end

    def display_all_employees
        puts "All Employees in the Company:"
        @employees.each { |employee| employee.display_details }
    end
end


employee1 = Employee.new("John", 1122, "Developer", 50000)
employee2 = Employee.new("Enriqe", 2233, "Designer", 30000)
employee3 = Employee.new("Dillbagh", 2233, "HR", 30000)

manager = Manager.new("White", 1234, "Manager", 150000, "Engineering", 15)

company = Company.new()

company.add_employee(employee1)
company.add_employee(employee2)
company.add_employee(employee3)

company.add_employee(manager)

manager.assign_department(employee1, "Engineering")
manager.assign_department(employee2, "Engineering")
manager.assign_department(employee3, "HR")

company.list_employees_in_department("Engineering")