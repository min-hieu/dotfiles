docker run -it \
    --ipc=host \
    --pid=host \
    --restart unless-stopped \
    -p 10004:22 \
    --name charlie-main\
    -h lab\
    -e DISPLAY=$DISPLAY \
    -v $HOME/docker_home:/home/charlie \
    charlimage:2.0\
    /bin/zsh
