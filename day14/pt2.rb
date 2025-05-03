input = File.readlines("./day14/input.txt")

distances = []

input.each do |reindeer|
    numbers = reindeer.scan(/\d+/).map(&:to_i)
    speed = numbers[0]
    flytime = numbers[1]
    resttime = numbers[2]
    second_counter = 1
    total_distance = 0
    distance_tracker = []

    2503.times do
        if second_counter <= flytime
            total_distance = total_distance + speed
        elsif second_counter == flytime + resttime
            second_counter = 0
        end
        second_counter = second_counter + 1
        distance_tracker << total_distance
    end
    distances << distance_tracker
end

leaderboard = []

distances.each do |distance_tracker|
    points = 0
    distance_tracker.each_with_index do |distance, index|
        all_distances = distances.map { |arr| arr[index] }
        if distance == all_distances.max
            points = points + 1
        end
    end
    leaderboard << points
end

puts leaderboard.max