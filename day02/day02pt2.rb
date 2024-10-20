ribbon_order = []

File.foreach('./day02/input.txt') do |line|
    each_dimension = line.split("x")
    line_as_numbers = each_dimension.map do |item|
        item.to_i
    end
    sorted_array = line_as_numbers.sort
    box_ribbon = (sorted_array[0] * 2) + (sorted_array[1] * 2)
    bow_length = sorted_array[0] * sorted_array [1] * sorted_array [2]
    ribbon_length = box_ribbon + bow_length
    ribbon_order << ribbon_length 
end

result = ribbon_order.sum

puts result

#A present with dimensions 2x3x4 requires 2+2+3+3 = 10 feet of ribbon to wrap the present 
#plus 2*3*4 = 24 feet of ribbon for the bow, for a total of 34 feet.