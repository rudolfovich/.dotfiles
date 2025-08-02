ls -la
ls -laG
exit
docker run --name repo alpine/git clone https://github.com/docker/getting-started.git
docker cp repo:/git/getting-started/ .
ls -la
exit
exit
ulimit -a
launchctl limit maxfiles
exit
