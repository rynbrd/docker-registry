Docker Registry
===============
Docker image that runs a Docker registry with local storage. Uses
phusion/baseimage as the base image. Runs the dotcloud docker-registry. Uses
sqlalchemy with sqlite as the index backend.

Building
--------
Nothing special, just do a normal docker build:

    docker build -t bluedragonx/docker-registry-local .

Running
-------
The Flask secret key should be set on the command line. All registry files,
including the sqlite index, are stored in /var/lib/docker/registry. It is
recommended that this location be a volume. Example: 

    docker run -p 5000:5000 -e SECRET_KEY=supersecretkey -v /tmp/registry:/var/lib/docker/registry bluedragonx/docker-registry-local

License
-------
Copyright (c) 2014 Ryan Bourgeois. Licensed under BSD-Modified. See the LICENSE
file for a copy of the license.
