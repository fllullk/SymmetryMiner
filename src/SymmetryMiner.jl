module SymmetryMiner

# Include internal modules
include("symmetry_checks.jl")

# Use the submodules internally
using .SymmetryChecks

# Re-export key functions for the end user
export compute_symmetries

end # module
