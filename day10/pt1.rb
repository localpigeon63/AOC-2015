input = "1321131112"

def see(input)
    input.scan(/((\d)\2*)/).map(&:first)
end

def say(numbers)
    numbers.map do |number|
        value = number.length.to_s + number[0].to_s
    end
end

40.times do |i|
    input = say(see(input)).join
    puts i
end

puts input.length




#iterate through the array.
#join length of array and first number in array
#put into new array
#turn that array into a single string with .join() - separator in parentheses
#pt2 was just iterate 50 times - slower, but same method.