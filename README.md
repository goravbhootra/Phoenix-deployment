# Phoenix-1.3-deployment
Phoenix 1.3 deployment from Mac (Local development) to Ubuntu server. Docker is used in local machine for generating the build files including ERTS 9.2.1. Build files are pushed to Ubuntu Server and run. Docker is not used on remote server.

build ubuntu_phoenix-1.3.0:latest image with
ubuntu 16.04 + erlang 21.0.4 + elixir 1.6.6 + phoenix master branch

use the image in consecutive step to reach the final image:

```bash
$ docker build --rm -t ubuntu_1604_curl -f Dockerfile.curl .
```

```bash
$ docker build --rm -t ubuntu_1604_scm -f Dockerfile.scm .
```

```bash
$ docker build --rm -t ubuntu_1604_processed -f Dockerfile.ubuntu .
```

```bash
$ docker build --rm -t erlang2108 -f Dockerfile.erlang .
```

```bash
$ docker build --rm -t elixir173 -f Dockerfile.elixir .
```

```bash
$ docker build --rm -t elixir173_mix -f Dockerfile.mix .
```

---

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
