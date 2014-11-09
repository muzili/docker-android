### Android development environment for ubuntu precise (12.04 LTS)

* Oracle Java JDK 8
* Android SDK r23
* Android NDK r10c
* Apache Ant 1.9.4

It also updates the SDK to android 19 (4.4.2) with platform tools and system images for that revision.

#### Install

You can either pull from `muzili/android`:

```
docker pull muzili/android
```

```
alias android-build='docker run -i --privileged -v /dev/bus/usb:/dev/bus/usb -v $(pwd):/app -w /app muzili/android'
```

or add it to your Dockerfile:

```
FROM muzili/android
```

got to the working directory
```
android-build ant debug
```
