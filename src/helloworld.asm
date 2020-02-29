.include "constants.inc"
.include "header.inc"

.segment "CODE"
.import nmi_handler
.import irq_handler
.import reset_handler

.export main
.proc main
  LDX PPUSTATUS
  LDX #$3F
  STX PPUADDR
  LDX #$00
  STX PPUADDR
  LDA #%00011110
  STA PPUMASK
load_palettes:
  LDA palettes,X
  STA PPUDATA
  INX
  CPX #$04
  JMP load_palettes
forever:
  JMP forever
.endproc


.segment "RODATA"
palettes:
.byte $29, $19, $09, $0f

.segment "VECTORS"
.addr nmi_handler, reset_handler, irq_handler

.segment "CHARS"
.res 8192

.segment "STARTUP"
