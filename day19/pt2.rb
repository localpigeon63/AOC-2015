require 'benchmark'

input = File.readlines("./day19/input.txt")

starting_molecule = input.last

end_point = "e"

substitutions_list = input[0..-3].map {|item| item.chomp}

SUBSTITUTIONS = {}
substitutions_list.each do |molecule|
    value, key = molecule.split(" => ")
    if SUBSTITUTIONS.key?(key)
        SUBSTITUTIONS[key].append(value)
    else
        SUBSTITUTIONS[key] = [value]
    end
end

def substitute(end_point)
    results = []
    SUBSTITUTIONS.each do |key, values|
        starting_position = 0
        while match = end_point.index(key, starting_position) do
            match_length = key.length
            values.each do |value|
                end_point_copy = end_point.dup
                end_point_copy[match..(match_length + match - 1)] = value
                results << end_point_copy
            end
            starting_position = match + 1
        end
    end
    results
end

def fabricate(molecule, end_point, counter)
    # puts "counter: #{counter} molecule.len: #{molecule.length}"
    sub_results = substitute(molecule).sort_by do |element|
        element.length
    end
    if sub_results.empty?
        #puts "No subs left"
        return nil
    end
    puts "Checking #{sub_results.length}"

    sub_results.each do |current|
        puts "counter: #{counter}"
        #puts "Checks: #{$checks}" if $checks % 100000 == 0
        #raise "Not shrinking! #{molecule} -> #{current}" if current.length > molecule.length
        
        if current == end_point
            puts "found end_point at " + counter.to_s
            return counter
        else
            result = fabricate(current, end_point, counter + 1)
            return result if result
        end
    end
    #puts "Bailing after #{counter} steps"
    return nil
end

result = nil

#time = Benchmark.measure do
#  result = fabricate(starting_molecule, end_point, 1)
#end

puts result
puts time