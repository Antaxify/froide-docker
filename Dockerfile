FROM	debian:10

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

RUN	pip3 install --upgrade pip && \
	pip3 install wheel

RUN	mkdir /app && \
	mkdir /app/froide

COPY	./froide/requirements.txt /app/requirements.txt

RUN	cd /app && \
	pip3 install -r requirements.txt

ENTRYPOINT ["/bin/bash", "/app/start.sh"]
