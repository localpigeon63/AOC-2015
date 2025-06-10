row = 1
column = 1
value = 20151125
max_row = 1
target_row = 2947
target_column = 3029

until row ==target_row &&
    column == target_column do
        row = row - 1
        if row < 1
            max_row = max_row + 1
            row = max_row
        end
        column = column + 1
        if column > max_row - 1
            column = 1
        end
        value = (value * 252533) % 33554393
end 

puts value



#1.	Initialise infinite grid (i.e. a hash)
# don't actually need a hash - just needs variables, with row = 1, column = 1, value = starting value

#3.	Start loop (while indices are less than target index do – remember target index will need to be -1 because example grid is not zero-indexed):
#4.	Grab number from current index (prev_number)
#5.	Set position to next index
#6.	Calculate number for index (prev_number * 252533, modulo 33554393)

#Index movements in zero-indexed array:
#0,0
#1,0
#0,1
#2,0
#1,1
#0,2
#3,0
#2,1
#1,2
#0,3

#So need to set x to max_number and count down from there.
#Meanwhile y counts up to max_numbe