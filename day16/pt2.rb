machine_list_input = File.readlines("./day16/machine_list.txt").each do |line|
    line.chomp!
end

machine_list = {}

machine_list_input.each do |item|
    item_name = item.split(":")[0].strip
    item_number = item.split(":")[1].to_i
    machine_list[item_name] = item_number
end

sue_list = File.readlines("./day16/sue_list.txt").each do |line|
    line.chomp!
end

sue_matrix = []

sue_list.each do |line|
    this_sue_name = line.split(":", 2)[0]
    this_sue_items = line.split(":", 2)[1].split(",")
    this_sue_items_hash = {}
    this_sue_items.each do |item|
        item_name = item.split(":")[0].strip
        item_number = item.split(":")[1].to_i
        this_sue_items_hash[item_name] = item_number
    end
sue_matrix << [this_sue_name, this_sue_items_hash]
end

sue_matrix.reject! do |sue_line|
    sue_items = sue_line[1]
    machine_list.any? do |key, value|
        sue_items.key?(key) && sue_items[key] != value
    end
end

puts sue_matrix