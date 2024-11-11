numbers = input.scan(/((\d)\2*)/).map(&:first)
#=> ["111", "22", "1"]


#iterate through the array.
#join length of array and first number in array
#put into new array
#turn that array into a single string with .join() - separator in parentheses
new_input = []
numbers.each do |repeat|
    value = repeat.length + repeat.first
    new_input << value
end

new_input.join()