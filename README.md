fake-s3
=======

We're deep in forktown here. Ok so here's what happened:
1. jubos created the original, amazing [fake-s3](https://github.com/jubos/fake-s3/)
2. In order to fix [this bug](https://github.com/jubos/fake-s3/issues/22), saltzmanjoelh [forked it](https://github.com/saltzmanjoelh/fake-s3)
3. lphoward maintains a Dockerfile for the original S3: [github](https://github.com/lphoward/fake-s3/), [dockerhub](https://hub.docker.com/r/lphoward/fake-s3/)
4. I needed a Dockerised, bug-fixed version of `fake-s3`, so I forked #3, and modified the Dockerfile to point at #2 instead of #1

I'm so sorry. This is the nature of open source. I don't begrudge anyone their part in this mess.

Dockerfile for
[camjackson/fake-s3](https://registry.hub.docker.com/u/camjackson/fake-s3/)
on [Docker Hub](https://registry.hub.docker.com).

Deploys [fake-s3](https://github.com/jubos/fake-s3) in a Docker container.

To create a deployment:

        docker run --name my_s3 -d camjackson/fake-s3

Service exposed on port 4569.  Credentials are ignored.
See [fake-s3](https://github.com/jubos/fake-s3) README for details/limitations.

If you want fake-s3 to be exposed on your Docker host on port 4569, then

        docker run --name my_s3 -p 4569:4569 -d camjackson/fake-s3

If you want the container to use a volume, then

        docker run --name my_s3 -v /fakes3_root -d camjackson/fake-s3

The fake-s3 root directory will then be added as a volume on the Docker host.  To get the volume

        docker inspect --format "{{range .Mounts}}{{.Source}}{{end}}" my_s3
