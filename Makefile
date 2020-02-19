#
# Makefile by appleboy <appleboy.tw gmail.com="" at="">
#
obj-m       += src/hello.o
KVERSION := $(shell uname -r)

all: src/hello.ko

src/hello.ko: src/hello.c
	$(MAKE) -C /lib/modules/$(KVERSION)/build M=$(PWD) modules

install:
	install -D src/hello.ko \
		$(DESTDIR)/lib/modules/$(KVERSION)/hello.ko

clean:
	$(MAKE) -C /lib/modules/$(KVERSION)/build M=$(PWD) clean

distclean: clean

uninstall:
	-rm -f $(DESTDIR)/lib/modules/$(KVERSION)/hello.ko

insmod: src/hello.ko
	-insmod src/hello.ko

rmmod: src/hello.ko
	-rmmod src/hello.ko
