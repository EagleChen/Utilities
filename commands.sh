# remove all stopped containers
for id in `sudo docker ps -a | grep ago | awk '{print $1}'`; do sudo docker rm $id; done
