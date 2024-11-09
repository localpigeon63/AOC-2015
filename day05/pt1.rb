input = File.readlines("./day05/input.txt")

def naughty?(line)
    line =~ /ab|cd|pq|xy/
end

def nice?(line)
    line.scan(/[aeiou]/).count >= 3 &&
    line.chars.count > line.squeeze.chars.count
end

result = input.select do |line|
    !naughty?(line) &&
    nice?(line)
end

pp result.count

# feed each line into a block
# if nice send to array
# how many items in array

# does not contain ab, cd, pq, xy even if they are part of one of the other requirements
# contains 3x aeiou
# contains double letter
