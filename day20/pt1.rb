def calculate_gifts(n)
    gifts = 0
    (1..n).each do |x|
        if n % x == 0
            gifts = gifts + (x * 10)
        end
    end
    return gifts
end

house_number = 750000

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



# working but very slow:

# houses = Array.new(1000000, 0)

# elf_numbers = 1..1000000

# results = []

# elf_numbers.each do |elf_number|
#     puts elf_number
#     houses.each_with_index do |house, i|
#         if i > 0 &&
#             (i % elf_number) == 0
#             houses[i] = house + (elf_number * 10)
#         end
#         if house >= 33100000
#             results << i
#         end
#     end
# end

# puts results.min