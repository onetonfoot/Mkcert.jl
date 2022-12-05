module Mkcert

using Pkg.Artifacts

export mkcert

const mkcert = joinpath(artifact"mkcert", "mkcert")	
chmod(mkcert, 0o777)

end # module Mkcert
