houses = Array.new(1000000, 0)

elf_numbers = 1..1000000

results = []

elf_numbers.each do |elf_number|
    houses.each_with_index do |house, i|
        if i > 0 &&
            (i % elf_number) == 0
            houses[i] = house + (elf_number * 10)
        end
        if house >= 33100000
            results << i
        end
    end
end

puts results.min