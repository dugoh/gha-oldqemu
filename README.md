# gha-oldqemu

WIP!

A reproducible build of an old qemu version (0.11) on a modern linux system. Reference being gha runners, currently Ubuntu 22.04.3 LTS/jammy. Its previous incarnation died together with Travis CI.

Build artifact at https://dugoh.github.io/gha-oldqemu/

The artifact is nothing more than a tarred up qemu source directory after the build. Fish out the binaries and bios you need or extract the tarball and run `make install`.

I don't do workflow, branches, commit messages here and have no qualms using main as a scratch pad. Hic Sunt Leones, here be dragons, buyer beware and all that. Worst case script.sh just provides you hints.

Pretty useless in its current state as it segvaults in all variations on the theme.

```
  CC    qemu-nbd.o
  CC    qemu-tool.o
  CC    tool-osdep.o
  CC    cutils.o
  CC    cache-utils.o
  CC    qemu-malloc.o
  CC    qemu-option.o
  CC    module.o
  CC    nbd.o
  CC    block.o
  CC    aio.o
  CC    aes.o
  CC    posix-aio-compat.o
  CC    block/cow.o
  CC    block/qcow.o
  CC    block/vmdk.o
  CC    block/cloop.o
  CC    block/dmg.o
  CC    block/bochs.o
  CC    block/vpc.o
block/vpc.c: In function ‘vpc_create’:
block/vpc.c:514:5: warning: ‘strncpy’ output truncated before terminating nul copying 8 bytes from a string of the same length [-Wstringop-truncation]
  514 |     strncpy(footer->creator, "conectix", 8);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
block/vpc.c:516:5: warning: ‘strncpy’ output truncated before terminating nul copying 4 bytes from a string of the same length [-Wstringop-truncation]
  516 |     strncpy(footer->creator_app, "qemu", 4);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
block/vpc.c:517:5: warning: ‘strncpy’ output truncated before terminating nul copying 4 bytes from a string of the same length [-Wstringop-truncation]
  517 |     strncpy(footer->creator_os, "Wi2k", 4);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
block/vpc.c:566:5: warning: ‘strncpy’ output truncated before terminating nul copying 8 bytes from a string of the same length [-Wstringop-truncation]
  566 |     strncpy(dyndisk_header->magic, "cxsparse", 8);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  CC    block/vvfat.o
  CC    block/qcow2.o
  CC    block/qcow2-refcount.o
  CC    block/qcow2-cluster.o
block/qcow2-cluster.c: In function ‘count_contiguous_clusters’:
block/qcow2-cluster.c:266:5: warning: this ‘for’ clause does not guard... [-Wmisleading-indentation]
  266 |     for (i = start; i < start + nb_clusters; i++)
      |     ^~~
block/qcow2-cluster.c:270:9: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘for’
  270 |         return (i - start);
      |         ^~~~~~
  CC    block/qcow2-snapshot.o
  CC    block/parallels.o
  CC    block/nbd.o
  CC    block/raw-posix.o
  LINK  qemu-nbd
  CC    qemu-io.o
  CC    cmd.o
  LINK  qemu-io
  GEN   qemu-img-cmds.h
  CC    qemu-img.o
  LINK  qemu-img
  CC    libhw64/virtio.o
  CC    libhw64/virtio-pci.o
  CC    libhw64/fw_cfg.o
  CC    libhw64/watchdog.o
  CC    libhw64/nand.o
  CC    libhw64/ecc.o
  CC    libhw64/m48t59.o
  CC    libhw64/escc.o
  CC    libhw64/lsi53c895a.o
/home/qemu/qemu/hw/lsi53c895a.c: In function ‘lsi_do_msgout’:
/home/qemu/qemu/hw/lsi53c895a.c:779:9: warning: variable ‘len’ set but not used [-Wunused-but-set-variable]
  779 |     int len;
      |         ^~~
  CC    libhw64/esp.o
  CC    libhw64/dma-helpers.o
  CC    libhw64/sysbus.o
  CC    libhw64/qdev-addr.o
  AR    libhw64/libqemuhw64.a
  CC    readline.o
  CC    console.o
  CC    irq.o
  CC    ptimer.o
  CC    i2c.o
  CC    smbus.o
  CC    smbus_eeprom.o
  CC    max7310.o
  CC    max111x.o
  CC    wm8750.o
/home/qemu/qemu/hw/wm8750.c: In function ‘wm8750_in_load’:
/home/qemu/qemu/hw/wm8750.c:64:9: warning: variable ‘acquired’ set but not used [-Wunused-but-set-variable]
   64 |     int acquired;
      |         ^~~~~~~~
/home/qemu/qemu/hw/wm8750.c: In function ‘wm8750_set_format’:
/home/qemu/qemu/hw/wm8750.c:174:24: warning: variable ‘monoout_fmt’ set but not used [-Wunused-but-set-variable]
  174 |     struct audsettings monoout_fmt;
      |                        ^~~~~~~~~~~
  CC    ssd0303.o
  CC    ssd0323.o
  CC    ads7846.o
  CC    stellaris_input.o
  CC    twl92230.o
  CC    tmp105.o
  CC    lm832x.o
  CC    eeprom93xx.o
  CC    tsc2005.o
  CC    scsi-disk.o
/home/qemu/qemu/hw/scsi-disk.c: In function ‘scsi_send_command’:
/home/qemu/qemu/hw/scsi-disk.c:368:9: warning: variable ‘cmdlen’ set but not used [-Wunused-but-set-variable]
  368 |     int cmdlen;
      |         ^~~~~~
  CC    cdrom.o
  CC    scsi-generic.o
  CC    usb.o
  CC    usb-hub.o
/home/qemu/qemu/hw/usb-hub.c: In function ‘usb_hub_handle_control’:
/home/qemu/qemu/hw/usb-hub.c:369:24: warning: variable ‘dev’ set but not used [-Wunused-but-set-variable]
  369 |             USBDevice *dev;
      |                        ^~~
  CC    usb-linux.o
usb-linux.c: In function ‘usb_host_claim_interfaces’:
usb-linux.c:310:35: warning: variable ‘nb_configurations’ set but not used [-Wunused-but-set-variable]
  310 |     int interface, nb_interfaces, nb_configurations;
      |                                   ^~~~~~~~~~~~~~~~~
  CC    usb-hid.o
  CC    usb-msd.o
  CC    usb-wacom.o
  CC    usb-serial.o
/home/qemu/qemu/hw/usb-serial.c: In function ‘usb_serial_init’:
/home/qemu/qemu/hw/usb-serial.c:584:76: warning: ‘)’ directive output may be truncated writing 1 byte into a region of size between 0 and 16 [-Wformat-truncation=]
  584 |     snprintf(s->dev.devname, sizeof(s->dev.devname), "QEMU USB Serial(%.16s)",
      |                                                                            ^
/home/qemu/qemu/hw/usb-serial.c:584:5: note: ‘snprintf’ output between 18 and 34 bytes into a destination of size 32
  584 |     snprintf(s->dev.devname, sizeof(s->dev.devname), "QEMU USB Serial(%.16s)",
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  585 |              filename);
      |              ~~~~~~~~~
  CC    usb-net.o
/home/qemu/qemu/hw/usb-net.c: In function ‘rndis_parse’:
/home/qemu/qemu/hw/usb-net.c:980:24: warning: variable ‘msg_length’ set but not used [-Wunused-but-set-variable]
  980 |     uint32_t msg_type, msg_length;
      |                        ^~~~~~~~~~
/home/qemu/qemu/hw/usb-net.c: In function ‘usbnet_receive’:
/home/qemu/qemu/hw/usb-net.c:1379:29: warning: comparison of constant ‘2’ with boolean expression is always false [-Wbool-compare]
 1379 |         if (!s->rndis_state == RNDIS_DATA_INITIALIZED)
      |                             ^~
/home/qemu/qemu/hw/usb-net.c:1379:29: warning: logical not is only applied to the left hand side of comparison [-Wlogical-not-parentheses]
/home/qemu/qemu/hw/usb-net.c:1379:13: note: add parentheses around left hand side expression to silence this warning
 1379 |         if (!s->rndis_state == RNDIS_DATA_INITIALIZED)
      |             ^~~~~~~~~~~~~~~
      |             (              )
/home/qemu/qemu/hw/usb-net.c: In function ‘usbnet_can_receive’:
/home/qemu/qemu/hw/usb-net.c:1413:37: warning: comparison of constant ‘2’ with boolean expression is always false [-Wbool-compare]
 1413 |     if (s->rndis && !s->rndis_state == RNDIS_DATA_INITIALIZED)
      |                                     ^~
/home/qemu/qemu/hw/usb-net.c:1413:37: warning: logical not is only applied to the left hand side of comparison [-Wlogical-not-parentheses]
/home/qemu/qemu/hw/usb-net.c:1413:21: note: add parentheses around left hand side expression to silence this warning
 1413 |     if (s->rndis && !s->rndis_state == RNDIS_DATA_INITIALIZED)
      |                     ^~~~~~~~~~~~~~~
      |                     (              )
  CC    sd.o
/home/qemu/qemu/hw/sd.c: In function ‘sd_app_command’:
/home/qemu/qemu/hw/sd.c:1123:14: warning: variable ‘rca’ set but not used [-Wunused-but-set-variable]
 1123 |     uint32_t rca;
      |              ^~~
At top level:
/home/qemu/qemu/hw/sd.c:144:28: warning: ‘sd_acmd_type’ defined but not used [-Wunused-const-variable=]
  144 | static const sd_cmd_type_t sd_acmd_type[64] = {
      |                            ^~~~~~~~~~~~
  CC    ssi-sd.o
  CC    bt.o
  CC    bt-host.o
  CC    bt-vhci.o
  CC    bt-l2cap.o
/home/qemu/qemu/hw/bt-l2cap.c: In function ‘l2cap_iframe_in’:
/home/qemu/qemu/hw/bt-l2cap.c:999:9: warning: this ‘if’ clause does not guard... [-Wmisleading-indentation]
  999 |         if (len != 4)
      |         ^~
/home/qemu/qemu/hw/bt-l2cap.c:1001:13: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘if’
 1001 |             return;
      |             ^~~~~~
  CC    bt-sdp.o
/home/qemu/qemu/hw/bt-sdp.c: In function ‘sdp_svc_search’:
/home/qemu/qemu/hw/bt-sdp.c:174:5: warning: this ‘if’ clause does not guard... [-Wmisleading-indentation]
  174 |     if (len > 1);
      |     ^~
/home/qemu/qemu/hw/bt-sdp.c:175:9: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘if’
  175 |         return -SDP_INVALID_SYNTAX;
      |         ^~~~~~
  CC    bt-hci.o
/home/qemu/qemu/hw/bt-hci.c: In function ‘bt_hci_version_req’:
/home/qemu/qemu/hw/bt-hci.c:997:25: warning: variable ‘slave’ set but not used [-Wunused-but-set-variable]
  997 |     struct bt_device_s *slave;
      |                         ^~~~~
/home/qemu/qemu/hw/bt-hci.c: In function ‘bt_submit_hci’:
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1530:33: note: in expansion of macro ‘PARAM16’
 1530 |                                 PARAM16(periodic_inquiry, min_period) &&
      |                                 ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1531:33: note: in expansion of macro ‘PARAM16’
 1531 |                                 PARAM16(periodic_inquiry, min_period) <
      |                                 ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1532:33: note: in expansion of macro ‘PARAM16’
 1532 |                                 PARAM16(periodic_inquiry, max_period)) ||
      |                                 ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1534:25: note: in expansion of macro ‘PARAM16’
 1534 |                         PARAM16(periodic_inquiry, min_period) < 2 ||
      |                         ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1535:25: note: in expansion of macro ‘PARAM16’
 1535 |                         PARAM16(periodic_inquiry, max_period) < 3) {
      |                         ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1544:34: note: in expansion of macro ‘PARAM16’
 1544 |         hci->lm.inquiry_period = PARAM16(periodic_inquiry, max_period);
      |                                  ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1723:13: note: in expansion of macro ‘PARAM16’
 1723 |         if (PARAM16(hold_mode, min_interval) >
      |             ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1724:25: note: in expansion of macro ‘PARAM16’
 1724 |                         PARAM16(hold_mode, max_interval) ||
      |                         ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1725:25: note: in expansion of macro ‘PARAM16’
 1725 |                         PARAM16(hold_mode, min_interval) < 0x0002 ||
      |                         ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1726:25: note: in expansion of macro ‘PARAM16’
 1726 |                         PARAM16(hold_mode, max_interval) > 0xff00 ||
      |                         ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1727:26: note: in expansion of macro ‘PARAM16’
 1727 |                         (PARAM16(hold_mode, min_interval) & 1) ||
      |                          ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1728:26: note: in expansion of macro ‘PARAM16’
 1728 |                         (PARAM16(hold_mode, max_interval) & 1)) {
      |                          ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1734:33: note: in expansion of macro ‘PARAM16’
 1734 |                                 PARAM16(hold_mode, max_interval),
      |                                 ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1742:13: note: in expansion of macro ‘PARAM16’
 1742 |         if (PARAM16(park_mode, min_interval) >
      |             ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1743:25: note: in expansion of macro ‘PARAM16’
 1743 |                         PARAM16(park_mode, max_interval) ||
      |                         ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1744:25: note: in expansion of macro ‘PARAM16’
 1744 |                         PARAM16(park_mode, min_interval) < 0x000e ||
      |                         ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1745:26: note: in expansion of macro ‘PARAM16’
 1745 |                         (PARAM16(park_mode, min_interval) & 1) ||
      |                          ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1746:26: note: in expansion of macro ‘PARAM16’
 1746 |                         (PARAM16(park_mode, max_interval) & 1)) {
      |                          ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1752:33: note: in expansion of macro ‘PARAM16’
 1752 |                                 PARAM16(park_mode, max_interval),
      |                                 ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1838:13: note: in expansion of macro ‘PARAM16’
 1838 |         if (PARAM16(write_conn_accept_timeout, timeout) < 0x0001 ||
      |             ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1839:25: note: in expansion of macro ‘PARAM16’
 1839 |                         PARAM16(write_conn_accept_timeout, timeout) > 0xb540) {
      |                         ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c:1488:46: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
 1488 | #define PARAM16(cmd, param)     le16_to_cpup(&PARAM(cmd, param))
      |                                              ^
/home/qemu/qemu/hw/bt-hci.c:1844:33: note: in expansion of macro ‘PARAM16’
 1844 |         hci->conn_accept_tout = PARAM16(write_conn_accept_timeout, timeout);
      |                                 ^~~~~~~
/home/qemu/qemu/hw/bt-hci.c: In function ‘bt_submit_sco’:
/home/qemu/qemu/hw/bt-hci.c:2083:23: warning: variable ‘link’ set but not used [-Wunused-but-set-variable]
 2083 |     struct bt_link_s *link;
      |                       ^~~~
  CC    bt-hid.o
  CC    usb-bt.o
  CC    bt-hci-csr.o
  CC    buffered_file.o
  CC    migration.o
  CC    migration-tcp.o
  CC    net.o
net.c: In function ‘slirp_smb_cleanup’:
net.c:1091:44: warning: ‘%s’ directive output may be truncated writing up to 127 bytes into a region of size 121 [-Wformat-truncation=]
 1091 |         snprintf(cmd, sizeof(cmd), "rm -rf %s", s->smb_dir);
      |                                            ^~
net.c:1091:9: note: ‘snprintf’ output between 8 and 135 bytes into a destination of size 128
 1091 |         snprintf(cmd, sizeof(cmd), "rm -rf %s", s->smb_dir);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
net.c: In function ‘slirp_smb’:
net.c:1112:46: warning: ‘%s’ directive output may be truncated writing 8 bytes into a region of size between 0 and 127 [-Wformat-truncation=]
 1112 |     snprintf(smb_conf, sizeof(smb_conf), "%s/%s", s->smb_dir, "smb.conf");
      |                                              ^~               ~~~~~~~~~~
net.c:1112:5: note: ‘snprintf’ output between 10 and 137 bytes into a destination of size 128
 1112 |     snprintf(smb_conf, sizeof(smb_conf), "%s/%s", s->smb_dir, "smb.conf");
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
net.c:1144:55: warning: ‘%s’ directive output may be truncated writing up to 127 bytes into a region of size 110 [-Wformat-truncation=]
 1144 |     snprintf(smb_cmdline, sizeof(smb_cmdline), "%s -s %s",
      |                                                       ^~
 1145 |              SMBD_COMMAND, smb_conf);
      |                            ~~~~~~~~
net.c:1144:5: note: ‘snprintf’ output between 19 and 146 bytes into a destination of size 128
 1144 |     snprintf(smb_cmdline, sizeof(smb_cmdline), "%s -s %s",
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1145 |              SMBD_COMMAND, smb_conf);
      |              ~~~~~~~~~~~~~~~~~~~~~~~
  CC    qemu-sockets.o
  CC    qemu-char.o
  CC    net-checksum.o
  CC    savevm.o
  CC    msmouse.o
  CC    ps2.o
  CC    qdev.o
  CC    qdev-properties.o
  CC    ssi.o
  CC    migration-exec.o
  CC    audio/audio.o
  CC    audio/noaudio.o
  CC    audio/wavaudio.o
  CC    audio/mixeng.o
  CC    audio/ossaudio.o
  CC    audio/wavcapture.o
  CC    keymaps.o
  CC    curses.o
  CC    vnc.o
vnc.c: In function ‘vnc_client_write’:
vnc.c:1064:10: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
 1064 |     long ret;
      |          ^~~
vnc.c: In function ‘vnc_display_open’:
vnc.c:2227:9: warning: variable ‘acl’ set but not used [-Wunused-but-set-variable]
 2227 |     int acl = 0;
      |         ^~~
vnc.c:2219:9: warning: variable ‘to_port’ set but not used [-Wunused-but-set-variable]
 2219 |     int to_port = 0;
      |         ^~~~~~~
  CC    acl.o
  CC    d3des.o
  CC    slirp/cksum.o
  CC    slirp/if.o
  CC    slirp/ip_icmp.o
  CC    slirp/ip_input.o
  CC    slirp/ip_output.o
  CC    slirp/slirp.o
  CC    slirp/mbuf.o
  CC    slirp/misc.o
slirp/misc.c: In function ‘u_sleep’:
slirp/misc.c:326:19: warning: passing argument 2 to ‘restrict’-qualified parameter aliases with arguments 3, 4 [-Wrestrict]
  326 |         select(0, &fdset, &fdset, &fdset, &t);
      |                   ^~~~~~  ~~~~~~  ~~~~~~
  CC    slirp/sbuf.o
  CC    slirp/socket.o
  CC    slirp/tcp_input.o
  CC    slirp/tcp_output.o
  CC    slirp/tcp_subr.o
  CC    slirp/tcp_timer.o
  CC    slirp/udp.o
  CC    slirp/bootp.o
  CC    slirp/tftp.o
slirp/tftp.c: In function ‘tftp_send_error’:
slirp/tftp.c:164:7: warning: variable ‘nobytes’ set but not used [-Wunused-but-set-variable]
  164 |   int nobytes;
      |       ^~~~~~~
  AR    libqemu_common.a
  GEN   i386-softmmu/qemu-options.h
  CC    i386-softmmu/vl.o
/home/qemu/qemu/vl.c: In function ‘drive_init’:
/home/qemu/qemu/vl.c:2298:43: warning: ‘snprintf’ output may be truncated before the last format character [-Wformat-truncation=]
 2298 |         snprintf(buf, sizeof(buf), "%s%s%i",
      |                                           ^
/home/qemu/qemu/vl.c:2298:9: note: ‘snprintf’ output 2 or more bytes (assuming 129) into a destination of size 128
 2298 |         snprintf(buf, sizeof(buf), "%s%s%i",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 2299 |                  devname, mediastr, unit_id);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/qemu/qemu/vl.c:2295:43: warning: ‘%i’ directive output may be truncated writing between 1 and 11 bytes into a region of size between 0 and 127 [-Wformat-truncation=]
 2295 |         snprintf(buf, sizeof(buf), "%s%i%s%i",
      |                                           ^~
/home/qemu/qemu/vl.c:2295:9: note: ‘snprintf’ output 3 or more bytes (assuming 130) into a destination of size 128
 2295 |         snprintf(buf, sizeof(buf), "%s%i%s%i",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 2296 |                  devname, bus_id, mediastr, unit_id);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  CC    i386-softmmu/osdep.o
  GEN   i386-softmmu/qemu-monitor.h
  CC    i386-softmmu/monitor.o
/home/qemu/qemu/monitor.c: In function ‘memory_dump’:
/home/qemu/qemu/monitor.c:648:9: warning: variable ‘nb_per_line’ set but not used [-Wunused-but-set-variable]
  648 |     int nb_per_line, l, line_size, i, max_digits, len;
      |         ^~~~~~~~~~~
  CC    i386-softmmu/pci.o
  CC    i386-softmmu/loader.o
  CC    i386-softmmu/isa_mmio.o
  CC    i386-softmmu/machine.o
  CC    i386-softmmu/gdbstub.o
  GEN   i386-softmmu/gdbstub-xml.c
  CC    i386-softmmu/gdbstub-xml.o
  CC    i386-softmmu/msix.o
  CC    i386-softmmu/ioport.o
  CC    i386-softmmu/virtio-blk.o
/home/qemu/qemu/hw/virtio-blk.c: In function ‘virtio_identify_template’:
/home/qemu/qemu/hw/virtio-blk.c:58:19: warning: taking address of packed member of ‘struct virtio_blk_config’ may result in an unaligned pointer value [-Waddress-of-packed-member]
   58 |     uint16_t *p = &bc->identify[0];
      |                   ^~~~~~~~~~~~~~~~
  CC    i386-softmmu/virtio-balloon.o
  CC    i386-softmmu/virtio-net.o
  CC    i386-softmmu/virtio-console.o
  CC    i386-softmmu/kvm.o
/home/qemu/qemu/target-i386/kvm.c: In function ‘kvm_arch_init_vcpu’:
/home/qemu/qemu/target-i386/kvm.c:162:38: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
  162 |         struct kvm_cpuid_entry2 *c = &cpuid_data.entries[cpuid_i++];
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/qemu/qemu/target-i386/kvm.c:176:21: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
  176 |                 c = &cpuid_data.entries[cpuid_i++];
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/qemu/qemu/target-i386/kvm.c:199:21: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
  199 |                 c = &cpuid_data.entries[cpuid_i++];
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/qemu/qemu/target-i386/kvm.c:212:38: warning: taking address of packed member of ‘struct <anonymous>’ may result in an unaligned pointer value [-Waddress-of-packed-member]
  212 |         struct kvm_cpuid_entry2 *c = &cpuid_data.entries[cpuid_i++];
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  CC    i386-softmmu/kvm-all.o
  CC    i386-softmmu/usb-ohci.o
/home/qemu/qemu/hw/usb-ohci.c: In function ‘ohci_service_iso_td’:
/home/qemu/qemu/hw/usb-ohci.c:607:17: warning: variable ‘str’ set but not used [-Wunused-but-set-variable]
  607 |     const char *str = NULL;
      |                 ^~~
/home/qemu/qemu/hw/usb-ohci.c: In function ‘ohci_service_td’:
/home/qemu/qemu/hw/usb-ohci.c:842:17: warning: variable ‘str’ set but not used [-Wunused-but-set-variable]
  842 |     const char *str = NULL;
      |                 ^~~
  CC    i386-softmmu/eepro100.o
/home/qemu/qemu/hw/eepro100.c:246:23: warning: ‘eepro100_mdi_mask’ defined but not used [-Wunused-const-variable=]
  246 | static const uint16_t eepro100_mdi_mask[] = {
      |                       ^~~~~~~~~~~~~~~~~
  CC    i386-softmmu/ne2000.o
  CC    i386-softmmu/pcnet.o
  CC    i386-softmmu/rtl8139.o
/home/qemu/qemu/hw/rtl8139.c: In function ‘rtl8139_cplus_transmit_one’:
/home/qemu/qemu/hw/rtl8139.c:1925:25: warning: variable ‘txdw1’ set but not used [-Wunused-but-set-variable]
 1925 |     uint32_t val, txdw0,txdw1,txbufLO,txbufHI;
      |                         ^~~~~
  CC    i386-softmmu/e1000.o
  CC    i386-softmmu/wdt_ib700.o
  CC    i386-softmmu/wdt_i6300esb.o
  CC    i386-softmmu/ide.o
  CC    i386-softmmu/pckbd.o
  CC    i386-softmmu/vga.o
/home/qemu/qemu/hw/vga.c: In function ‘vga_precise_update_retrace_info’:
/home/qemu/qemu/hw/vga.c:172:15: warning: variable ‘sldiv2’ set but not used [-Wunused-but-set-variable]
  172 |     int div2, sldiv2, dots;
      |               ^~~~~~
/home/qemu/qemu/hw/vga.c:172:9: warning: variable ‘div2’ set but not used [-Wunused-but-set-variable]
  172 |     int div2, sldiv2, dots;
      |         ^~~~
  CC    i386-softmmu/sb16.o
  CC    i386-softmmu/es1370.o
  CC    i386-softmmu/ac97.o
  CC    i386-softmmu/dma.o
  CC    i386-softmmu/fdc.o
  CC    i386-softmmu/mc146818rtc.o
  CC    i386-softmmu/serial.o
  CC    i386-softmmu/i8259.o
  CC    i386-softmmu/i8254.o
  CC    i386-softmmu/pcspk.o
  CC    i386-softmmu/pc.o
/home/qemu/qemu/hw/pc.c: In function ‘load_linux’:
/home/qemu/qemu/hw/pc.c:992:39: warning: operation on ‘seg[4]’ may be undefined [-Wsequence-point]
  992 |     seg[0] = seg[2] = seg[3] = seg[4] = seg[4] = real_seg;
      |                                ~~~~~~~^~~~~~~~~~~~~~~~~~~
/home/qemu/qemu/hw/pc.c: In function ‘pc_init1’:
/home/qemu/qemu/hw/pc.c:1120:15: warning: variable ‘env’ set but not used [-Wunused-but-set-variable]
 1120 |     CPUState *env;
      |               ^~~
  CC    i386-softmmu/cirrus_vga.o
In file included from /home/qemu/qemu/hw/cirrus_vga_rop.h:174,
                 from /home/qemu/qemu/hw/cirrus_vga.c:323:
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_patternfill_0_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:48:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
   48 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_transp_0_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:104:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  104 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_0_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:154:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  154 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_transp_0_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:189:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  189 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_0_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:234:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  234 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_fill_0_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:264:14: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  264 |     uint32_t col;
      |              ^~~
In file included from /home/qemu/qemu/hw/cirrus_vga_rop.h:177,
                 from /home/qemu/qemu/hw/cirrus_vga.c:323:
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_patternfill_0_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:48:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
   48 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_transp_0_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:104:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  104 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_0_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:154:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  154 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_transp_0_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:189:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  189 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_0_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:234:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  234 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_fill_0_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:264:14: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  264 |     uint32_t col;
      |              ^~~
In file included from /home/qemu/qemu/hw/cirrus_vga_rop.h:180,
                 from /home/qemu/qemu/hw/cirrus_vga.c:323:
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_patternfill_0_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:48:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
   48 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_transp_0_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:104:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  104 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_0_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:154:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  154 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_transp_0_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:189:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  189 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_0_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:234:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  234 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_fill_0_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:264:14: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  264 |     uint32_t col;
      |              ^~~
In file included from /home/qemu/qemu/hw/cirrus_vga_rop.h:183,
                 from /home/qemu/qemu/hw/cirrus_vga.c:323:
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_patternfill_0_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:48:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
   48 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_transp_0_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:104:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  104 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_0_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:154:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  154 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_transp_0_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:189:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  189 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_0_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:234:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  234 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_fill_0_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:264:14: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  264 |     uint32_t col;
      |              ^~~
In file included from /home/qemu/qemu/hw/cirrus_vga_rop.h:174,
                 from /home/qemu/qemu/hw/cirrus_vga.c:335:
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_patternfill_notdst_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:48:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
   48 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_transp_notdst_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:104:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  104 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_notdst_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:154:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  154 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_transp_notdst_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:189:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  189 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_notdst_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:234:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  234 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_fill_notdst_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:264:14: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  264 |     uint32_t col;
      |              ^~~
In file included from /home/qemu/qemu/hw/cirrus_vga_rop.h:177,
                 from /home/qemu/qemu/hw/cirrus_vga.c:335:
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_patternfill_notdst_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:48:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
   48 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_transp_notdst_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:104:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  104 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_notdst_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:154:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  154 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_transp_notdst_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:189:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  189 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_notdst_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:234:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  234 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_fill_notdst_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:264:14: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  264 |     uint32_t col;
      |              ^~~
In file included from /home/qemu/qemu/hw/cirrus_vga_rop.h:180,
                 from /home/qemu/qemu/hw/cirrus_vga.c:335:
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_patternfill_notdst_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:48:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
   48 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_transp_notdst_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:104:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  104 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_notdst_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:154:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  154 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_transp_notdst_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:189:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  189 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_notdst_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:234:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  234 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_fill_notdst_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:264:14: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  264 |     uint32_t col;
      |              ^~~
In file included from /home/qemu/qemu/hw/cirrus_vga_rop.h:183,
                 from /home/qemu/qemu/hw/cirrus_vga.c:335:
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_patternfill_notdst_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:48:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
   48 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_transp_notdst_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:104:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  104 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_notdst_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:154:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  154 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_transp_notdst_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:189:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  189 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_notdst_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:234:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  234 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_fill_notdst_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:264:14: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  264 |     uint32_t col;
      |              ^~~
In file included from /home/qemu/qemu/hw/cirrus_vga_rop.h:174,
                 from /home/qemu/qemu/hw/cirrus_vga.c:343:
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_patternfill_1_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:48:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
   48 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_transp_1_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:104:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  104 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_1_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:154:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  154 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_transp_1_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:189:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  189 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_1_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:234:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  234 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_fill_1_8’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:264:14: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  264 |     uint32_t col;
      |              ^~~
In file included from /home/qemu/qemu/hw/cirrus_vga_rop.h:177,
                 from /home/qemu/qemu/hw/cirrus_vga.c:343:
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_patternfill_1_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:48:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
   48 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_transp_1_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:104:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  104 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_1_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:154:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  154 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_transp_1_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:189:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  189 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_1_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:234:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  234 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_fill_1_16’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:264:14: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  264 |     uint32_t col;
      |              ^~~
In file included from /home/qemu/qemu/hw/cirrus_vga_rop.h:180,
                 from /home/qemu/qemu/hw/cirrus_vga.c:343:
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_patternfill_1_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:48:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
   48 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_transp_1_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:104:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  104 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_1_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:154:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  154 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_transp_1_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:189:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  189 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_1_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:234:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  234 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_fill_1_24’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:264:14: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  264 |     uint32_t col;
      |              ^~~
In file included from /home/qemu/qemu/hw/cirrus_vga_rop.h:183,
                 from /home/qemu/qemu/hw/cirrus_vga.c:343:
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_patternfill_1_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:48:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
   48 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_transp_1_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:104:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  104 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_1_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:154:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  154 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_transp_1_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:189:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  189 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_colorexpand_pattern_1_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:234:18: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  234 |     unsigned int col;
      |                  ^~~
/home/qemu/qemu/hw/cirrus_vga_rop2.h: In function ‘cirrus_fill_1_32’:
/home/qemu/qemu/hw/cirrus_vga_rop2.h:264:14: warning: variable ‘col’ set but not used [-Wunused-but-set-variable]
  264 |     uint32_t col;
      |              ^~~
  CC    i386-softmmu/apic.o
  CC    i386-softmmu/ioapic.o
  CC    i386-softmmu/parallel.o
  CC    i386-softmmu/acpi.o
/home/qemu/qemu/hw/acpi.c: In function ‘get_pmsts’:
/home/qemu/qemu/hw/acpi.c:89:9: warning: variable ‘pmsts’ set but not used [-Wunused-but-set-variable]
   89 |     int pmsts;
      |         ^~~~~
  CC    i386-softmmu/piix_pci.o
  CC    i386-softmmu/usb-uhci.o
  CC    i386-softmmu/vmmouse.o
  CC    i386-softmmu/vmport.o
  CC    i386-softmmu/vmware_vga.o
  CC    i386-softmmu/hpet.o
  CC    i386-softmmu/device-hotplug.o
  CC    i386-softmmu/pci-hotplug.o
/home/qemu/qemu/hw/pci-hotplug.c: In function ‘drive_hot_add’:
/home/qemu/qemu/hw/pci-hotplug.c:55:26: warning: variable ‘bus’ set but not used [-Wunused-but-set-variable]
   55 |     int drive_idx, type, bus;
      |                          ^~~
  CC    i386-softmmu/smbios.o
  CC    i386-softmmu/exec.o
/home/qemu/qemu/exec.c: In function ‘qemu_ram_addr_from_host’:
/home/qemu/qemu/exec.c:2527:16: warning: variable ‘prevp’ set but not used [-Wunused-but-set-variable]
 2527 |     RAMBlock **prevp;
      |                ^~~~~
  CC    i386-softmmu/translate-all.o
  CC    i386-softmmu/cpu-exec.o
  CC    i386-softmmu/translate.o
/home/qemu/qemu/target-i386/translate.c: In function ‘disas_insn’:
/home/qemu/qemu/target-i386/translate.c:4045:9: warning: variable ‘rex_w’ set but not used [-Wunused-but-set-variable]
 4045 |     int rex_w, rex_r;
      |         ^~~~~
/home/qemu/qemu/target-i386/translate.c: In function ‘gen_intermediate_code_internal’:
/home/qemu/qemu/target-i386/translate.c:7607:16: warning: variable ‘cflags’ set but not used [-Wunused-but-set-variable]
 7607 |     int j, lj, cflags;
      |                ^~~~~~
  CC    i386-softmmu/host-utils.o
  CC    i386-softmmu/kqemu.o
/home/qemu/qemu/kqemu.c: In function ‘kqemu_modify_page’:
/home/qemu/qemu/kqemu.c:295:9: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
  295 |     int ret;
      |         ^~~
/home/qemu/qemu/kqemu.c: In function ‘save_native_fp_fsave’:
/home/qemu/qemu/kqemu.c:435:19: warning: ‘fp1’ is used uninitialized [-Wuninitialized]
  435 |     env->fpuc = fp->fpuc;
      |                 ~~^~~~~~
/home/qemu/qemu/kqemu.c:432:20: note: ‘fp1’ declared here
  432 |     struct fpstate fp1, *fp = &fp1;
      |                    ^~~
  CC    i386-softmmu/tcg/tcg.o
/home/qemu/qemu/tcg/tcg.c: In function ‘tcg_gen_callN’:
/home/qemu/qemu/tcg/tcg.c:548:9: warning: variable ‘call_type’ set but not used [-Wunused-but-set-variable]
  548 |     int call_type;
      |         ^~~~~~~~~
  CC    i386-softmmu/tcg/tcg-runtime.o
  CC    i386-softmmu/fpu/softfloat-native.o
  CC    i386-softmmu/op_helper.o
/home/qemu/qemu/target-i386/op_helper.c: In function ‘switch_tss’:
/home/qemu/qemu/target-i386/op_helper.c:282:53: warning: variable ‘new_trap’ set but not used [-Wunused-but-set-variable]
  282 |     uint32_t new_eflags, new_eip, new_cr3, new_ldt, new_trap;
      |                                                     ^~~~~~~~
  CC    i386-softmmu/helper.o
  CC    i386-softmmu/disas.o
  CC    i386-softmmu/i386-dis.o
/home/qemu/qemu/i386-dis.c: In function ‘OP_sI’:
/home/qemu/qemu/i386-dis.c:5523:18: warning: variable ‘mask’ set but not used [-Wunused-but-set-variable]
 5523 |   bfd_signed_vma mask = -1;
      |                  ^~~~
  AR    i386-softmmu/libqemu.a
  LINK  i386-softmmu/qemu
gcc -Wall -Wstrict-prototypes -Werror -fomit-frame-pointer -fno-builtin -I/home/qemu/qemu -fno-stack-protector -o multiboot.o -c multiboot.S
ld -Ttext 0 -e _start -s -o multiboot.img multiboot.o
objcopy -O binary -j .text multiboot.img multiboot.raw
/home/qemu/qemu/pc-bios/optionrom/signrom.sh multiboot.raw multiboot.bin
rm multiboot.raw multiboot.o multiboot.img
qemu@ppp:~/qemu$ i386-softmmu/qemu -L pc-bios -curses -fda ../002962_ms_dos_622/disk1.img
#1  0x00007fffffffdf10 in ?? ()
#2  0x00005555556b8b73 in tb_find_slow (pc=<error reading variable: Cannot access memory at address 0xe017>, cs_base=<error reading variable: Cannot access memory at address 0xe013>,
    flags=<error reading variable: Cannot access memory at address 0xe00b>) at /home/qemu/qemu/cpu-exec.c:168
Backtrace stopped: previous frame inner to this frame (corrupt stack?)
(gdb)
```
