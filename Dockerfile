FROM debian:buster

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
      bison \
      build-essential \
      ca-certificates \
      clang \
      cmake \
      flex \
      gawk \
      git \
      graphviz \
      libboost-dev \
      libboost-filesystem-dev \
      libboost-iostreams-dev \
      libboost-program-options-dev \
      libboost-python-dev \
      libboost-system-dev \
      libboost-thread-dev \
      libeigen3-dev \
      libffi-dev \
      libftdi-dev \
      libqt5opengl5-dev \
      libreadline-dev \
      pkg-config \
      python3 \
      tcl-dev \
      xdot \
      zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*

RUN git clone --branch yosys-0.9 https://github.com/YosysHQ/yosys.git \
 && cd yosys \
 && make config-gcc \
 && make -j$(( $(nproc) + 1 )) \
 && make install \
 && rm -rf ../yosys

RUN git clone https://github.com/cliffordwolf/icestorm.git \
 && cd icestorm \
 && git checkout 0ec00d892a91cc68e45479b46161f649caea2933 \
 && make -j $(( $(nproc) + 1 )) \
 && make install \
 && rm -rf ../icestorm

RUN git clone https://github.com/YosysHQ/nextpnr.git \
 && cd nextpnr \
 && git checkout 21c09c8b8f5e0456cc4d7e8017c27d25dd676377 \
 && cmake -DARCH=ice40 -DCMAKE_INSTALL_PREFIX=/usr/local . \
 && make -j $(( $(nproc) + 1 )) \
 && make install \
 && rm -rf ../nextpnr

WORKDIR /src
