input = File.readlines("./day08/input.txt")

full_counts = []
inspected_counts = []
inspected_lines = []

input.each do |line|
    chomped_line = line.chomp
    full_count = chomped_line.chars.count
    inspected_count = chomped_line.inspect.chars.count
    full_counts << full_count
    inspected_counts << inspected_count

end

puts inspected_counts.sum - full_counts.sum