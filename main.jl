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
# Best overlap I'm looking for
# n=3 -> 9
# n=4 -> 63
# n=5 -> 447
# n=6 -> 3448
# n=7 -> 29396
# n=8 -> 276355

include("Superpermutations.jl")
include("Mutations1.jl")

using .Superpermutations
using .Mutations1
using StatsBase
using Combinatorics

object_count = 4 # number of elements in low permutation
high_perm_length = factorial(object_count)
generation_count = 1000
best_values = zeros(generation_count)
population_size = 100
elite_count = 20
dist_matrix = object_count .-  generate_similarity_matrix(object_count)
population = [sample(1:high_perm_length, high_perm_length, replace=false) for i in 1:population_size]

for i in 1:generation_count

    global population
    global best_values

    #Calculate fitness
    fitness_vals = [high_perm_fitness(i, dist_matrix) for i in population]
    #Sort based on fitness
    population = population[sortperm(fitness_vals)]

    #Save off best
    best_values[i] = minimum(fitness_vals)
    
    #Take the top contenders
    elite_members = copy(population[1:elite_count])
    
    population = copy(elite_members)

    #Mutate to fill out new population
    for j in (elite_count+1):population_size
        global population
        #global elite_members
        push!(population, mutate(sample(elite_members, 1)[1]))
        unique!(population)
    end

end

#print(population)
using Plots
plot(best_values)


