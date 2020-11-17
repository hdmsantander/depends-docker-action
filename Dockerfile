FROM openjdk:16-slim

ENV USER depends
ENV UID 1001
ENV HOME /home/$USER

WORKDIR $HOME

RUN apt-get update && apt install -y wget unzip

RUN adduser --system --uid $UID $USER

RUN chown -R $USER $HOME

USER $USER

RUN wget https://github.com/multilang-depends/depends/releases/download/0.9.6e/depends-0.9.6-package.zip
RUN unzip -j ./depends-0.9.6-package.zip -d $HOME
RUN echo $PATH

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
