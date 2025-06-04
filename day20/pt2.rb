def calculate_gifts(n)
    gifts = 0
    valid_numbers = []
    (1..n).each do |x|
        if n % x == 0 && n / x <= 50
            valid_numbers << x
        end
    end
    gifts = gifts + (valid_numbers[0..49].sum * 11)
    return gifts
end

house_number = 550000

loop do
     puts house_number if house_number % 1000 == 0
     gifts = calculate_gifts(house_number)
    if gifts >= 33100000
        break
    else
    house_number += 1
    end
end

puts house_number