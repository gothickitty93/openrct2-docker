## Very much WIP! Only basics here right now

# openrct2-docker
A hacked together solution to get openrct2 running on my server in a docker container

Clone the repository into the directory you want to run the container in.
You may want to discard the license and readme files.
Edit the $USER parts to be the same user as you run the container under.
run sudo docker compose build
then run sudo docker compose up -d
then enter the container with sudo docker exec -it openrct2-docker bash
