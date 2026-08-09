.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_ov059_02210600
.extern func_ov059_02210620

.global func_ov059_0221067c
func_ov059_0221067c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrsh r5, [r4, #0x18]
    ldrsh r3, [r4, #0x14]
    mov r0, r1, lsl #0x10
    mov r1, r0, asr #0x10
    sub r0, r5, r3
    mov r0, r0, lsl #0x10
    strh r1, [r4, #0x14]
    add r0, r1, r0, asr #0x10
    strh r0, [r4, #0x18]
    ldrsh r5, [r4, #0x1a]
    ldrsh r3, [r4, #0x16]
    mov r0, r2, lsl #0x10
    mov r1, r0, asr #0x10
    sub r0, r5, r3
    mov r0, r0, lsl #0x10
    strh r1, [r4, #0x16]
    add r1, r1, r0, asr #0x10
    add r0, r4, #0x14
    strh r1, [r4, #0x1a]
    bl func_ov059_02210620
    mov r5, r0
    add r0, r4, #0x14
    bl func_ov059_02210600
    ldr r1, [r4, #0x1c]
    strh r0, [r1, #0x2c]
    strh r5, [r1, #0x2e]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov059_0221067c, . - func_ov059_0221067c
