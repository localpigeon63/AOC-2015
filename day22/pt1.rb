# can only cast spells for which have mana
# cannot cast a spell currently in operation
# spells have effect on both own and enemy turns

# permutations far too big - will have to do a breadth-first search

# game-state: my HP, boss HP, lasting effects, mana spent, whose turn
# use queue and loop method for BFS
# initial state is at top of queue (queue is an array)
# then loop until solution found
# initial state off the queue (pop), check if won (if so, record mana)
# if not, generate next states (i.e. from valid spells)
# add states to queue (prepend)