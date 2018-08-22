#! /bin/bash

ANDROID_NDK=android-ndk-r17b
API=21 # 14-28
ABI=armeabi-v7a # armeabi-v7a, arm64-v8a, x86, x86_64

build(){
TOOLCHAIN=`pwd`/${TOOLCHAIN_NAME}
[ ! -e ${ANDROID_NDK}-linux-x86_64.zip ] && wget -c https://dl.google.com/android/repository/${ANDROID_NDK}-linux-x86_64.zip;
[ ! -d ${ANDROID_NDK} ] && unzip ${ANDROID_NDK}-linux-x86_64.zip;
[ ! -d ${TOOLCHAIN} ] && ./android-ndk-r17b/build/tools/make_standalone_toolchain.py --arch ${ARCH} --api ${API} --install-dir ${TOOLCHAIN};
export PATH=${TOOLCHAIN}/bin:$PATH
export CROSS_SYSROOT=${TOOLCHAIN}/sysroot
CROSS=${TOOLCHAIN}/bin/${TOOLCHAIN_NAME}-
export PKG_CONFIG_PATH=${CROSS_SYSROOT}/usr/lib/pkgconfig
if [ ! -e $PKG_CONFIG_PATH/openssl.pc ] ; then
[ ! -e openssl-1.1.0i.tar.gz ] && wget -c http://www.openssl.org/source/openssl-1.1.0i.tar.gz;
[ ! -d openssl-1.1.0i ] && tar -xf openssl-1.1.0i.tar.gz;
cd openssl-1.1.0i
CC=${CROSS}gcc LD=${CROSS}ld AR=${CROSS}ar STRIP=${CROSS}strip RANLIB=${CROSS}ranlib ./Configure ${CONFIG} --prefix=${CROSS_SYSROOT}/usr -D__ANDROID_API__=${API}
make install
cd ../
rm -rf openssl-1.1.0i
fi
#svn checkout http://www.streamboard.tv/svn/oscam/trunk oscam-svn
#wget https://raw.githubusercontent.com/oscam-emu/oscam-emu/master/oscam-emu.patch
#cd oscam-svn
#patch -p0 < ../oscam-emu.patch
#make config
#./config.sh --disable WITH_SSL CARDREADER_DB2COM
#make android-arm CROSS=${CROSS} USE_LIBCRYPTO=1
}
if [ "$API" -ge "16" ] ; then
CFLAGS="-D__ANDROID_API__=${API} -fPIE"
LDFLAGS="-Wl,-s -fPIE -pie"
else
CFLAGS="-D__ANDROID_API__=${API}"
LDFLAGS="-Wl,-s"
fi
    case $ABI in
	armeabi-v7a)
	TOOLCHAIN_NAME=arm-linux-androideabi
	ARCH="arm"
	export CFLAGS="-Os -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 $CFLAGS"
	export LDFLAGS="-march=armv7-a -Wl,--fix-cortex-a8 $LDFLAGS"
	CONFIG="android -march=armv7-a"
	build
	;;
	arm64-v8a)
	TOOLCHAIN_NAME=aarch64-linux-android
	ARCH="arm64"
	[ "$API" -lt "21" ] && API="21"
	export CFLAGS="-O2  $CFLAGS"
	export LDFLAGS="$LDFLAGS"
	CONFIG="android64-aarch64"
	build
	;;
	x86)
	TOOLCHAIN_NAME=i686-linux-android
	ARCH="x86"
	export CFLAGS="-O2 $CFLAGS"
	export LDFLAGS="$LDFLAGS"
	CONFIG="android-x86"
	build
	;;
	x86_64)
	TOOLCHAIN_NAME=x86_64-linux-android
	ARCH="x86_64"
	[ "$API" -lt "21" ] && API="21"
	export CFLAGS="-O2 $CFLAGS"
	export LDFLAGS="$LDFLAGS"
	CONFIG="android64"
	build
	;;
    esac
exit;

