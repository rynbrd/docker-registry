Docker Registry
===============
Docker image that runs a Docker registry with local storage. Uses
phusion/baseimage as the base image. Runs the dotcloud docker-registry. Uses
sqlalchemy with sqlite as the index backend.

Building
--------
As easy as clone and build:

    git clone https://github.com/BlueDragonX/docker-registry.git
    docker build --rm -t bluedragonx/registry docker-registry

Running
-------
The Flask secret key should be set on the command line. All registry files,
including the sqlite index, are stored in /data. It is recommended that this
location be a volume. Example: 

    docker run -P -e SECRET_KEY=supersecretkey -v /tmp/registry:/data bluedragonx/registry

License
-------
Copyright (c) 2014 Ryan Bourgeois. Licensed under BSD-Modified. See the LICENSE
file for a copy of the license.
