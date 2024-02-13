# Phoenix-1.6-deployment
Phoenix 1.6 deployment from Mac (Local development) to Ubuntu server. Docker is used in local machine for generating the build files including ERTS 11.1.4. Build files are pushed to Ubuntu Server and run. Docker is not used on remote server.

build ubuntu_phoenix-1.14.0:latest image with
ubuntu bionic + erlang 24.3.4.5 + elixir 1.14.0

use the image in consecutive step to reach the final image:

docker build --rm -t ubuntu_1804_curl -f Dockerfile.curl . && \
docker build --rm -t ubuntu_1804_scm -f Dockerfile.scm . && \
docker build --rm -t ubuntu_1804_processed -f Dockerfile.ubuntu . && \
docker buildx build --platform=linux/amd64 --rm -t erlang23344 -f Dockerfile.erlang . && \
docker build --rm -t elixir1140_23 -f Dockerfile.elixir . && \
docker build --rm -t elixir1140_23_mix -f Dockerfile.mix .

```bash
$ docker build --rm -t ubuntu_1804_curl -f Dockerfile.curl .
```

```bash
$ docker build --rm -t ubuntu_1804_scm -f Dockerfile.scm .
```

```bash
$ docker build --rm -t ubuntu_1804_processed -f Dockerfile.ubuntu .
```

```bash
$ docker buildx build --platform=linux/amd64 --rm -t erlang23344 -f Dockerfile.erlang .
```

```bash
$ docker build --rm -t elixir1140_23 -f Dockerfile.elixir .
```

```bash
$ docker build --rm -t elixir1140_23_mix -f Dockerfile.mix .
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
$ docker run ubuntu_1804_curl:latest cat /etc/lsb-release
```


## update setup for local environment for release - Mac OS


