FROM sonarsource/sonar-scanner-cli:11.2@sha256:a3e91cb4a0a08fb99aa90807a6f9720c57e9279860d088b5f158a3a888e838ff AS sonar

FROM node:18.9.0-alpine3.15@sha256:8c1cfbefb235b4a9b4a04d9c8e9de0936bedb24097d87a0a12bfeb119624d7d5
COPY --from=sonar /opt/sonar-scanner/ /opt/sonar-scanner/

RUN apk add --no-cache buildah jq openjdk17-jre

ENV PATH=/opt/sonar-scanner/bin:$PATH
