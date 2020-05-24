FROM ubuntu:latest

RUN mkdir script
WORKDIR script
ADD /input .
ADD insert_xml_snippet.sh run.sh
RUN chmod +x run.sh

RUN ["/bin/bash", "./run.sh"]