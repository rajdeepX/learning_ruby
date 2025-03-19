class Product 
    attr_accessor :name, :price
    def initialize(name, price)
        @name = name
        @price = price
    end
    def details
        puts "#{@name} : #{@price}"
    end
end

class Discounted_Product < Product
    def initialize(name, price, discount)
        super(name, price)
        @discount = discount
    end
    def calc_discounted_price
        @price - (@price * (@discount.to_f/100))
    end
    def discount_product_info
        puts "#{name} : #{price} (Discounted price: #{calc_discounted_price})"
    end
end

class Calculate_Cart_Total
    def calculate_total(product)
        product.sum {|item| item.is_a?(Discounted_Product) ? item.calc_discounted_price : item.price}
    end
end


class Cart
    attr_accessor :products
    def initialize
        @products = []
    end

    def add_products (products)
        @products << products
    end
    def list_products
        @products.each {|item| 
        if item.is_a?(Discounted_Product)
            puts "#{item.name} costs #{item.calc_discounted_price} (Discount)"
        else
            puts "#{item.name} costs #{item.price}"
        end
    }
    end
    def remove_products(name)
        @products.reject! {|item| item.name == name}
    end
end

class User
    attr_accessor :name, :cart, :total_price
    def initialize(name, total_price)
        @name = name
        @cart = Cart.new
        @total_price = total_price
    end
    def add_to_cart(product)
        @cart.add_products(product)
    end
    def view_cart
        @cart.list_products()
    end
    def remove_from_cart(name)
        @cart.remove_products(name)
    end
    def checkout
        puts "Checkout Items:"
        @cart.list_products()
        total = @total_price.calculate_total(@cart.products)
        puts "---------"
        puts "Your total amount is: #{total}"
        puts "---------"
        
    end

end



product1 = Product.new("Chips", 50)
product2 = Product.new("Chocolate", 150)
product3 = Product.new("Butter", 70)
dProduct1 = Discounted_Product.new("Laptop", 18000, 20)
dProduct2 = Discounted_Product.new("Watch", 1200, 40)

# product.details
dProduct1.discount_product_info

total_price = Calculate_Cart_Total.new
user = User.new("Sam", total_price)
user.add_to_cart(product1)
user.add_to_cart(product2)
user.add_to_cart(product3)
user.add_to_cart(dProduct1)
user.add_to_cart(dProduct2)
user.checkout()
