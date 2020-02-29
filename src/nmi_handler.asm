.segment "CODE"

.import main
.export nmi_handler

.proc nmi_handler
  RTI
.endproc
