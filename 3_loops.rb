# arr = [1,2,3,5,4,8,9]
# 
# for x in arr 
    # print "#{x} "
# end
 

# for i in 5..10
    # puts i
# end

# 5.times {|i|
#     puts i  # prints the index
# }

# ******************************

# sum = 0

# for num in 1..100
#     if num%2==0
#         sum += num    
#     end
# end
# puts sum

# *********************************


# puts "Enter a number"
# num = gets.chomp.to_i
# 
# for i in 1..10
    # puts "#{num} X #{i} = #{num*i}"
# end


# *******************

for num in 2..50

is_prime = true

    for i in 2..Math.sqrt(num)
        if num % i == 0
            is_prime = false
            break
        end
    end
    if is_prime
        puts num
    end
end




