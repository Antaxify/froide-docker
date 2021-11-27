# Dockerfile for Froide
This repository contains a Dockerfile and docker-compose.yml for quick deployment of Froide using Docker. 
The Dockerfile is based on Debian 10 (Buster) and provides all necessary dependencies to host a Froide instance, which are installed both from Debian repository and PyPI.

### Usage
At first, clone this repository with its submodules. The original Froide repository (https://github.com/okfde/froide) will be cloned to `froide` directory.

```
git clone git@github.com:Reprostar/froide-docker.git --recurse-submodules
```

Next, customize `local_settings.py` to your needs (that's a copy of `froide/froide/local_settings.py.example`). For instructions how to configure Froide, 
please refer to the official documentation (https://froide.readthedocs.io/en/latest/gettingstarted/) and look at the base configuration file located 
at `froide/froide/settings.py`.

If you're using docker-compose to deploy the app with sample PostGIS and Elasticsearch services, you can
use `docker-compose.yml` included in this repository. To modify its contents, you can create 
a `docker-compose.override.yml` file and alter settings from the original.


### Warranty
Author of this repository does not give any warranty for using those scripts. You are using them on your own responsibility.


### License
Both Froide and froide-docker are licensed under the MIT License.
