.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern data_ov082_02214668
.extern ActorExtendedType2_Init

.global func_ov082_02212ae0
func_ov082_02212ae0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Init
    ldr r1, .L_02212afc
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02212afc: .word data_ov082_02214668
.size func_ov082_02212ae0, . - func_ov082_02212ae0
