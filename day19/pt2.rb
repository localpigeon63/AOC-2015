input = File.readlines("./day19/input.txt")

medicine = input.last

starting_molecule = "e"

substitutions_list = input[0..-3].map {|item| item.chomp}

SUBSTITUTIONS = {}
substitutions_list.each do |molecule|
    key, value = molecule.split(" => ")
    if SUBSTITUTIONS.key?(key)
        SUBSTITUTIONS[key].append(value)
    else
        SUBSTITUTIONS[key] = [value]
    end
end

def substitute(medicine)
    results = []
    SUBSTITUTIONS.each do |key, values|
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
    results
end

def fabricate(molecule, medicine, counter)
    puts "counter: #{counter} molecule.len: #{molecule.length}"
    sub_results = substitute(molecule)
    sub_results.each do |current|
        if current == medicine
            puts "found medicine at " + counter.to_s
            return counter
        elsif molecule.length > medicine.length
            puts "s"
            next
        else
            result = fabricate(current, medicine, counter + 1)
            if result
                return result
            end
        end
    end
    return nil
end

result = fabricate(starting_molecule, medicine, 1)
puts result