# This is just an outline for now.

# Init random pool

# Calculate Fitness
# I should make a Distance module for this
# --StringDistances.jl
# -----dist(perm1, perm2) -> Int
# -----generate_dist_matrix(n) -> Generator?
# -----fitness(perm1) -> Int
#
# I should also have a module for each 
# mutation that I want to introduce.
# This should keep things nice and contained
# So I can swap out and try different mutations
# 
# It's important to include the 'Elite' items
# from each generation. 
#
# Mutate these elements to make a new population
# Repeat.
#
# I may include special selection criterion later
# But for now I don't care. 
#



