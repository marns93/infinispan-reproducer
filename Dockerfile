ARG IMAGE_TAG=14.0.10.Final
FROM infinispan/server:$IMAGE_TAG

WORKDIR /opt/infinispan

ARG MAVEN_URL=https://repo1.maven.org/maven2

ENV JDBC_POSTGRES_VERSION=42.5.4

# Install custom packages
USER root
RUN microdnf install python39 && microdnf clean all

USER jboss

# Install Postgres module
RUN curl -s --output server/lib/postgres-jdbc.jar $MAVEN_URL/org/postgresql/postgresql/$JDBC_POSTGRES_VERSION/postgresql-$JDBC_POSTGRES_VERSION.jar

COPY docker-entrypoint.py .
COPY mm-infinispan.xml server/conf/

ENTRYPOINT ["/opt/infinispan/docker-entrypoint.py"]
