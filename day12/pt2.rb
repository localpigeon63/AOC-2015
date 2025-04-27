haystack = File.read("./day12/input.txt")

# haystack = '{: {}, X, 4, :"red"}'

needle = ':"red"'

def find_open(index, haystack)
    open_counter = 0
    closing_counter = 0
    index = index - 1
    while index >= 0 do
        character = haystack[index]
        if character == "{"
            open_counter = open_counter + 1
        elsif character == "}"
            closing_counter = closing_counter + 1
        end
        if open_counter == closing_counter + 1
            return index
        end
        index = index - 1
    end
end
            
def find_close(index, haystack)
    open_counter = 0
    closing_counter = 0
    index = index + 1
    while index >= 0 do
        character = haystack[index]
        if character == "{"
            open_counter = open_counter + 1
        elsif character == "}"
            closing_counter = closing_counter + 1
        end
        if closing_counter == open_counter + 1
            return index
        end
        index = index + 1
    end
end

def extract_numbers(haystack)
    (haystack.scan(/-?\d+/)).map do |number|
        number.to_i
    end
end

while haystack.include?(needle) do
    starting_index = haystack.index(needle)
    open_paren = find_open(starting_index, haystack)
    close_paren = find_close(starting_index, haystack)
    haystack[open_paren..close_paren] = ''
end

pp extract_numbers(haystack).sum

# find :"red"
# scan backward to find {. Count instances of {}. For every } found, look for an additional {. Grab index.
# scan forward to find }. Etc. Grab index.
# gsub the lot.