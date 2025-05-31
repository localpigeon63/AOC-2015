input = File.readlines("./day9/input.txt")

atlas = {}
location_list = []

input.each do |line|
    locations = line.split(" = ")[0]
    distance = line.split(" = ")[1].chomp.to_i
    location_pair = locations.split(" to ").sort
    atlas[location_pair] = distance
    location_list << locations.split(" to ")[0]
    location_list << locations.split(" to ")[1]
end

location_list = location_list.uniq

routes = location_list.permutation.to_a

distances = []

routes.each do |route|
    interim_distance = []
    route.each_cons(2) do |location_1, location_2|
        location_pair = [location_1, location_2].sort
        interim_distance << atlas[location_pair]
    end
    distances << interim_distance.sum
end

puts distances.min
puts distances.max