input = File.read("./day12/input.txt")

def remove_red(input)
    input.gsub(/\{.[^\{]*red.[^\}]*\}/, '')
end

numbers_without_red = remove_red(input)

numbers = numbers_without_red.scan(/-?\d+/)

integers = numbers.map do |number|
    number.to_i
end

answer = integers.sum

puts answer

# does not work - conclusion: bin it and start again for part 2 using JSON format, key-value pairs, and witchcraft.