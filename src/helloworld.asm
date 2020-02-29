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
  LDA #$28
  STA PPUDATA
  LDA #%00011110
  STA PPUMASK
forever:
  JMP forever
.endproc

.segment "VECTORS"
.addr nmi_handler, reset_handler, irq_handler

.segment "CHARS"
.res 8192
.segment "STARTUP"
