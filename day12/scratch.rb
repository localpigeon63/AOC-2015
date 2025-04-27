input = File.read("./day12/input.txt").slice(1..-2)
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
    strings
end

number_of_reds = []

strings.each do |string|
    number_of_reds << string.scan('red').count
end

pp number_of_reds.sort