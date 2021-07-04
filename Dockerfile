FROM apnpucky/docker-debian-cmake-boost-gfortran
MAINTAINER APN
RUN wget https://lhapdf.hepforge.org/downloads/?f=LHAPDF-6.2.3.tar.gz -O LHAPDF-6.2.3.tar.gz && tar xf LHAPDF-6.2.3.tar.gz && cd LHAPDF-6.2.3  && ./configure --prefix=/usr/share/LHAPDF && make && make install
