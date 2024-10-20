input = File.read("./day01/input.txt")
directions = input.chars

starting_number = 0

directions.each_with_index do |direction, index|
    if direction == "("
        starting_number += 1
    else
        starting_number -= 1
    end
    if starting_number == -1
        puts index + 1
        return
    end
end

#take each item of the array
#if ( +1 to starting_number
#if ) -1 from starting_number

#check if new_number is -1
#if so, return position of array item
#if not, move on to next item

#end with index + 1 because the array is zero-indexed, but the problem asks for the number of floors, which is regular person counting and therefore not zero-indexed.