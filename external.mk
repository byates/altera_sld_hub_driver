################################################################################
#
# altera_sld_hub_driver
#
################################################################################

ALTERA_SLD_HUB_DRIVER_VERSION = 1.0.0
ALTERA_SLD_HUB_DRIVER_SITE_METHOD = wget
ALTERA_SLD_HUB_DRIVER_SOURCE = $(ALTERA_SLD_HUB_DRIVER_VERSION).tar.gz
ALTERA_SLD_HUB_DRIVER_SITE = https://github.com/byates/altera_sld_hub_driver/archive
ALTERA_SLD_HUB_DRIVER_LICENSE = GPL-2.0
ALTERA_SLD_HUB_DRIVER_INSTALL_STAGING = NO
ALTERA_SLD_HUB_DRIVER_INSTALL_TARGET = YES

# ------------------------------------------------------------------------
# THESE VARIABLES ARE REQUIRED BY THE KMOD MAKEFILE
#
# Kernel location is calculated form the base location assuming the
# standard directory layout and that buildroot takes care of building
# the kernel. The BASE_DIR is the overlay (external) location.
export SOC_LINUX_KERNEL_LOC=$(abspath $(wildcard $(BASE_DIR)/../buildroot/output/build/linux-socfpga-*))
export ARCH=arm

define ALTERA_SLD_HUB_DRIVER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

# Files that may exists on target and SDK. Typically all libraries (static and
# shared), all config files, etc.
define ALTERA_SLD_HUB_DRIVER_INSTALL_STAGING_CMDS
endef

# Files that only need to be on the target. Compared to staging/,
# target/ contains only the files and libraries needed to run the
# selected target applications: the development files (headers,
# etc.) are not present, the binaries are stripped.
define ALTERA_SLD_HUB_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/altera_sld_hub_driver.ko $(TARGET_DIR)/lib/modules/altera_sld_hub_driver.ko
	$(INSTALL) -D -m 0755 $(@D)/S30_sld_hub_driver $(TARGET_DIR)/etc/init.d/S30_sld_hub_driver
endef

$(eval $(generic-package))
