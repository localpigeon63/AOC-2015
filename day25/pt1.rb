row = 1
column = 1
value = 20151125
target_row = 2947
target_column = 3029
multiplier = 252533
modulo = 33554393

# number of entries in each diagonal is equal to the sum of each pair of indices, -1
current_diagonal = (target_row + target_column) - 1

#formula for calculating triangular numbers, calculating number of indices in all complete diagonals
previous_indices = ((current_diagonal - 1) * current_diagonal) / 2

# works out how far into current (incomplete) diagonal the target position lies
offset = current_diagonal - target_row

# adds up how far into the total number list the target position lies
target_position = previous_indices + offset + 1

(target_position - 1).times do 
    value = (value * multiplier) % modulo
end

puts value

# For the future, look into modular exponentiation using .pow as an alternative to .times do