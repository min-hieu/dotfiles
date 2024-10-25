docker build -t charlimage:2.0 \
    --build-arg USER_NAME=charlie\
    --build-arg PASSWORD=1234 \
    --build-arg UID=$UID \
    --build-arg GID=$GID \
