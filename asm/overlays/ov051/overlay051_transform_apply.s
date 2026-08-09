.text
; Matching fallback for the portable implementation in src/overlays/ov051/overlay051_shared_recovery.c.
.extern func_020befec

.global func_ov051_0220d774
func_ov051_0220d774:
    stmdb sp!, {r4, lr}
    mov r4, r0
    sub r0, r1, r2
    cmp r1, r2
    movle ip, r1
    add r0, r0, r0, lsr #0x1f
    movgt ip, r2
    movs r0, r0, asr #0x1
    str r0, [r4, #0x0]
    rsbmi r0, r0, #0x0
    add r2, ip, r0
    mov r1, r3
    mov r0, #0x10000
    str r2, [r4, #0x4]
    bl func_020befec
    str r0, [r4, #0x8]
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov051_0220d774, . - func_ov051_0220d774
