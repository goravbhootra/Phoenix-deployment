# Phoenix-1.4-deployment
Phoenix 1.4 deployment from Mac (Local development) to Ubuntu server. Docker is used in local machine for generating the build files including ERTS 10.2.8. Build files are pushed to Ubuntu Server and run. Docker is not used on remote server.

build ubuntu_phoenix-1.4.0:latest image with
ubuntu 18.04 + erlang 23.0.2 + elixir 1.10.3

use the image in consecutive step to reach the final image:

docker build --rm -t ubuntu_18042_curl -f Dockerfile.curl . && \
docker build --rm -t ubuntu_18042_scm -f Dockerfile.scm . && \
docker build --rm -t ubuntu_18042_processed -f Dockerfile.ubuntu . && \
docker build --rm -t erlang2302 -f Dockerfile.erlang . && \
docker build --rm -t elixir1103 -f Dockerfile.elixir . && \
docker build --rm -t elixir1103_mix -f Dockerfile.mix .

```bash
$ docker build --rm -t ubuntu_18042_curl -f Dockerfile.curl .
```

```bash
$ docker build --rm -t ubuntu_18042_scm -f Dockerfile.scm .
```

```bash
$ docker build --rm -t ubuntu_18042_processed -f Dockerfile.ubuntu .
```

```bash
$ docker build --rm -t erlang2215 -f Dockerfile.erlang .
```

```bash
$ docker build --rm -t elixir192 -f Dockerfile.elixir .
```

```bash
$ docker build --rm -t elixir192_mix -f Dockerfile.mix .
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
$ docker run ubuntu_18042_curl:latest cat /etc/lsb-release
```


## update setup for local environment for release - Mac OS


