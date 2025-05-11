input = File.readlines("./day19/input.txt")

medicine = input.last

substitutions_list = input[0..-3].map {|item| item.chomp}

substitutions = {}
substitutions_list.each do |molecule|
    key, value = molecule.split(" => ")
    if substitutions.key?(key)
        substitutions[key].append(value)
    else
        substitutions[key] = [value]
    end
end
    
results = []

substitutions.each do |key, values|
    starting_position = 0
    while match = medicine.index(key, starting_position) do
        match_length = key.length
        values.each do |value|
            medicine_copy = medicine.dup
            medicine_copy[match..(match_length + match - 1)] = value
            results << medicine_copy
        end
        starting_position = match + 1
    end
end

pp results.uniq.count
