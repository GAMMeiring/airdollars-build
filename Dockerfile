FROM ubuntu:16.04

RUN apt-get update && apt-get install -y git
RUN apt update && apt install -y make
RUN apt install autoconf automake libtool curl make g++ unzip -y

RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install libdb4.8-dev libdb4.8++-dev -y
RUN apt-get install pkg-config libcurl4-openssl-dev libssl-dev zlib1g-dev bsdmainutils libboost-all-dev -y
RUN apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler -y

WORKDIR /code
RUN git clone https://github.com/SeekoeiD/AirDollars.git

RUN mkdir /root/.airdollars
RUN cp AirDollars/airdollars.conf /root/.airdollars/airdollars.conf

WORKDIR /code/AirDollars/airdollars/

RUN chmod +x ./autogen.sh
RUN chmod +x ./share/genbuild.sh
RUN chmod +x ./src/leveldb/build_detect_platform

RUN ./autogen.sh
RUN ./configure
RUN make clean
RUN make
RUN make install

CMD ["/usr/local/bin/airdollars-qt"]