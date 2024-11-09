
# split the input lines into three: instruction, start point, end point
# define how the instructions are executed
# build the rectangle
# iterate through the grid and apply instructions to all values which are in the rectangle
# return a new grid

lines = File.readlines('./day06/input.txt')

lights = Array.new(1000) { Array.new(1000, 0) }

def extract_data (line)
    instruction, points = line.split(/(?=\d)/, 2)
    start_point, end_point = points.strip.split(" through ")
    [instruction.strip, start_point, end_point]
end

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

def execute_instruction(lights, coordinates, instruction)
    coordinates.each do |x, y|
        light = lights[y][x]
        if instruction == 'turn on'
            lights[y][x] = [light + 1, 0].max
        elsif instruction == 'turn off'
            lights[y][x] = [light - 1, 0].max
        else # toggle
            lights[y][x] = [light + 2, 0].max
        end
    end
end

lines.each do |line|
    instruction, start_point, end_point = extract_data(line)
    coordinates = generate_rectangle(start_point, end_point)
    execute_instruction(lights, coordinates, instruction)
end

pp lights.flatten.sum