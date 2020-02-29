.include "constants.inc"

.segment "CODE"

.import main
.export nmi_handler

.proc nmi_handler
  LDA #$00
  STA OAMADDR
  LDA #$02
  STA OAMDMA
  RTI
.endproc
