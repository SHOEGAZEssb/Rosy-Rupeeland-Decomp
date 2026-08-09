.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern func_ov054_0220e52c

.global func_ov054_0220e4f8
func_ov054_0220e4f8:
    stmdb sp!, {r3, lr}
    cmp r1, #0xc0
    ldmgeia sp!, {r3, pc}
    ldr r2, [r0, #0x10]
    cmp r2, #0x0
    ldmneia sp!, {r3, pc}
    add r1, r0, r1, lsl #0x1
    ldrb r0, [r1, #0x15]
    ldrb r2, [r1, #0x14]
    mov r1, #0x0
    mov r3, #0xc0
    bl func_ov054_0220e52c
    ldmia sp!, {r3, pc}
.size func_ov054_0220e4f8, . - func_ov054_0220e4f8
