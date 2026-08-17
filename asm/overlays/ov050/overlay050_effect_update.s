.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_effect_recovery.c.
.extern DisplayController_GetSubScreenVerticalOffset
.extern VecFx32Object_Add
.extern GraphicsSpriteState_SetAnimationIndex
.extern gGameWork

.global Overlay050PairedEffect_Update
Overlay050PairedEffect_Update:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    mov r4, r1
    add r0, r5, #0x8
    add r1, r5, #0x18
    bl VecFx32Object_Add
    ldr r0, .L_0220d7a8
    ldr r1, [r5, #0x20]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x200
    ldrsh r0, [r0, #0x10]
    add r0, r0, r0, lsr #0x1f
    add r0, r1, r0, asr #0x1
    str r0, [r5, #0x20]
    ldr r1, [r5, #0x28]
    ldr r0, [r5, #0x10]
    cmp r0, r1
    movgt r0, #0x1
    ldmgtia sp!, {r4, r5, r6, pc}
    sub r0, r1, r0
    mov r1, r0, asr #0xc
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    cmp r0, #0x4
    movgt r0, #0x4
    rsb r1, r0, #0x4
    ldr r0, [r5, #0x0]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r3, [r5, #0xc]
    ldr r2, [r4, #0x4]
    ldr r1, [r5, #0x10]
    ldr r0, [r4, #0x8]
    rsb r6, r2, r3, asr #0xc
    rsb r4, r0, r1, asr #0xc
    bl DisplayController_GetSubScreenVerticalOffset
    mov r1, r6, lsl #0x10
    sub r3, r4, r0
    ldr r0, [r5, #0x0]
    mov r2, r1, asr #0x10
    strh r2, [r0, #0x2c]
    strh r3, [r0, #0x2e]
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    strh r2, [r1, #0x2c]
    strh r4, [r1, #0x2e]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220d7a8: .word gGameWork
.size Overlay050PairedEffect_Update, . - Overlay050PairedEffect_Update
