.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern data_ov083_02213f78
.extern ActorExtendedLinked_Init

.global func_ov083_02212ae0
func_ov083_02212ae0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedLinked_Init
    ldr r1, .L_02212afc
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02212afc: .word data_ov083_02213f78
.size func_ov083_02212ae0, . - func_ov083_02212ae0
