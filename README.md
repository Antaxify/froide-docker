# Dockerfile for Froide
This repository contains a Dockerfile and docker-compose.yml for quick deployment of Froide using Docker. 
The Dockerfile is based on Debian 10 (Buster) and provides all necessary dependencies to host a Froide instance, which are installed both from Debian repository and PyPI.


### What's the purpose of froide-docker?
The purpose of this repository is to provide a quick way to kickstart an example Froide stack. We have not found any official deployment script for Docker, so if you were also looking for it - here you go :)


### Usage
At first, clone this repository with its submodules. [The original Froide repository](https://github.com/okfde/froide) will be cloned to the _froide_ directory.

```
git clone git@github.com:Reprostar/froide-docker.git --recurse-submodules
```

In case you have already cloned this repo without _--recurse-submodules_ parameter, enter the project directory and run:
```
git submodule init
git submodule update
```

Next, customize _local_settings.py_ to your needs (that's a copy of _froide/froide/local_settings.py.example_). For instructions on how to configure Froide, 
please refer to the [official documentation](https://froide.readthedocs.io/en/latest/gettingstarted/) and look at the base configuration file located 
at _froide/froide/settings.py_. As the most important part, you will probably need to perform a database migration, create a superuser and configure reverse proxy such as Nginx. Also, remember to set a valid entry in ALLOWED_HOSTS in the _local_settings.py_.

When configuring credentials to the PostgreSQL and Elasticsearch services, use the defaults defined in the _docker-compose.yml_. Reminder that those services are not accessible by Froide on _localhost_, but on _db_ and _elasticsearch_ hostnames.

If you're using docker-compose to deploy the app with sample PostGIS and Elasticsearch services, you can
use _docker-compose.yml_ included in this repository. To modify its contents, you can create 
a _docker-compose.override.yml_ file and alter settings from the original.

If everything is ready to go, you can kickstart Froide by:
```
docker-compose up -d
```

And you can access console (i.e. to use _manage.py_ utility) by:
```
docker-compose exec app bash
```

To compile frontend assets using webpack, you can do it within the container, using:
```
# Assuming that you have already entered console by `docker-compose exec app bash`
apt install nodejs npm
npm install
npm run build
```


### Warranty
Author of this repository does not give any warranty for using those scripts. You are using them on your own responsibility.
If you have any problems with Froide or you want to get support for the platform itself, please create an issue at https://github.com/okfde/froide/issues.


### License
Both Froide and froide-docker are licensed under the MIT License.
