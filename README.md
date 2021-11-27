# Dockerfile for Froide
This repository contains a Dockerfile and docker-compose.yml for quick deployment of Froide using Docker. 
The Dockerfile is based on Debian 10 (Buster) and provides all necessary dependencies to host a Froide instance, which are installed both from Debian repository and PyPI.

### Usage
At first, clone this repository with its submodules. [The original Froide repository](https://github.com/okfde/froide) will be cloned to the _froide_ directory.

```
git clone git@github.com:Reprostar/froide-docker.git --recurse-submodules
```

Next, customize _local_settings.py_ to your needs (that's a copy of _froide/froide/local_settings.py.example_). For instructions on how to configure Froide, 
please refer to the [official documentation](https://froide.readthedocs.io/en/latest/gettingstarted/) and look at the base configuration file located 
at _froide/froide/settings.py_. As the most important part, you will probably need to perform a database migration, create a superuser and configure reverse proxy such as Nginx.

When configuring credentials to the PostgreSQL and Elasticsearch services, use the defaults defined in the _docker-compose.yml_. Reminder that those services are not accessible by Froide on _localhost_, but on _db_ and _elasticsearch_ hostnames.

If you're using docker-compose to deploy the app with sample PostGIS and Elasticsearch services, you can
use _docker-compose.yml_ included in this repository. To modify its contents, you can create 
a _docker-compose.override.yml_ file and alter settings from the original.

### Warranty
Author of this repository does not give any warranty for using those scripts. You are using them on your own responsibility.


### License
Both Froide and froide-docker are licensed under the MIT License.
