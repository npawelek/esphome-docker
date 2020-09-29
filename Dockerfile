FROM python:3.8-alpine

RUN set -eux \
  && pip3 install --no-cache-dir --no-compile \
	  esphome==1.15.2 \
		esptool \
		tornado \
	&& find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf \
	&& find /usr/lib/ -name '*.pyc' -print0 | xargs -0 -n1 rm -rf

ENV USERNAME=""
ENV PASSWORD=""

WORKDIR /config
ENTRYPOINT ["esphome"]
CMD ["/config", "dashboard"]
