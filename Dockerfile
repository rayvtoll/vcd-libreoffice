FROM rayvtoll/vcd-base-app
RUN apt-get update && apt-get install -y --no-install-recommends libreoffice
ENTRYPOINT ["sh", "entrypoint.sh"] 
