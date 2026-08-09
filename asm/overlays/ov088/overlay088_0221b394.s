.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern data_ov088_0221b84c
.extern func_ov088_022177e0

.global func_ov088_0221b394
func_ov088_0221b394:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov088_022177e0
    ldr r1, .L_0221b3b0
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0221b3b0: .word data_ov088_0221b84c
.size func_ov088_0221b394, . - func_ov088_0221b394
