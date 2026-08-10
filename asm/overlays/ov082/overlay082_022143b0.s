.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern data_ov082_02214b18
.extern ActorExtendedType2_Init

.global func_ov082_022143b0
func_ov082_022143b0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Init
    ldr r0, .L_022143d4
    mov r1, #0x0
    str r0, [r4, #0x0]
    mov r0, r4
    str r1, [r4, #0x298]
    ldmia sp!, {r4, pc}
.L_022143d4: .word data_ov082_02214b18
.size func_ov082_022143b0, . - func_ov082_022143b0
