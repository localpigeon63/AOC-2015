input = File.readlines("./day14/input.txt")

distances = []

input.each do |reindeer|
    numbers = reindeer.scan(/\d+/).map(&:to_i)
    speed = numbers[0]
    flytime = numbers[1]
    resttime = numbers[2]
    second_counter = 1
    total_distance = 0

    2503.times do
        if second_counter <= flytime
            total_distance = total_distance + speed
        elsif second_counter == flytime + resttime
            second_counter = 0
        end
    second_counter = second_counter + 1
    end
distances << total_distance
end

puts distances.sort[-1]
pp distances