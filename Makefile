obj-m += altera_sld_hub_driver.o

ifndef SOC_LINUX_KERNEL_LOC
$(error SOC_LINUX_KERNEL_LOC is undefined. Set it to the linux kernel directory)
endif

.PHONY: default
default: all ;

all:
	$(MAKE) -C $(SOC_LINUX_KERNEL_LOC) M=$$PWD
	rm -f  *.o .*.o.*
	rm -f  *.order *.symvers  *.mod.*  .*.ko.*
	rm -rf .tmp_versions

