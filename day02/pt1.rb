area = []

File.foreach('./day02/input.txt') do |line|
    pp line
    each_dimension = line.split("x")
    line_as_numbers = each_dimension.map do |item|
        item.to_i
    end
    w, h, l = line_as_numbers
    box_area = [2*l*w, 2*w*h, 2*h*l]
    total_box_area = box_area.sum
    wrapping_needed = total_box_area + (box_area.min / 2)
    area << wrapping_needed 
end

result = area.sum

puts result

