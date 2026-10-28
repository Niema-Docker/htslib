# Minimal Docker image for htslib using Alpine base
FROM alpine:latest

# install htslib
RUN apk update && \
    apk add --no-cache bash bzip2-dev g++ make xz-dev zlib-dev && \
    wget -qO- "https://github.com/samtools/htslib/releases/download/1.25/htslib-1.25.tar.bz2" | tar -xj && \
    cd htslib-* && \
    ./configure && \
    make install && \
    cd .. && \
    rm -rf htslib-*
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
