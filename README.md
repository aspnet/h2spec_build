# What?

This repo builds h2spec in Docker. Builds Linux/Darwin/Windows binaries in one go! (Thanks to `GOOS` variable.)

- Built binaries appear in `./out/release` directory.
- Built nupgk file appear in `./bin/Debug` directory

# Requirements

- Docker (For creating the binaries)
- Dotnet SDK 2.x (For packing the nuget file)

# Update h2spec

- Update `make_all.sh` file to reflect h2spec commit sha you want to build
- Update `h2spec.nuspec` to bump the nuget package version
- (Optional) Update `Dockerfile` to use a newer Go base image

# How to build

## Linux/Mac

`./build.sh`

## Windows

`build.cmd`
