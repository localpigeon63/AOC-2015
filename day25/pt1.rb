#1.	Initialise infinite grid
#2.	Set 0,0 to starting number

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
#Meanwhile y counts up to max_number
#When x gets to 0, max_number = max_number + 1, and restart from there (with x at max_number and y at 0)
