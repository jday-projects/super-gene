
module Superpermutations

export overlap
export generate_similarity_matrix
export high_perm_fitness

# Note: overlap(a, b) =/= overlap(b, a)
function overlap(low_perm1, low_perm2)

    for i in 1:length(low_perm1)
        if low_perm1[(end-i+1):end] == low_perm2[begin:(begin+i-1)]
            overlap_amount = i
            return(overlap_amount)
        end
    end

    #Through loow with NO OVERLAP
    return(0)
end

function generate_similarity_matrix(n)

    similarity_matrix = [overlap(i,j) for i in permutations(1:n), j in permutations(1:n)]

    return(similarity_matrix)

end

function high_perm_fitness(high_perm, n)

    total_overlap = 0
    similarity_matrix = generate_similarity_matrix(n)
    for i in 2:length(high_perm)
        global total_overlap += similarity_matrix[high_perm[i-1], high_perm[i]]
    end

    return(total_overlap)

end

end
