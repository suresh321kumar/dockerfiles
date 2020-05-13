mkdir empty && 
docker build -f debian.Dockerfile -t kompile-debian empty/ && 
rmdir empty
