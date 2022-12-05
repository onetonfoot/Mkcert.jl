module Mkcert

using Pkg.Artifacts

export mkcert

const mkcert = joinpath(artifact"mkcert", "mkcert")	

end # module Mkcert
