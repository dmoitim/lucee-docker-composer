FROM alpine as base

RUN apk add openjdk11-jre

ARG LUCEE_VERSION="6.0.3.1"
ARG LUCEE_PASSWORD="@Lucee2024!"
ARG ORACLE_DRIVER_VERSION="21.8.0.0-ojdbc11"
ARG ADMIN_VERSION="1.0.0.5"
ARG PDF_VERSION="1.2.0.10"
ARG IMAGE_VERSION="2.0.0.26"
ARG FORM_VERSION="1.0.0.10"
ARG COMPRESS_VERSION="1.0.0.15"
ARG AJAX_VERSION="1.0.0.5"

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

# Copy the config file with pt-BR locale and timezone
COPY /config/.CFConfig.json /lucee/lucee-server/context/.CFConfig.json

# Add the extensions
ADD https://ext.lucee.org/lucee.admin.extension-${ADMIN_VERSION}.lex /lucee/lucee-server/deploy/lucee.admin.extension-${ADMIN_VERSION}.lex
ADD https://ext.lucee.org/org.lucee.oracle-${ORACLE_DRIVER_VERSION}.lex /lucee/lucee-server/deploy/org.lucee.oracle-${ORACLE_DRIVER_VERSION}.lex
ADD https://ext.lucee.org/pdf-extension-${PDF_VERSION}.lex /lucee/lucee-server/deploy/pdf-extension-${PDF_VERSION}.lex
ADD https://ext.lucee.org/lucee.image.extension-${IMAGE_VERSION}.lex /lucee/lucee-server/deploy/lucee.image.extension-${IMAGE_VERSION}.lex
ADD https://ext.lucee.org/form-extension-${FORM_VERSION}.lex /lucee/lucee-server/deploy/form-extension-${FORM_VERSION}.lex
ADD https://ext.lucee.org/compress-extension-${COMPRESS_VERSION}.lex /lucee/lucee-server/deploy/compress-extension-${COMPRESS_VERSION}.lex
ADD https://ext.lucee.org/ajax.extension-${AJAX_VERSION}.lex /lucee/lucee-server/deploy/ajax.extension-${AJAX_VERSION}.lex

RUN LUCEE_ENABLE_WARMUP=true /lucee/startup.sh

FROM alpine
RUN apk add tzdata openjdk11-jre
ENV TZ=America/Sao_Paulo

COPY --from=base /lucee /lucee
ENTRYPOINT [ "/lucee/startup.sh" ]