FROM rayvtoll/vcd-base-app
RUN apt-get update && apt-get install -y --no-install-recommends libreoffice
ENV LANG="en_US.UTF-8"
ENTRYPOINT ["sh", "entrypoint.sh"] 
