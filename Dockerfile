FROM python:3.7-alpine3.8

# update apk repo
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.8/main" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/v3.8/community" >> /etc/apk/repositories

# install chromedriver
RUN apk update
RUN apk add chromium chromium-chromedriver

# install selenium
RUN pip install selenium==3.13.0

# install pandas
RUN apk add make automake gcc g++ subversion git python3-dev	
RUN pip install numpy
RUN pip install pandas --upgrade

 # install civis
RUN pip install civis

# install google cloud storage
RUN pip install google-cloud-storage==1.29.0

# install Pillow requirements
RUN apk add build-base python-dev py-pip jpeg-dev zlib-dev
ENV LIBRARY_PATH=/lib:/usr/lib
RUN pip install Pillow

# Add sudo, because we need it to kill the swap memory every so often
# http://www.yourownlinux.com/2013/10/how-to-free-up-release-unused-cached-memory-in-linux.html
RUN apk --no-cache add sudo
