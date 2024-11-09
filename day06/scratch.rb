line = "turn on 0,0 through 2,2"

start_point = "0,0"
end_point = "2,2"

def generate_rectangle (start_point, end_point)
    x1, y1 = start_point.split(",").map(&:to_i)
    x2, y2 = end_point.split(",").map(&:to_i)
    x_min, x_max = [x1, x2].min, [x1, x2].max
    y_min, y_max = [y1, y2].min, [y1, y2].max
    coordinates = []
    (x_min..x_max).each do |x|
        (y_min..y_max).each do |y|
            coordinates << [x, y]
        end
    end
    coordinates
end

pp generate_rectangle(start_point, end_point)