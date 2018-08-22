#! /bin/bash

ANDROID_NDK=android-ndk-r17b
API=21 # 14-28
ABI=all # all, armeabi-v7a, arm64-v8a, x86, x86_64

[ ! -e ${ANDROID_NDK}-linux-x86_64.zip ] && wget -c https://dl.google.com/android/repository/${ANDROID_NDK}-linux-x86_64.zip;
[ ! -d ${ANDROID_NDK} ] && unzip ${ANDROID_NDK}-linux-x86_64.zip;

$ANDROID_NDK/ndk-build APP_ABI=${ABI} APP_PLATFORM=android-${API} NDK_PROJECT_PATH=./ APP_BUILD_SCRIPT=app/src/main/jni/Android.mk

rm -rf oscam
rm -rf *obj*
mv libs oscam

exit;

