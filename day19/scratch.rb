s = "121212"

a = []

s.gsub("2") do |each|
    r = s.gsub("3")
    a << r
end

puts a