md out\release
docker build -t h2spec_build:latest .
docker run -v %CD%\out:/OUT h2spec_build:latest cp -r /release /OUT