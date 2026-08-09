.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_021052fc
.extern func_02031564

.global func_ov095_0221b304
func_ov095_0221b304:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    bl func_02031564
    ldr r0, .L_0221b388
    ldr r1, [r4, #0x1c]
    ldr r0, [r0, #0x0]
    ldr r2, [r4, #0x20]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    mov r1, r1, asr #0x10
    ldr r3, [r0, #0x0]
    mov r2, r2, asr #0x10
    ldr r3, [r3, #0x2c]
    blx r3
    mov r2, r0, lsl #0x12
    add r1, r4, #0x200
    mov r2, r2, lsr #0x1c
    cmp r2, #0x1
    moveq r2, #0x1
    ldrh r1, [r1, #0x98]
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    movne r2, #0x0
    add r0, r4, #0x200
    strh r2, [r0, #0x98]
    ldrh r0, [r0, #0x98]
    cmp r1, r0
    ldrne r0, [r4, #0xd0]
    orrne r0, r0, #0x1000
    strne r0, [r4, #0xd0]
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_0221b388: .word data_021052fc
.size func_ov095_0221b304, . - func_ov095_0221b304
