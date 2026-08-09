.text
; Matching fallback for the portable implementation in src/overlays/ov057/overlay057_recovery.c.
.extern func_020af938
.extern func_020af958
.extern func_020b581c

.global func_ov057_0220e5ac
func_ov057_0220e5ac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x24]
    subs r0, r0, #0x1
    str r0, [r4, #0x24]
    ldmplia sp!, {r4, pc}
    ldr r0, [r4, #0x20]
    add r0, r4, r0, lsl #0x1
    ldrsh r0, [r0, #0x18]
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x14
    str r0, [r4, #0x24]
    bl func_020af958
    ldr r1, [r4, #0x20]
    ldr r3, [r4, #0x8]
    add r1, r4, r1, lsl #0x1
    ldrsh r2, [r1, #0x18]
    mov r1, r0
    ldr r3, [r3, #0x24]
    mov r0, r2, lsl #0x1c
    mov r0, r0, asr #0x1c
    add r0, r3, r0, lsl #0xb
    mov r2, #0x800
    bl func_020b581c
    bl func_020af938
    ldr r1, [r4, #0x20]
    ldr r3, [r4, #0x8]
    add r1, r4, r1, lsl #0x1
    ldrsh r2, [r1, #0x18]
    mov r1, r0
    ldr r3, [r3, #0x24]
    mov r0, r2, lsl #0x1c
    mov r0, r0, asr #0x1c
    add r0, r3, r0, lsl #0xb
    mov r2, #0x800
    bl func_020b581c
    ldr r0, [r4, #0x20]
    add r0, r0, #0x1
    str r0, [r4, #0x20]
    cmp r0, #0x4
    movge r0, #0x0
    strge r0, [r4, #0x20]
    ldmia sp!, {r4, pc}
.size func_ov057_0220e5ac, . - func_ov057_0220e5ac
