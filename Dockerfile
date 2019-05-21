FROM openmicroscopy/octave:0.3.0
LABEL maintainer="ome-devel@lists.openmicroscopy.org.uk"
LABEL org.opencontainers.image.created="2019-05-21T20:34:23Z"
LABEL org.opencontainers.image.revision="da4356817e2e2d10c178cba9841e18449965a9e3"
LABEL org.opencontainers.image.source="https://github.com/ome/bio-formats-octave-docker"

ARG VERSION=6.1.0

USER root
RUN apt-get update \
    && apt-get install -y wget unzip \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

USER octave
RUN wget --user-agent Docker downloads.openmicroscopy.org/bio-formats/$VERSION/artifacts/bioformats-octave-$VERSION.tar.gz
RUN wget --user-agent Docker downloads.openmicroscopy.org/bio-formats/$VERSION/artifacts/bioformats_package.jar
RUN echo "/home/octave/bioformats_package.jar" >> /home/octave/javaclasspath.txt


RUN echo "pkg install bioformats-octave-$VERSION.tar.gz" | octave

ADD *.m /home/octave/
