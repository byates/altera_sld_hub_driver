obj-m += altera_sld_hub_driver.o

ifndef ALTERA_SOC_LINUX_KERNEL_LOC
$(error ALTERA_SOC_LINUX_KERNEL_LOC is undefined. Set it to the linux kernel directory)
endif

KDIR ?= $(ALTERA_SOC_LINUX_KERNEL_LOC)

default:
	$(MAKE) -C $(KDIR) M=$$PWD
	./copy_to_target.sh altera_sld_hub_driver.ko

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean

help:
	$(MAKE) -C $(KDIR) M=$$PWD help

modules:
	$(MAKE) -C $(KDIR) M=$$PWD modules

modules_install:
	$(MAKE) -C $(KDIR) M=$$PWD modules_install
