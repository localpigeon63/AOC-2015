input = File.readlines("./day05/input.txt")

def repeated_pairs(line)
    pairs = []
    result = []
      line.chars.each_with_index do |char, index|
        break if index >= line.length - 1
        pairs << { pair: char + line[index + 1], index: index }
      end
      grouped_hash = pairs.group_by { |hash| hash[:pair] }
      grouped_hash.each do |pair, occurrences|
      indexes = occurrences.map { |h| h[:index] }
      indexes.combination(2).each do |i, j|
        return true if (i - j).abs > 1
      end
      end
      false
    end

def repeats(line)
    line.scan(/([a-z])\w\1/).any?
end

def nice?(line)
 repeated_pairs(line) &&
 repeats(line)
end

full_result = input.map do |line|
    nice?(line)
end

pp full_result.count(true)