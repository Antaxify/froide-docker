FROM debian:12.4

RUN	apt update -y && \
	apt upgrade -y && \
	apt install -y \
		build-essential \
		cmake \
		git \
		gettext \
		imagemagick \
		libffi-dev \
		libpq-dev \
		make \
		python3 \
		python3-dev \
		python3-gdal \
		python3-magic \
		python3-pip \
		python3-venv \
		python3-virtualenv \
		python3-wheel \
		rustc \
		virtualenv

RUN	mkdir /app && \
	mkdir /app/froide

RUN apt install -y pkg-config libpoppler-cpp-dev

COPY ./froide/requirements.txt /app/requirements.txt

RUN	cd /app && \
	pip3 install -r requirements.txt --break-system-packages

RUN apt install -y npm

ENTRYPOINT ["/bin/bash", "/app/start.sh"]
