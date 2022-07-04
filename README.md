# TACACS+ Docker Image

This image is a built version of [tac_plus](http://www.pro-bono-publico.de/projects/),
a TACACS+ implementation written by Marc Huber.

Various configuration options and components were taken from an existing docker image repo which can be found here:

* https://github.com/lfkeitel/docker-tacacs-plus
* https://github.com/dchidell/docker-tacacs

## Build
Use the makefile for building and tagging the image with the default tag of noc/tac_plus:alpine-latest

```
make
```

or

```
DOCKER_HUB_NAME=my-custom-repo/noc/tac_plus make all
```

## Configuration
Configuration is stored in two files `tac_plus.cfg` and `tac_user.cfg`. tac_plus.cfg contains the basic, more or less statc configurations. 

If additional users or parameters are required, the `tac_user.cfg` file should be modified and passed into the container via a docker volume using `-v /path/to/tac_user.cfg:/etc/tac_plus/tac_user.cfg`

## Usage

### Plain docker

TACACS+ uses port 49. This is exposed by the container, but will require forwarding to the host if the default bridged networking is used using `-p 49:49`

Example - Running the default container for a quick test and inspecting the logs:
```
docker run -it --rm -p 49:49 -v /local/base.cfg:/etc/tac_plus/tac_plus.cfg -v /local/user.cfg:/etc/tac_plus/tac_user.cfg tac_plus
```  

### Ansible

See `https://github.com/witcom-gmbh/ansible-network-aaa-collection/tree/main/roles/tac_plus`



### Docker compose

TBD
