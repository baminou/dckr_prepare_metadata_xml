FROM ubuntu:16.04

#export EGA_DCK_KEY

MAINTAINER Name <brice.aminou@gmail.com>

RUN apt-get update && apt-get install -y git && apt-get install -y wget

RUN apt-get install -y python-pip

RUN apt-get update && apt-get install -y software-properties-common && apt-get install -y python-software-properties

RUN pip install jsonschema

RUN git clone https://github.com/icgc-dcc/icgconnect.git /icgconnect
RUN pip install /icgconnect

RUN mkdir /scripts
COPY tools/prepare_ega_xml_audit.py /scripts/prepare_metadata_xml

RUN chmod +x /scripts/prepare_metadata_xml

ENV PATH="/scripts/:${PATH}"

ENTRYPOINT ["prepare_metadata_xml"]
