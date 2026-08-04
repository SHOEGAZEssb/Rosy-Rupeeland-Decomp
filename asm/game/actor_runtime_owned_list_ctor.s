; Matching retail form; see src/game/actor_runtime_collection_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern data_020d4458
.extern data_020d4468
.global func_0200adc8
func_0200adc8:
    ldr r1, L_0200ade8
    mov r2, #0x0
    stmia r0, {r1, r2}
    str r2, [r0, #0x8]
    ldr r1, L_0200adec
    str r2, [r0, #0xc]
    str r1, [r0, #0x0]
    bx lr
L_0200ade8: .word data_020d4468
L_0200adec: .word data_020d4458
.size func_0200adc8, . - func_0200adc8

