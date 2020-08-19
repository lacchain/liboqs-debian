FROM debian:testing-slim

ARG debian_control_path

RUN apt update \
 && apt install --no-install-recommends -yV \
    build-essential \
    devscripts \
    equivs \
    wget

WORKDIR /build/
RUN wget https://github.com/open-quantum-safe/liboqs/archive/0.4.0.tar.gz
RUN echo "05836cd2b5c70197b3b6eed68b97d0ccb2c445061d5c19c15aef7c959842de0b 0.4.0.tar.gz" | sha256sum --check --status
RUN tar -zxvf 0.4.0.tar.gz

COPY ./debian/ liboqs-0.4.0/debian/

# Set the env variables to non-interactive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

# Install the build deps for _this_ package
RUN mk-build-deps -irt 'apt-get --no-install-recommends -yV' liboqs-0.4.0/debian/control

RUN echo '#!/bin/sh\n\
set -x\n\
cd /build/liboqs-0.4.0\n\
debuild -b -uc -us -nc\n\
mv ../*.deb /output\n'\
>> /run.sh

RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
