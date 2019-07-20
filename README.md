# Phoenix-1.4-deployment
Phoenix 1.4 deployment from Mac (Local development) to Ubuntu server. Docker is used in local machine for generating the build files including ERTS 10.1.1. Build files are pushed to Ubuntu Server and run. Docker is not used on remote server.

build ubuntu_phoenix-1.4.0:latest image with
ubuntu 18.04 + erlang 21.2.4 + elixir 1.8.0

use the image in consecutive step to reach the final image:

docker build --rm -t ubuntu_18042_curl -f Dockerfile.curl . && \
docker build --rm -t ubuntu_18042_scm -f Dockerfile.scm . && \
docker build --rm -t ubuntu_18042_processed -f Dockerfile.ubuntu . && \
docker build --rm -t erlang2207 -f Dockerfile.erlang . && \
docker build --rm -t elixir191 -f Dockerfile.elixir . && \
docker build --rm -t elixir191_mix -f Dockerfile.mix .

```bash
$ docker build --rm -t ubuntu_18041_curl -f Dockerfile.curl .
```

```bash
$ docker build --rm -t ubuntu_18041_scm -f Dockerfile.scm .
```

```bash
$ docker build --rm -t ubuntu_18041_processed -f Dockerfile.ubuntu .
```

```bash
$ docker build --rm -t erlang2204 -f Dockerfile.erlang .
```

```bash
$ docker build --rm -t elixir190 -f Dockerfile.elixir .
```

```bash
$ docker build --rm -t elixir190_mix -f Dockerfile.mix .
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

to check the linux versin running in the image:

```bash
$ docker run ubuntu_18041_curl:latest cat /etc/lsb-release
```


## update setup for local environment for release - Mac OS


