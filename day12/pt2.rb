input = File.read("./day12/input.txt").slice(1..-2)

totals = []

def extract_numbers(x)
    numbers = x.scan(/-?\d+/).map do |number|
        number.to_i
    end
    return numbers
end

open_parentheses = 0
close_parentheses = 0
string = ''
strings = []

input.each_char do |c|
    if c.match('{')
        open_parentheses = open_parentheses + 1
    elsif c.match('}')
        close_parentheses = close_parentheses + 1
    end
    if open_parentheses == close_parentheses && open_parentheses > 0
        string << c
        strings << string
        string = ''
        open_parentheses = 0
        close_parentheses = 0
    else
        string << c
    end
end

pp strings.count

strings.each do |line|
    if 
        !line.include?('red') ||
        line.count('red') == line.scan(/\[[^\]]*\bred\b[^\]]*\]/).length
        totals << extract_numbers(line).sum
    end
end

pp totals.sum

