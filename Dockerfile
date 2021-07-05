FROM apnpucky/docker-debian-cmake-boost-gfortran
MAINTAINER APN
RUN apt-get update -qq && apt-get install -y -qq wget
ENV LHAPDF=/usr/share/LHAPDF
RUN wget https://lhapdf.hepforge.org/downloads/?f=LHAPDF-6.2.3.tar.gz -O LHAPDF-6.2.3.tar.gz && tar xf LHAPDF-6.2.3.tar.gz && cd LHAPDF-6.2.3  && ./configure --prefix=$LHAPDF && make && make install
ENV PATH=$PATH:$LHAPDF/bin
ENV LIBRARY_PATH=$LIBRARY_PATH:$LHAPDF/lib
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LHAPDF/lib
#ENV PYTHONPATH=$PYTHONPATH:$LHAPDF/lib/python3.9/site-packages
RUN for n in CT14lo CT14nlo MSTW2008lo68cl MSTW2008nlo68cl; do wget http://lhapdfsets.web.cern.ch/lhapdfsets/current/$n.tar.gz && tar xvfz "$n" --directory $LHAPDF/share/LHAPDF/ ; done
