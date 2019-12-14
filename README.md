# fenicstensorflow
Docker image supporting fenicsproject's simulation framework and tensorflow with cuda.

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/konstagapov/fenicstensorflow)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/konstagapov/fenicstensorflow)

This repository provides a Dockerfile to build an image based on an [FEniCS Project's](https://fenicsproject.org) `quay.io/fenicsproject/stable:current` with added GPU support from [nvidia/cuda](nvidia/cuda) as well as pre-installed [tensorflow-2.0](https://www.tensorflow.org) and [SciPy](https://www.scipy.org) packages for data analysis.

## Starting the container
Start the container with 
```
$ docker run -p $host_port:8888 konstagapov/fenicstensorflow:latest
```
By default, the container starts with `jupyter lab` listening on port 8888, which will be accessible at http://localhost:$host_port.

## Mounting data from host 
In order to have your data accessible in `jupyter lab`, mount them using
```
$ docker run -v /path/to/directory/on/host:/home/fenics/shared -p $host_port:8888 konstagapov/fenicstensorflow:latest
```
