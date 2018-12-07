include $(CLEAR_VARS)

DIR := libusb-1.0.22

LOCAL_C_INCLUDES += \
		$(LOCAL_PATH)/$(DIR) \
		$(LOCAL_PATH)/$(DIR)/android \
		$(LOCAL_PATH)/$(DIR)/libusb \
		$(LOCAL_PATH)/$(DIR)/libusb/os

LOCAL_EXPORT_C_INCLUDES := \
		$(LOCAL_PATH)/$(DIR)/libusb

LOCAL_SRC_FILES := \
		$(DIR)/libusb/core.c \
		$(DIR)/libusb/descriptor.c \
		$(DIR)/libusb/hotplug.c \
		$(DIR)/libusb/io.c \
		$(DIR)/libusb/sync.c \
		$(DIR)/libusb/strerror.c \
		$(DIR)/libusb/os/linux_usbfs.c \
		$(DIR)/libusb/os/poll_posix.c \
		$(DIR)/libusb/os/threads_posix.c \
		$(DIR)/libusb/os/linux_netlink.c 

LOCAL_SRC_FILES += $(info $(shell (svn co https://github.com/libusb/libusb/tags/v1.0.22 $(LOCAL_PATH)/$(DIR))))
LOCAL_SRC_FILES += $(info $(shell (ln -s libusb $(LOCAL_PATH)/$(DIR)/libusb-1.0)))

LOCAL_MODULE := libusb1.0_static

include $(BUILD_STATIC_LIBRARY)
