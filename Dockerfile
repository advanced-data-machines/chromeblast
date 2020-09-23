FROM python:latest

WORKDIR /app

RUN apt-get update
RUN apt-get install vim jq -y
# install gRPC curl program
RUN wget https://github.com/fullstorydev/grpcurl/releases/download/v1.7.0/grpcurl_1.7.0_linux_x86_64.tar.gz
RUN tar -xvf grpcurl_1.7.0_linux_x86_64.tar.gz

# home foyer protocol stubs
ADD google/ /app/google


COPY scripts/get_tokens.py .
COPY scripts/run.sh .

RUN pip3.8 install gpsoauth

# docker run --rm -it chromeblast <gmail_user> <password> <chromeblastsa@-290220.iam.gserviceaccount.com>
ENTRYPOINT [ "./run.sh" ]