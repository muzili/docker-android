#!/bin/bash
mkdir -p dl
curl -b gpw_e24=http%3A%2F%2Fwww.oracle.com -b oraclelicense=accept-securebackup-cookie -O -L http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz -o dl/jdk-8u25-linux-x64.tar.gz
wget http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz -O dl/android-sdk_r23.0.2-linux.tgz
wget http://dl.google.com/android/ndk/android-ndk-r10c-linux-x86_64.bin -O dl/android-ndk-r10c-linux-x86_64.bin
wget http://mirrors.aliyun.com/apache/ant/binaries/apache-ant-1.9.4-bin.tar.gz -O dl/apache-ant-1.9.4-bin.tar.gz
wget http://services.gradle.org/distributions/gradle-2.1-bin.zip -O dl/gradle-2.1-bin.zip
