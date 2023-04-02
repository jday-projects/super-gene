
module Superpermutations

export overlap

# Note: overlap(a, b) =/= overlap(b, a)
function overlap(a, b)

    for i in 1:length(a)
        if a[(end-i+1):end] == b[begin:(begin+i-1)]
            overlap_amount = i
            return(overlap_amount)
        end
    end

    return(0)
end

function

end
