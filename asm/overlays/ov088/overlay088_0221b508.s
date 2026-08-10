.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern data_ov088_0221b780
.extern ActorDerivedRuntime_Init

.global func_ov088_0221b508
func_ov088_0221b508:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorDerivedRuntime_Init
    ldr r1, .L_0221b524
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0221b524: .word data_ov088_0221b780
.size func_ov088_0221b508, . - func_ov088_0221b508
