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
}

function warn {
  echo -e "[ \e[38;5;33mwarning\e[0m ]"
}

function format {
  awk -F'\t' '{ printf "%-60s %s\n",$1,$2 }'
}

function index {
  cd "${wd}/gh-pages/" || return 1
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
  [[ -f index.html ]] && return 0
  return 1
}

wd=$(pwd)
export noks=0

(\
mkdir gh-pages || exit 1
cd /tmp/ || exit 1
check getting qemu source;       git clone https://github.com/qemu/qemu.git                   >/dev/null 2>&1 && ok || nok
cd qemu || exit 1
check going back to 0.11;        git reset --hard 08fd2f30bd3ee5d04596da8293689af4d4f7eb6c    >/dev/null 2>&1 && ok || nok
check remove definition of BIT;  sed -i -e 's/#define BIT.n. .1 << .n../\/\/&/' hw/eepro100.c >/dev/null 2>&1 && ok || nok
check define BIT properly;       printf "#ifndef BIT\n#define BIT(n) (1 << (n))\n#endif\n" >> qemu-common.h   && ok || nok
# Fix curses display on 64-bit: console_ch_t is 8 bytes but chtype is 4 bytes
# The old code casts directly causing garbled output. Convert element by element for now.
cp curses.c curses.corig1
check fix curses;                patch -p0 >/dev/null 2>&1 <<'__EOF__'                                        && ok || nok
--- curses.c
+++ curses.c
@@ -47,11 +47,16 @@

 static void curses_update(DisplayState *ds, int x, int y, int w, int h)
 {
-    chtype *line;
+    int i;
+    console_ch_t *line;
+    chtype curses_line[160];

-    line = ((chtype *) screen) + y * width;
-    for (h += y; y < h; y ++, line += width)
-        mvwaddchnstr(screenpad, y, 0, line, width);
+    line = screen + y * width;
+    for (h += y; y < h; y++, line += width) {
+        for (i = 0; i < width && i < 160; i++)
+            curses_line[i] = (chtype)(line[i] & 0xffffffff);
+        mvwaddchnstr(screenpad, y, 0, curses_line, width);
+    }

     pnoutrefresh(screenpad, py, px, sminy, sminx, smaxy - 1, smaxx - 1);
     refresh();
__EOF__
check remove tty test;           sed -i -n '$!N;/isatty/{n;n;n;n;d};P;D' curses.c            >/dev/null 2>&1 && ok || nok
check configure qemu;            ./configure --target-list=i386-softmmu \
                                             --disable-sdl \
                                             --disable-vnc-tls \
                                             --disable-vnc-sasl \
                                             --disable-vde \
                                             --extra-cflags="-fno-pie" \
                                             --extra-ldflags="-no-pie"                        >/dev/null 2>&1 && ok || nok
check make qemu;                 make > makeoutput.txt 2>&1  && ok || nok
check make install qemu;         sudo make install                                            >/dev/null 2>&1 && ok || nok
check remove git tracking;       rm -rf .git                                                  >/dev/null 2>&1 && ok || nok
check test qemu;                 qemu --help                                                  >/dev/null 2>&1 && ok || nok
check zip her up;                tar -cjf "${wd}"/gh-pages/qemu.tar.bz2 ./qemu                >/dev/null 2>&1 && ok || nok
check create gh-page;            index
)|format
