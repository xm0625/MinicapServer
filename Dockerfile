FROM sorccu/adb
MAINTAINER xm0625

RUN apk update && \
	apk add nodejs && \
	rm -rf /var/cache/apk/* /tmp/* /var/tmp/* && \
	mkdir -p /baseDir

COPY . /baseDir

WORKDIR /baseDir

RUN npm install && \
	npm cache clean -f

