input = File.readlines("./day17/input.txt")

input.map! do |item|
    item.chomp.to_i
end

pp input

combinations = []

(1..20).each do |n|
    input.combination(n) do |combination|
        combinations << combination
    end
end

combinations.select! do |combination|
    combination.sum == 150
end

puts combinations.count