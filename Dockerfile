FROM lucee/lucee:6.1.1.118-light

ENV TZ=America/Sao_Paulo

RUN apt update && apt install tzdata -y \
     && ln -snf /usr/share/zoneinfo/"$TZ" /etc/localtime \
     && echo "$TZ" > /etc/timezone \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy the config file with pt-BR locale and timezone and include extensions
COPY context/config/.CFConfig.json /opt/lucee/server/lucee-server/context/.CFConfig.json

# Create directory for extensions and copy them
RUN mkdir -p /opt/lucee/extensions

COPY context/extensions/ /opt/lucee/extensions/