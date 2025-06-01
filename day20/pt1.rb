houses = []

elf_number = 0

while elf_number < 10
houses.each_with_index do |house, i|
    if i % elf_number == 0
        house = house + (elf_number * 10)
    end
end
elf_number = elf_number + 1
end

pp houses