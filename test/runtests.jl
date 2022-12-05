using Test, Mkcert

@testset begin
	@test length(read(`$mkcert --help`, String)) > 0
end