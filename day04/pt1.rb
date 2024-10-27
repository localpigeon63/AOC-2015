require 'digest'

prompt = "iwrupvqb"
starting_number = 1

loop do
input = prompt + starting_number.to_s
hash = Digest::MD5.hexdigest(input)
    if
    hash.start_with?("00000")
    puts starting_number    
    return
    else 
    starting_number = starting_number + 1
    end
end