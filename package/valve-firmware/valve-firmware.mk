VALVE_FIRMWARE_VERSION = 20231113.1
VALVE_FIRMWARE_SOURCE = linux-firmware-neptune-jupiter.$(VALVE_FIRMWARE_VERSION)-1-any.pkg.tar.zst
VALVE_FIRMWARE_SITE = https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64

define VALVE_FIRMWARE_EXTRACT_CMDS
    tar -xf $(DL_DIR)/$(VALVE_FIRMWARE_SOURCE) -C $(BUILD_DIR)
    tar -xf $(DL_DIR)/linux-firmware-neptune-20230121.1f01c88-1-any.pkg.tar.zst -C $(BUILD_DIR)
    tar -xf $(DL_DIR)/steamdeck-dsp-0.49-1-any.pkg.tar.zst -C $(BUILD_DIR)
endef

define VALVE_FIRMWARE_INSTALL_TARGET_CMDS
    install -D -m 755 $(BUILD_DIR)/usr/lib/firmware/ath11k/QCA206X/hw2.1/* $(TARGET_DIR)/lib/firmware/ath11k/QCA206X/hw2.1/
    install -D -m 755 $(BUILD_DIR)/usr/lib/firmware/cs35l41-dsp1-spk-cali.*.xz $(TARGET_DIR)/lib/firmware/cirrus/
    install -D -m 755 $(BUILD_DIR)/usr/lib/firmware/amd/sof/* $(TARGET_DIR)/lib/firmware/amd/sof/
    install -D -m 755 $(BUILD_DIR)/usr/lib/firmware/amd/sof-tplg/* $(TARGET_DIR)/lib/firmware/amd/sof-tplg/
    install -D -m 755 $(BUILD_DIR)/usr/lib/lv2/* $(TARGET_DIR)/lib/lv2/
    install -D -m 755 $(BUILD_DIR)/usr/lib/systemd/system/* $(TARGET_DIR)/lib/systemd/system/
    install -D -m 755 $(BUILD_DIR)/usr/share/alsa/ucm2/conf.d/* $(TARGET_DIR)/share/alsa/ucm2/conf.d/
    install -D -m 755 $(BUILD_DIR)/usr/share/pipewire/* $(TARGET_DIR)/share/pipewire/
    install -D -m 755 $(BUILD_DIR)/usr/share/wireplumber/* $(TARGET_DIR)/share/wireplumber/
endef

$(eval $(generic-package))
