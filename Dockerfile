FROM apnpucky/docker-debian-cmake-boost-gfortran
MAINTAINER APN
RUN apt-get update -qq && apt-get install -y -qq wget
ENV LHAPDF=/usr/share/LHAPDF
RUN wget https://lhapdf.hepforge.org/downloads/?f=LHAPDF-6.2.3.tar.gz -O LHAPDF-6.2.3.tar.gz && tar xf LHAPDF-6.2.3.tar.gz && cd LHAPDF-6.2.3  && ./configure --prefix=$LHAPDF && make && make install
ENV PATH=$PATH:$LHAPDF/bin
ENV LD_LIBRARBY_PATH=$LD_LIBRARY_PATH:$LHAPDF/lib
#ENV PYTHONPATH=$PYTHONPATH:$LHAPDF/lib/python3.9/site-packages
