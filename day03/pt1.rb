coordinates = (File.read("./day03/input.txt")).chomp.chars

position = [0,0]
visits = [[0,0]]

coordinates.map do |direction|
    if direction == "^"
        new_position = position[0], (position[1] -= 1)
    elsif direction == "v"
        new_position = position[0], (position[1] += 1)
    elsif direction == ">"
        new_position = (position[0] -= 1), position[1]
    else 
        new_position = (position[0] += 1), position[1]
    end
    visits << new_position 
end

total_houses = visits.uniq.count

pp total_houses
    