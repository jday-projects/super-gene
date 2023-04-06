
module Mutations1

using StatsBase
export mutate

function mutate(high_perm)

perm_length = length(high_perm)

    if perm_length <= 1
        println("Bad Input $high_perm")
        return()
    end

perm_copy = copy(high_perm)
indexes = sample(1:perm_length, 2, replace = false, ordered = true)
index_range = indexes[1]:indexes[2]
perm_copy[index_range] = perm_copy[reverse(index_range)]
return(perm_copy)
end

end
