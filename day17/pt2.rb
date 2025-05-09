input = File.readlines("./day17/input.txt")

input.map! do |item|
    item.chomp.to_i
end

combinations = []

(1..20).each do |n|
    input.combination(n) do |combination|
        combinations << combination
    end
end

combinations.select! do |combination|
    combination.sum == 150
end

combination_sizes = []

combinations.each do |combination|
    combination_sizes << combination.count
end

lowest_combination = combination_sizes.min
lowest_combination_counter = 0

combinations.each do |combination|
    if combination.count == lowest_combination
        lowest_combination_counter += 1
    end
end

puts lowest_combination_counter