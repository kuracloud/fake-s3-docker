FROM debian:jessie
MAINTAINER Cam Jackson

ENV DEBIAN_FRONTEND noninteractive

# install Ruby & git
RUN apt-get update && apt-get install -yqq ruby rubygems-integration git

# enable installing gems directly from a git repo
RUN gem install specific_install

# install fake-s3
RUN gem specific_install -l https://github.com/saltzmanjoelh/fake-s3.git

# run fake-s3
RUN mkdir -p /fakes3_root
ENTRYPOINT ["/usr/local/bin/fakes3"]
CMD ["-r",  "/fakes3_root", "-p",  "4569"]
EXPOSE 4569
