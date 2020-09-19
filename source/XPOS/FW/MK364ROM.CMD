call lk364rom.cmd
call lk364h.cmd
\xp\neptune\tools\makerom\obj\mips\makerom -s:20000 \neptune\g364rom.pgm obj\mips\g364romh.exe -o:200 obj\mips\g364rom.exe
copy \neptune\g364rom.pgm \\portasys\neptune\lluis
