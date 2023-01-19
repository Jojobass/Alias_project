FROM ubuntu
RUN apt update && apt full-upgrade -y
RUN apt install build-essential libtool autoconf unzip wget -y
RUN /bin/bash -c '\ 
cd ~; \
wget https://github.com/Kitware/CMake/releases/download/v3.16.3/cmake-3.16.3-linux-x86_64.tar.gz; \
tar -xzvf cmake-3.16.3-linux-x86_64.tar.gz'
RUN apt install libboost-all-dev -y
RUN /bin/bash -c '\
wget https://dev.mysql.com/get/Downloads/Connector-C++/mysql-connector-c++-8.0.28-linux-glibc2.12-x86-64bit.tar.gz; \
tar -xzvf mysql-connector-c++-8.0.28-linux-glibc2.12-x86-64bit.tar.gz; \
cd mysql-connector-c++-8.0.28-linux-glibc2.12-x86-64bit; \
pwd | tr -d "\n" > ../config.txt; \
cd ..'
COPY DB ./DB
COPY Server ./Server
COPY CMakeLists.txt ./
RUN /bin/bash -c '\
mkdir build && cd build; \
~/cmake-3.16.3-Linux-x86_64/bin/cmake ..; \
~/cmake-3.16.3-Linux-x86_64/bin/cmake --build .'
CMD [ "/build/Alias_server", "0.0.0.0", "8080", "2" ]
