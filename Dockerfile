FROM hkarhani/p3nbds:latest

MAINTAINER Hassan El Karhani <hkarhani@gmail.com>

RUN apk update && apk add --update freetype freetype-dev libpng jpeg-dev 
RUN apk add --update zlib-dev make cmake gfortran libffi-dev openssl openssl-dev
RUN apk add --update curl linux-headers openblas openblas-dev py3-numpy py3-scipy py3-lxml

WORKDIR /notebooks

COPY requirements.txt ./

RUN pip3 install -r requirements.txt

EXPOSE 8888

CMD /bin/sh -c "/usr/bin/jupyter notebook --allow-root"