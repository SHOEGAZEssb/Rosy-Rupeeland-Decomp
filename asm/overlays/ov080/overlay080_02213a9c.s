.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern func_0203f5c4
.extern func_020befec

.global func_ov080_02213a9c
func_ov080_02213a9c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203f5c4
    ldr r0, [r4, #0x9c]
    mov r1, #0x6
    bl func_020befec
    ldr r2, [r4, #0x3c]
    ldr r3, [r4, #0x8c]
    mov r1, r2, asr #0x3
    add r1, r2, r1, lsr #0x1c
    add r0, r0, r1, asr #0x4
    add r0, r3, r0
    str r0, [r4, #0x8c]
    ldr r0, [r4, #0xa0]
    mov r1, #0x6
    bl func_020befec
    ldr r2, [r4, #0x40]
    ldr r3, [r4, #0x90]
    mov r1, r2, asr #0x3
    add r1, r2, r1, lsr #0x1c
    add r0, r0, r1, asr #0x4
    add r0, r3, r0
    str r0, [r4, #0x90]
    ldr r1, [r4, #0x3c]
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    str r0, [r4, #0x3c]
    ldr r1, [r4, #0x40]
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    str r0, [r4, #0x40]
    ldmia sp!, {r4, pc}
.size func_ov080_02213a9c, . - func_ov080_02213a9c
