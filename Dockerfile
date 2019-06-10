FROM openjdk:8

ENV DATA_DIR '/opt/h2-data'

COPY h2-*.zip /h2.zip

RUN mkdir -p ${DATA_DIR} && unzip /h2.zip -d /opt/ && rm h2.zip

COPY h2.server.properties /root/.h2.server.properties

EXPOSE 81 1521

WORKDIR ${DATA_DIR}

CMD java -cp /opt/h2/bin/h2*.jar org.h2.tools.Server \
 	-web -webAllowOthers -webPort 81 \
 	-tcp -tcpAllowOthers -tcpPort 1521 \
 	-baseDir ${DATA_DIR}
