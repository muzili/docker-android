#!/bin/bash
mkdir -p dl
(cd dl && curl -b gpw_e24=http%3A%2F%2Fwww.oracle.com -b oraclelicense=accept-securebackup-cookie -O -L http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz)
#(cd dl && wget http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz)
(cd dl && wget http://dl.google.com/android/ndk/android-ndk-r10c-linux-x86_64.bin)
(cd dl && wget http://mirrors.aliyun.com/apache/ant/binaries/apache-ant-1.9.4-bin.tar.gz)
(cd dl && wget http://services.gradle.org/distributions/gradle-2.1-bin.zip)
#http://pan.baidu.com/s/1bnwA1RL
(cd dl && wget 'http://bj.baidupcs.com/file/f59b0cf088d88b04f09c46b34b245c50?bkt=p2-nj-542&fid=2197842609-250528-614869431146880&time=1415626948&sign=FDTAXERB-DCb740ccc5511e5e8fedcff06b081203-ndmmW37riDJMgv6txhS%2FyfFStto%3D&to=bb&fm=Nan,B,G,ny&newver=1&newfm=1&flow_ver=3&expires=1415658000&rt=sh&r=233334198&mlogid=1416623736&sh=1&vuk=2197842609&vbdid=1502255842&fin=android-sdk_all-in-one-linux.tgz&fn=android-sdk_all-in-one-linux.tgz' -O android-sdk_all-in-one-linux.tgz)
