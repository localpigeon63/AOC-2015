field = File.readlines("./day18/input.txt").map do |line|
  line.chomp.chars
end

corners = [
  [0, 0], 
  [0, field[0].size - 1], 
  [field.size - 1, 0], 
  [field.size - 1, field[0].size - 1]
]

corners.each do |row, col|
  field[row][col] = "#"
end

def cell_value(field, row, column)
  field.dig(row, column)
end

def neighbours(field, row, column)
  directions = [
    [-1, -1], [-1, 0], [-1, 1],
    [ 0, -1],          [ 0, 1],
    [ 1, -1], [ 1, 0], [ 1, 1]
  ]

  directions.map do |row_diff, column_diff|
    target_row, target_column = row + row_diff, column + column_diff
    if target_row.between?(0, field.size - 1) && target_column.between?(0, field[0].size - 1)
      field[target_row][target_column]
    else
      nil
    end
  end
end

def next_life_stage(field)
  field.each_with_index.map do |row_array, row_index|
    row_array.each_with_index.map do |_item, column_index|
      corners = [[0,0], [0, field[0].size - 1], [field.size - 1, 0], [field.size - 1, field[0].size - 1]]
      if corners.include?([row_index, column_index])
        "#"
      else
        item_neighbours = neighbours(field, row_index, column_index)
      live_neighbours = item_neighbours.compact.count("#")
      current_value = field[row_index][column_index]  
        if current_value == "#"
            if [2, 3].include?(live_neighbours)
                "#"
            else
                "."
            end
        elsif current_value == "."
            if live_neighbours == 3
            "#"
            else
            "."
            end
        end
      end
    end
  end.to_a
end

100.times do
  field = next_life_stage(field)
end

lights_on = []

field.each do |row|
  lights_on << row.count("#")
end

puts lights_on.sum