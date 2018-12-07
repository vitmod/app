##################################

libusb := true

##################################
# Android build config for oscam
##################################
config := --enable \
			WEBIF \
			WEBIF_LIVELOG \
			WEBIF_JQUERY \
			TOUCH \
			HAVE_DVBAPI \
			READ_SDT_CHARSETS \
			IRDETO_GUESSING \
			CS_ANTICASC \
			WITH_DEBUG \
			WITH_LB \
			CS_CACHEEX \
			CW_CYCLE_CHECK \
			WITH_EMU \
			MODULE_MONITOR \
			MODULE_CAMD35 \
			MODULE_CAMD35_TCP \
			MODULE_NEWCAMD \
			MODULE_CCCAM \
			MODULE_CCCSHARE \
			MODULE_GBOX \
			MODULE_RADEGAST \
			MODULE_SERIAL \
			MODULE_CONSTCW \
			MODULE_PANDORA \
			MODULE_GHTTP \
			MODULE_SCAM \
			READER_NAGRA \
			READER_IRDETO \
			READER_CONAX \
			READER_CRYPTOWORKS \
			READER_SECA \
			READER_VIACCESS \
			READER_VIDEOGUARD \
			READER_DRE \
			READER_TONGFANG \
			READER_BULCRYPT \
			READER_GRIFFIN \
			READER_DGCRYPT \
			CARDREADER_PHOENIX \
			CARDREADER_INTERNAL \
			CARDREADER_MP35 \
			CARDREADER_SC8IN1 \
			CARDREADER_SMARGO \
			CARDREADER_DB2COM \
			CARDREADER_STINGER \
			CARDREADER_DRECAS \
		--disable \
			LCDSUPPORT \
			LEDSUPPORT \
			IPV6SUPPORT \
			MODULE_CAMD33 \
			WITH_SSL CLOCKFIX CARDREADER_DB2COM READER_NAGRA_MERLIN

####################################

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
include $(LOCAL_PATH)/openssl.mk
ifeq ($(libusb),true)
include $(LOCAL_PATH)/libusb.mk
endif

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
		$(LOCAL_PATH)/oscam-svn \
		$(LOCAL_PATH)/openssl-1.1.0i/include

ifeq ($(libusb),true)
LOCAL_C_INCLUDES += \
		$(LOCAL_PATH)/libusb-1.0.22 \
		$(LOCAL_PATH)/libusb-1.0.22/android
endif

