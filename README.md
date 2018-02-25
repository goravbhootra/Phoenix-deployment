# Phoenix-1.3-deployment
Phoenix 1.3 deployment from Mac (Local development) to Ubuntu server. Docker is used in local machine for generating the build files including ERTS 9.2.1. Build files are pushed to Ubuntu Server and run. Docker is not used on remote server.

build ubuntu_phoenix-1.3.0:latest image with
ubuntu 16.04 + erlang 20.2.4 + elixir 1.6.1 + phoenix 1.3

```bash
$ docker build --rm -t ubuntu_phoenix-1.3.0 -f Dockerfile.ubuntu_phoenix .
```

use the image built in previous step and build image of the current app

```bash
$ docker build --rm -t my_app -f Dockerfile.build .
```

mount the prod release built in host i.e. in local project _build folder

```bash
$ docker run -it --rm --name my_app -v $(pwd)/_build/prod/rel/my_app:/my_app/_build/prod/rel/my_app my_app
```

rsync app to server

```bash
$ rsync -rtvzh --progress _build/prod/ user@1.2.3.4:/home/user/_build/prod
```

## update setup for local environment for release - Mac OS

## update setup for remote environment for release - Ubuntu 16.04 server
