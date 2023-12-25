#!/bin/bash
# shellcheck disable=SC2015 # if echo fails we have bigger problems

function check {
  echo -ne "$*\t"
}

function ok {
  echo -e "[ \e[38;5;32msuccess\e[0m ]"
}

function nok {
  echo -e "[ \e[38;5;31mfailure\e[0m ]"
  (( noks = noks + 1 ))
  export noks
}

function warn {
  echo -e "[ \e[38;5;33mwarning\e[0m ]"
}

function format {
  awk -F'\t' '{ printf "%-60s %s\n",$1,$2 }'
}


wd=$(pwd)
export noks=0

(\
check getting qemu source;       git clone https://github.com/qemu/qemu.git                   >/dev/null 2>&1 && ok || nok
cd qemu || exit
check going back to 0.11;        git reset --hard 08fd2f30bd3ee5d04596da8293689af4d4f7eb6c    >/dev/null 2>&1 && ok || nok
check remove definition of BIT;  sed -i -e 's/#define BIT.n. .1 << .n../\/\/&/' hw/eepro100.c >/dev/null 2>&1 && ok || nok
check define BIT properly;       printf "#ifndef BIT\n#define BIT(n) (1 << (n))\n#endif\n" >> qemu-common.h   && ok || nok
check configure qemu;            ./configure --target-list=i386-softmmu \
                                             --disable-sdl \
                                             --disable-vnc-tls \
                                             --disable-vnc-sasl \
                                             --disable-vde                                    >/dev/null 2>&1 && ok || nok
check make qemu;                 make                                                         >/dev/null 2>&1 && ok || warn
cd i386-softmmu || exit
check build where make fails;    gcc -g -Wl,--warn-common  -m64  -o qemu \
                                     vl.o osdep.o monitor.o pci.o loader.o \
                                     isa_mmio.o machine.o gdbstub.o gdbstub-xml.o \
                                     msix.o ioport.o virtio-blk.o \
                                     virtio-balloon.o virtio-net.o virtio-console.o \
                                     kvm.o kvm-all.o usb-ohci.o eepro100.o ne2000.o \
                                     pcnet.o rtl8139.o e1000.o wdt_ib700.o \
                                     wdt_i6300esb.o ide.o pckbd.o vga.o  sb16.o es1370.o \
                                     ac97.o dma.o fdc.o mc146818rtc.o serial.o i8259.o \
                                     i8254.o pcspk.o pc.o cirrus_vga.o apic.o ioapic.o \
                                     parallel.o acpi.o piix_pci.o usb-uhci.o vmmouse.o \
                                     vmport.o vmware_vga.o hpet.o device-hotplug.o \
                                     pci-hotplug.o smbios.o \
                                     -Wl,--whole-archive ../libqemu_common.a libqemu.a ../libhw64/libqemuhw64.a \
                                     -Wl,--no-whole-archive \
                                     -lm -lrt -lpthread -lz -lutil -lncurses -ltinfo          >/dev/null 2>&1 && ok || nok
cd ..
check continue make qemu;        make                                                         >/dev/null 2>&1 && ok || nok
check make install qemu;         sudo make install                                            >/dev/null 2>&1 && ok || nok
check remove git tracking;       rm -rf .git                                                  >/dev/null 2>&1 && ok || nok
check test qemu;                 qemu --help                                                  >/dev/null 2>&1 && ok || nok
)|format

cd "${wd}"               || exit 1
tar -cf qemu.tar ./qemu/ || exit 1
bzip2 --best qemu.tar    || exit 1
mkdir gh-pages           || exit 1
cd gh-pages              || exit 1
mv ../qemu.tar.bz2 ./    || exit 1

echo "<HTML><HEAD><TITLE>LINKS</TITLE></HEAD><BODY><ul>" >index.html
# shellcheck disable=SC2010
for file in $(ls | grep -E -v "^index.html$| "); do \
    (\
        printf '<li><a href="'; \
        printf "%s" "${file}";  \
        printf '">';            \
        printf "%s" "${file}";  \
        printf '</a></li>\n'    \
    )>>index.html;              \
done
echo "</ul></BODY></HTML>" >>index.html