LOCAL_SRC_FILES := \
		oscam-svn/cscrypt/aes.c \
		oscam-svn/cscrypt/bn_add.c \
		oscam-svn/cscrypt/bn_asm.c \
		oscam-svn/cscrypt/bn_ctx.c \
		oscam-svn/cscrypt/bn_div.c \
		oscam-svn/cscrypt/bn_exp.c \
		oscam-svn/cscrypt/bn_lib.c \
		oscam-svn/cscrypt/bn_mul.c \
		oscam-svn/cscrypt/bn_print.c \
		oscam-svn/cscrypt/bn_shift.c \
		oscam-svn/cscrypt/bn_sqr.c \
		oscam-svn/cscrypt/bn_word.c \
		oscam-svn/cscrypt/mem.c \
		oscam-svn/cscrypt/des.c \
		oscam-svn/cscrypt/i_cbc.c \
		oscam-svn/cscrypt/i_ecb.c \
		oscam-svn/cscrypt/i_skey.c \
		oscam-svn/cscrypt/md5.c \
		oscam-svn/cscrypt/rc6.c \
		oscam-svn/cscrypt/sha1.c \
		oscam-svn/csctapi/atr.c \
		oscam-svn/csctapi/icc_async.c \
		oscam-svn/csctapi/io_serial.c \
		oscam-svn/csctapi/protocol_t0.c \
		oscam-svn/csctapi/protocol_t1.c \
		oscam-svn/csctapi/ifd_azbox.c \
		oscam-svn/csctapi/ifd_cool.c \
		oscam-svn/csctapi/ifd_db2com.c \
		oscam-svn/csctapi/ifd_mp35.c \
		oscam-svn/csctapi/ifd_pcsc.c \
		oscam-svn/csctapi/ifd_phoenix.c \
		oscam-svn/csctapi/ifd_drecas.c \
		oscam-svn/csctapi/ifd_sc8in1.c \
		oscam-svn/csctapi/ifd_sci.c \
		oscam-svn/csctapi/ifd_smargo.c \
		oscam-svn/csctapi/ifd_smartreader.c \
		oscam-svn/csctapi/ifd_stinger.c \
		oscam-svn/csctapi/ifd_stapi.c \
		oscam-svn/minilzo/minilzo.c \
		oscam-svn/module-anticasc.c \
		oscam-svn/module-cacheex.c \
		oscam-svn/module-camd33.c \
		oscam-svn/module-camd35-cacheex.c \
		oscam-svn/module-camd35.c \
		oscam-svn/module-cccam-cacheex.c \
		oscam-svn/module-cccam.c \
		oscam-svn/module-cccshare.c \
		oscam-svn/module-constcw.c \
		oscam-svn/module-csp.c \
		oscam-svn/module-cw-cycle-check.c \
		oscam-svn/module-dvbapi-azbox.c \
		oscam-svn/module-dvbapi-mca.c \
		oscam-svn/module-dvbapi-coolapi.c \
		oscam-svn/module-dvbapi-stapi.c \
		oscam-svn/module-dvbapi-stapi5.c \
		oscam-svn/module-dvbapi-chancache.c \
		oscam-svn/module-dvbapi.c \
		oscam-svn/ffdecsa/ffdecsa.c \
		oscam-svn/module-emulator.c \
		oscam-svn/module-emulator-osemu.c \
		oscam-svn/module-emulator-streamserver.c \
		oscam-svn/module-emulator-biss.c \
		oscam-svn/module-emulator-cryptoworks.c \
		oscam-svn/module-emulator-director.c \
		oscam-svn/module-emulator-drecrypt.c \
		oscam-svn/module-emulator-irdeto.c \
		oscam-svn/module-emulator-nagravision.c \
		oscam-svn/module-emulator-powervu.c \
		oscam-svn/module-emulator-viaccess.c \
		oscam-svn/module-emulator-videoguard.c \
		oscam-svn/module-gbox-helper.c \
		oscam-svn/module-gbox-remm.c \
		oscam-svn/module-gbox-sms.c \
		oscam-svn/module-gbox-cards.c \
		oscam-svn/module-gbox.c \
		oscam-svn/module-ird-guess.c \
		oscam-svn/module-lcd.c \
		oscam-svn/module-led.c \
		oscam-svn/module-monitor.c \
		oscam-svn/module-newcamd.c \
		oscam-svn/module-newcamd-des.c \
		oscam-svn/module-pandora.c \
		oscam-svn/module-ghttp.c \
		oscam-svn/module-radegast.c \
		oscam-svn/module-scam.c \
		oscam-svn/module-serial.c \
		oscam-svn/module-stat.c \
		oscam-svn/module-webif-lib.c \
		oscam-svn/module-webif-tpl.c \
		oscam-svn/module-webif.c \
		oscam-svn/webif/pages.c \
		oscam-svn/reader-common.c \
		oscam-svn/reader-bulcrypt.c \
		oscam-svn/reader-conax.c \
		oscam-svn/reader-cryptoworks.c \
		oscam-svn/reader-dgcrypt.c \
		oscam-svn/reader-dre-cas.c \
		oscam-svn/reader-dre-common.c \
		oscam-svn/reader-dre-st20.c \
		oscam-svn/reader-dre.c \
		oscam-svn/reader-griffin.c \
		oscam-svn/reader-irdeto.c \
		oscam-svn/reader-nagra.c \
		oscam-svn/reader-seca.c \
		oscam-svn/reader-tongfang.c \
		oscam-svn/reader-viaccess.c \
		oscam-svn/reader-videoguard-common.c \
		oscam-svn/reader-videoguard1.c \
		oscam-svn/reader-videoguard12.c \
		oscam-svn/reader-videoguard2.c \
		oscam-svn/oscam-aes.c \
		oscam-svn/oscam-array.c \
		oscam-svn/oscam-hashtable.c \
		oscam-svn/oscam-cache.c \
		oscam-svn/oscam-chk.c \
		oscam-svn/oscam-client.c \
		oscam-svn/oscam-conf.c \
		oscam-svn/oscam-conf-chk.c \
		oscam-svn/oscam-conf-mk.c \
		oscam-svn/oscam-config-account.c \
		oscam-svn/oscam-config-global.c \
		oscam-svn/oscam-config-reader.c \
		oscam-svn/oscam-config.c \
		oscam-svn/oscam-ecm.c \
		oscam-svn/oscam-emm.c \
		oscam-svn/oscam-emm-cache.c \
		oscam-svn/oscam-failban.c \
		oscam-svn/oscam-files.c \
		oscam-svn/oscam-garbage.c \
		oscam-svn/oscam-lock.c \
		oscam-svn/oscam-log.c \
		oscam-svn/oscam-log-reader.c \
		oscam-svn/oscam-net.c \
		oscam-svn/oscam-llist.c \
		oscam-svn/oscam-reader.c \
		oscam-svn/oscam-simples.c \
		oscam-svn/oscam-string.c \
		oscam-svn/oscam-time.c \
		oscam-svn/oscam-work.c \
		oscam-svn/oscam.c \
		oscam-svn/config.c

LOCAL_SRC_FILES += $(info $(shell (svn co https://github.com/oscam-emu/oscam-patched/trunk $(LOCAL_PATH)/oscam-svn)))
LOCAL_SRC_FILES += $(info $(shell ($(LOCAL_PATH)/oscam-svn/config.sh $(config) --make-config.mak)))
LOCAL_SRC_FILES += $(info $(shell (make -C $(LOCAL_PATH)/oscam-svn/webif --no-print-directory --quiet)))

LOCAL_MODULE := oscam
LOCAL_LDLIBS := -lm -ldl
LOCAL_LDFLAGS := -Wl,--gc-sections -Wl,-s
LOCAL_STATIC_LIBRARIES := libcrypto_static
REV := $(shell ($(LOCAL_PATH)/oscam-svn/config.sh -r))
LOCAL_CFLAGS := -O2 -ggdb -pipe -ffunction-sections -fdata-sections -fexpensive-optimizations \
		-DWITH_LIBCRYPTO=1 \
		-D'CS_CONFDIR="/var/tuxbox/config"' \
		-D'CS_SVN_VERSION="$(REV)-patched"' \
		-D'CS_TARGET="$(TOOLCHAIN_NAME) ($(TARGET_PLATFORM))"'

ifeq ($(libusb),true)
LOCAL_CFLAGS += -DWITH_LIBUSB=1 -DHAVE_PTHREAD_H
LOCAL_LDFLAGS += -llog
LOCAL_STATIC_LIBRARIES += libusb1.0_static
endif

include $(BUILD_EXECUTABLE)
