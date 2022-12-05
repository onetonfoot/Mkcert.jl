using Test, Mkcert

@testset "mkcert" begin
	@test length(read(`$mkcert --help`, String)) > 0
end