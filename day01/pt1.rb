lines = File.read('./input.txt')
pp lines

starting_number = 0
ups = lines.count("(")
downs = lines.count(")")

final_number = starting_number + ups - downs
puts final_number