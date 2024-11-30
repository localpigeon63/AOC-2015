input = File.readlines("./day08/input.txt")

full_counts = []
evaluated_counts = []

input.each do |line|
    full_count = line.chomp.chars.count
    evaluated_count = eval(line).chomp.chars.count
    full_counts << full_count
    evaluated_counts << evaluated_count
end

def hello
    puts "hi"
end

result = full_counts.sum - evaluated_counts.sum

puts result
