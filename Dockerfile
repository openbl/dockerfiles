FROM ubuntu:13.10

RUN apt-get update
RUN apt-get -y install python-software-properties software-properties-common wget vim
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN apt-get update

RUN apt-get -y install postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3

VOLUME ["/etc/postgresql", "/var/log/postgresql", "/usr/lib/postgresql"]

ADD pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ADD postgresql.conf /etc/postgresql/9.3/main/postgresql.conf
ADD setup.sh /
RUN ./setup.sh

EXPOSE 5432

USER postgres

CMD ["/usr/lib/postgresql/9.3/bin/postgres"]
