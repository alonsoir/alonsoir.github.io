# https://docs.confluent.io/current/quickstart/ce-quickstart.html
#/bin/bash
export CONFLUENT_HOME=/Users/aironman/confluent-5.3.1
export PATH=$PATH/$CONFLUENT_HOME 
export PATH=$PATH/$CONFLUENT_HOME/bin
curl -L --http1.1 https://cnfl.io/cli | sh -s -- -b /usr/local/bin
$CONFLUENT_HOME/bin/confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:latest
# CONFLUENT_CLI is saved in /usr/local/bin. Updating PATH
export PATH=$PATH/usr/local/bin
# actual confluent platform requires JDK8. By default i have JDK14, so i have to change it.
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/
export PATH=$PATH/$JAVA_HOME
confluent local start
# http://127.0.0.1:9021/clusters