input = File.read("./day12/input.txt")

numbers = input.scan(/-?\d+/)

integers = numbers.map do |number|
    number.to_i
end

answer = integers.sum

pp answer