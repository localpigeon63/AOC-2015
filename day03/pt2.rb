coordinates = (File.read("./day03/input.txt")).chomp.chars

santa_position = [0,0]
robo_position = [0, 0]
santa_visits = [[0,0]]
robo_visits = [[0,0]]

santa_stops = coordinates.select.with_index { |_, index| index.even? }
robo_stops = coordinates.select.with_index { |_, index| index.odd? }

santa_stops.map do |direction|
    if direction == "^"
        new_position = santa_position[0], (santa_position[1] -= 1)
    elsif direction == "v"
        new_position = santa_position[0], (santa_position[1] += 1)
    elsif direction == ">"
        new_position = (santa_position[0] += 1), santa_position[1]
    else 
        new_position = (santa_position[0] -= 1), santa_position[1]
    end
    santa_visits << new_position 
end

robo_stops.map do |direction|
    if direction == "^"
        new_position = robo_position[0], (robo_position[1] -= 1)
    elsif direction == "v"
        new_position = robo_position[0], (robo_position[1] += 1)
    elsif direction == ">"
        new_position = (robo_position[0] += 1), robo_position[1]
    else 
        new_position = (robo_position[0] -= 1), robo_position[1]
    end
    robo_visits << new_position 
end

all_houses = santa_visits.concat(robo_visits)

total_houses = all_houses.uniq.count

pp total_houses