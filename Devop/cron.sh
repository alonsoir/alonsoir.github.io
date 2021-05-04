#!/bin/sh
if grep -Fqe "Image is up to date" << EOF
`docker pull ubuntu:latest`
EOF
then
    echo "no update, just do cleaning"
    docker system prune --force
else
    echo "newest exist, recompose!"
    cd /path/to/your/compose/file
    docker-compose down --volumes
    docker-compose up -d
fi
