# Start with ubuntu precise (LTS).
FROM ubuntu:14.04.1

MAINTAINER Joshua Lee <muzili@gmail.com>

# Never ask for confirmations
ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://mirrors.aliyun.com/ubuntu trusty main universe restricted" > /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu trusty-updates main universe restricted" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu trusty-security main universe restricted" >> /etc/apt/sources.list

# Add i386 arch packages
RUN dpkg --add-architecture i386
# Update
RUN apt-get update -qq

# Install HTTPS support for APT.
RUN apt-get install -y --no-install-recommends apt-transport-https ca-certificates
# Install add-apt-repository
RUN apt-get install -y --no-install-recommends  software-properties-common

# Upgrade all packages.
RUN apt-get dist-upgrade -y --no-install-recommends

# Install some common components
RUN apt-get install -y --no-install-recommends wget git curl unzip zip bzip2 less nano vim

# Install development components.
RUN apt-get install -y --no-install-recommends build-essential make expect

# Install development components.
RUN apt-get install -y --no-install-recommends libssl-dev man

# Dependencies to execute android
RUN apt-get install -y --no-install-recommends libstdc++6:i386 lib32z1 lib32bz2-1.0 lib32ncurses5 
RUN apt-get install -y --no-install-recommends p7zip-full

#Add the predownloaded packages
ADD dl /tmp

# Java
# Information Of Package
ENV JDK_VERSION jdk1.8.0_25
ENV JDK_PACKAGE jdk-8u25-linux-x64.tar.gz
#http://download.oracle.com/otn-pub/java/jdk/6u45-b06/jdk-6u45-linux-x64.bin
#http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz
#http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz
#http://download.oracle.com/otn-pub/java/jdk/7u72-b14/jdk-7u72-linux-x64.tar.gz

RUN tar -zxf /tmp/$JDK_PACKAGE -C /usr/local && \
    ln -s /usr/local/$JDK_VERSION /usr/local/java && \
    rm -rf /tmp/$JDK_PACKAGE

# Install android sdk
#ENV ANDROID_SDK_VERSION r23.0.2
ENV ANDROID_SDK_VERSION all-in-one
RUN tar -xzf /tmp/android-sdk_$ANDROID_SDK_VERSION-linux.tgz -C /usr/local && \
    ln -sf /usr/local/android-sdk-linux /usr/local/android-sdk && \
    rm -rf /tmp/android-sdk_$ANDROID_SDK_VERSION-linux.tgz

# Install android ndk
ENV ANDROID_NDK_VERSION r10c
RUN 7z x /tmp/android-ndk-$ANDROID_NDK_VERSION-linux-x86_64.bin -o/usr/local && \
    ln -sf /usr/local/android-ndk-$ANDROID_NDK_VERSION /usr/local/android-ndk && \
    rm -rf /tmp/android-ndk-$ANDROID_NDK_VERSION-linux-x86_64.bin

# Install apache ant
ENV ANT_VERSION 1.9.4
RUN tar -xzf /tmp/apache-ant-$ANT_VERSION-bin.tar.gz -C /usr/local && \
    ln -sf /usr/local/apache-ant-$ANT_VERSION /usr/local/apache-ant && \
    rm /tmp/apache-ant-$ANT_VERSION-bin.tar.gz

# Install Gradle
ENV GRADLE_VERSION 2.1
RUN unzip -qq /tmp/gradle-$GRADLE_VERSION-bin.zip -d /usr/local/ && \
    ln -sf /usr/local/gradle-$GRADLE_VERSION /usr/local/gradle && \
    rm /tmp/gradle-$GRADLE_VERSION-bin.zip


# Environment variables
ENV JAVA_HOME /usr/local/java
ENV JRE_HOME /usr/local/java/jre
ENV ANDROID_SDK_HOME /usr/local/android-sdk
ENV ANDROID_NDK_HOME /usr/local/android-ndk
ENV ANDROID_HOME $ANDROID_SDK_HOME
ENV GRADLE_HOME /usr/local/gradle
ENV ANT_HOME /usr/local/apache-ant
ENV PATH $PATH:$JAVA_HOME/bin:$JRE_HOME/bin
ENV PATH $PATH:$ANDROID_SDK_HOME/tools
ENV PATH $PATH:$ANDROID_SDK_HOME/platform-tools
ENV PATH $PATH:$ANDROID_NDK_HOME
ENV PATH $PATH:$GRADLE_HOME/bin
ENV PATH $PATH:$ANT_HOME/bin

# Running many at the same time was causing problems. So, running one-by-one:
#RUN echo y | android update sdk --no-https --all --no-ui --force --filter android-17 && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter android-19 && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter android-21 && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter tools && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter platform-tools && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter build-tools-21.1.1 && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter extra-android-m2repository && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter extra-android-support && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter extra-google-admob_ads_sdk && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter extra-google-analytics_sdk_v2 && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter extra-google-gcm && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter extra-google-google_play_services && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter extra-google-google_play_services_froyo && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter extra-google-m2repository && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter extra-google-play_apk_expansion && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter extra-google-play_billing && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter extra-google-play_licensing && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter extra-google-webdriver && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter addon-google_apis-google-21 && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter addon-google_apis-google-19 && \
#    echo y | android update sdk --no-https --all --no-ui --force --filter addon-google_apis-google-17
#
# Clean up
RUN apt-get clean
