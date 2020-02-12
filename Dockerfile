FROM openjdk:15-jdk-buster
COPY . /usr
WORKDIR /usr

RUN cd /usr/server/inc && \
    tar -xzf apache-ant-1.10.6-bin.tar.gz && \
    mv apache-ant-1.10.6 /opt/ant && \
    rm apache-ant-1.10.6-bin.tar.gz
ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin

EXPOSE 43594
EXPOSE 43595
EXPOSE 43596
EXPOSE 43597
EXPOSE 43598
EXPOSE 43599

ADD server/inc/wait /wait
RUN chmod +x /wait

CMD /wait
