input = File.read("./day12/input.txt").slice(1..-2)

input1 = '[1,2,3]'
input2 = '[1,{"c":"red","b":2},3]'
input3 = '{"d":"red","e":[1,2,3,4],"f":5}'
input4 = '[1,"red",5]'

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
    if c == '{'
        open_parentheses = open_parentheses + 1
    elsif c == '}'
        close_parentheses = close_parentheses + 1
    end
    string << c
    if open_parentheses == close_parentheses && open_parentheses > 0
        strings << string
        string = ''
        open_parentheses = 0
        close_parentheses = 0 
    end
end

strings << string.strip unless string.strip.empty?

pp strings.count
pp strings

strings.each do |line|
    if 
        !line.include?('red') ||
        line.count('red') == line.scan(/\[[^\[\]{}]*"red"[^\[\]{}]*\]/).length
        totals << extract_numbers(line).sum
    else
        line.gsub!(/\{[^{}]*"red"[^{}]*\}/, '')
        puts line.inspect
        totals << extract_numbers(line).sum
    end
end

pp totals.sum

