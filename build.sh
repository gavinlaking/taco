#!/bin/bash

set -euo pipefail

echo -ne "\e[32mCompiling...\e[39m\n"
ca65 src/helloworld.asm
ca65 src/nmi_handler.asm
ca65 src/irq_handler.asm
ca65 src/reset_handler.asm

echo -ne "\e[32mLinking...\e[39m\n"
ld65 src/*.o -C nes.cfg -o helloworld.nes

echo -ne "\e[32mExecuting...\e[39m\n"
# higan helloworld.nes
java -jar ~/Downloads/nintaco/Nintaco.jar helloworld.nes
