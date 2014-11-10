#!/bin/bash
mkdir -p dl
(cd dl && curl -b gpw_e24=http%3A%2F%2Fwww.oracle.com -b oraclelicense=accept-securebackup-cookie -O -L http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz)
#(cd dl && wget http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz)
(cd dl && wget http://dl.google.com/android/ndk/android-ndk-r10c-linux-x86_64.bin)
(cd dl && wget http://mirrors.aliyun.com/apache/ant/binaries/apache-ant-1.9.4-bin.tar.gz)
(cd dl && wget http://services.gradle.org/distributions/gradle-2.1-bin.zip)
(cd dl && wget 'http://nj.baidupcs.com/file/d622e6b9aafc3de19ca0e430ccff9880?bkt=p2-nj-542&fid=2197842609-250528-932588678448676&time=1415602264&sign=FDTAXERB-DCb740ccc5511e5e8fedcff06b081203-hlVTzigTj1k7p%2Ftwfh4PizFi%2BJc%3D&to=nb&fm=Nan,B,T,t&newver=1&newfm=1&flow_ver=3&expires=8h&rt=pr&r=646632055&mlogid=1118912&vuk=2197842609&vbdid=1236738697&fin=android-sdk_all-in-one-linux.tgz&fn=android-sdk_all-in-one-linux.tgz')
