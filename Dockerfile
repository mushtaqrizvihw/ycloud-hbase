FROM hortonworks/ycloud-apps-base:0.1

RUN yum install -y hbase; yum clean all
RUN yum install -y phoenix; yum clean all

## Gross hack to enable Slider agent running as nobody to go and replace files under the following directories.
RUN chmod -R a+w /etc/hadoop/conf
RUN chmod -R a+w /etc/hbase/conf

ADD ambari-metrics-hadoop-sink.jar /

CMD ["hbase" "master" "start"]
