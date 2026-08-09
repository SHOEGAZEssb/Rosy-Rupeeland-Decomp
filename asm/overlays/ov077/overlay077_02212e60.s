.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern func_02031cac
.extern func_0203efac
.extern func_ov077_02212f18
.extern func_ov090_0221c318

.global func_ov077_02212e60
func_ov077_02212e60:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r4, r2
    mov r6, r0
    mov r5, r1
    bl func_0203efac
    ldr r0, [r4, #0x4]
    ldr r1, [r5, #0x1c]
    mov r0, r0, asr #0xc
    ldr r2, [r5, #0x2a8]
    rsb r0, r0, r1, asr #0xc
    add r1, r0, r2, asr #0xc
    ldr r3, [r5, #0x2b8]
    ldr r0, [r5, #0x54]
    add r1, r1, r3, asr #0xc
    strh r1, [r0, #0x2c]
    ldr r0, [r5, #0x24]
    ldr r2, [r5, #0x20]
    mov r1, r0, asr #0xc
    rsb r1, r1, r2, asr #0xc
    ldr r0, [r4, #0x8]
    ldr r2, [r5, #0x2ac]
    sub r0, r1, r0, asr #0xc
    add r1, r0, r2, asr #0xc
    ldr r3, [r5, #0x2bc]
    ldr r0, [r5, #0x54]
    add r1, r1, r3, asr #0xc
    strh r1, [r0, #0x2e]
    ldr r1, [r5, #0x54]
    add r0, sp, #0x0
    ldrsh r2, [r1, #0x2c]
    mov r1, r6
    str r2, [r6, #0x4]
    ldr r2, [r5, #0x54]
    ldrsh r2, [r2, #0x2e]
    str r2, [r6, #0x8]
    bl func_ov077_02212f18
    add r1, sp, #0x0
    mov r0, r5
    bl func_02031cac
    ldr r0, [r5, #0x298]
    mov r1, r4
    bl func_ov090_0221c318
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
.size func_ov077_02212e60, . - func_ov077_02212e60
