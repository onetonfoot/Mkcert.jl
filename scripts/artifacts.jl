using ArtifactUtils, Artifacts
using Base.BinaryPlatforms

# https://github.com/JuliaLang/julia/issues/38599
BinaryPlatforms.host_triplet()

# Put this in .ssh/config temporarily
# Host gist.github.com
#     StrictHostKeyChecking no

for i in [
"mkcert-v1.4.4-darwin-amd64"
"mkcert-v1.4.4-windows-amd64.exe"
"mkcert-v1.4.4-linux-amd64"
"mkcert-v1.4.4-linux-arm64"
"mkcert-v1.4.4-linux-arm"
]
	name, version, _platform, arch = split(i, "-")
	platform =  Platform(string(arch), string(_platform))
	dir = mktempdir()
	url = "https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/$i"
	run(Cmd(
		`wget $url -O mkcert`, 
		dir=dir
	))
	id = artifact_from_directory(dir)
	gist = upload_to_gist(id, private=false)
	add_artifact!(
		"Artifacts.toml",
		"mkcert",
		gist,
		platform=platform,
	)
end