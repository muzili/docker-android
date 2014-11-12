### Android development environment for ubuntu 14.04.01 LTS

* Oracle Java JDK 8
* Android SDK r23
* Android NDK r10c
* Apache Ant 1.9.4
* Gradle 2.1

It also updates the SDK to android 19(4.4.x)/17(4.2.2)/21(5.0) with platform tools and system images for that revision.

#### Install

You can either pull from `muzili/docker-android`:

```
docker pull muzili/docker-android
```

```
alias android-build='docker run -i --privileged -v /dev/bus/usb:/dev/bus/usb -v $(pwd):/app -w /app -u $UID:$GID muzili/docker-android'
```

or add it to your Dockerfile:

```
FROM muzili/docker-android
```

got to the working directory
```
android-build ant debug
```
