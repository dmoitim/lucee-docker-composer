FROM alpine as base

RUN apk add openjdk11-jre

ARG LUCEE_VERSION="5.4.2.17"
ARG LUCEE_PASSWORD="Lucee2023!"
ARG ORACLE_DRIVER_VERSION="21.8.0.0-ojdbc11"
ARG ADMIN_VERSION="1.0.0.5"
ARG PDF_VERSION="1.1.0.19"
ARG IMAGE_VERSION="2.0.0.25"

ADD https://cdn.lucee.org/lucee-express-${LUCEE_VERSION}.zip lucee.zip
ADD https://cdn.lucee.org/lucee-light-${LUCEE_VERSION}.jar lucee-light.jar

RUN mkdir /lucee && \
     unzip lucee.zip -d /lucee && \
     chmod +x /lucee/*.sh && \
     chmod +x /lucee/bin/*.sh && \
     rm -f lucee.zip && \
     rm -rf /lucee/__MACOSX && \
     mv lucee-light.jar /lucee/lib/ext/lucee.jar && \
     mkdir -p /lucee/lucee-server/context/ && \
     mkdir -p /lucee/lucee-server/deploy/

# Set password
RUN echo ${LUCEE_PASSWORD} > /lucee/lucee-server/context/password.txt

# Add the extensions
ADD https://ext.lucee.org/lucee.admin.extension-${ADMIN_VERSION}.lex /lucee/lucee-server/deploy/lucee.admin.extension-${ADMIN_VERSION}.lex
ADD https://ext.lucee.org/org.lucee.oracle-${ORACLE_DRIVER_VERSION}.lex /lucee/lucee-server/deploy/org.lucee.oracle-${ORACLE_DRIVER_VERSION}.lex
ADD https://ext.lucee.org/pdf-extension-${PDF_VERSION}.lex /lucee/lucee-server/deploy/org.lucee.oracle-${PDF_VERSION}.lex
ADD https://ext.lucee.org/lucee.image.extension-${IMAGE_VERSION}.lex /lucee/lucee-server/deploy/org.lucee.oracle-${IMAGE_VERSION}.lex

RUN LUCEE_ENABLE_WARMUP=true /lucee/startup.sh

FROM alpine
RUN apk add openjdk11-jre
COPY --from=base /lucee /lucee
ENTRYPOINT [ "/lucee/startup.sh" ]