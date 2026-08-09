.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221c344
func_ov095_0221c344:
    stmdb sp!, {r3, lr}
    adds r2, r0, #0x38
    str r1, [r0, #0x1fc]
    addne r2, r2, #0x4
    mov r1, #0x0
    str r1, [r2, #0x0]
    str r1, [r2, #0x4]
    str r1, [r2, #0x8]
    ldr r2, [r0, #0x14]
    sub r1, r1, #0x10000
    orr r2, r2, #0x800000
    str r2, [r0, #0x14]
    ldr r2, [r0, #0xd0]
    orr r2, r2, #0x2000
    str r2, [r0, #0xd0]
    ldr r2, [r0, #0x5c]
    and r1, r2, r1
    orr r1, r1, #0x8
    str r1, [r0, #0x5c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd8]
    blx r1
    ldmia sp!, {r3, pc}
.size func_ov095_0221c344, . - func_ov095_0221c344
