module SymmetryChecks

export compute_symmetries

function compute_symmetries(mat::Matrix{Int})::Vector{Bool}
    n, m = size(mat)
    @assert n == m "Matrix must be square"

    # Precompute transforms
    t_mat = transpose(mat)
    rot90 = rotl90(mat)
    rot180 = rotl90(rot90)

    # Horizontal
    horizontal = mat[end:-1:1, :]

    # Vertical
    vertical = mat[:, end:-1:1]

    return [
        mat == t_mat,                       # 0: main diagonal
        rot90 == transpose(rot90),          # 1: anti-diagonal
        mat == horizontal,                  # 2: horizontal
        mat == vertical,                    # 3: vertical
        mat == rot90,                       # 4: rotation 90°
        mat == rot180                       # 5: rotation 180°
    ]
end

end # module
