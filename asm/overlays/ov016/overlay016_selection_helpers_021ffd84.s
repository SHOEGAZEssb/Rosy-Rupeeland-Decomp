    .text

/* Exact fallback; see src/overlays/ov016/overlay016_selection_helpers.c. */
    .extern SpriteMotionController_Show
    .extern SpriteMotionController_Hide
    .extern SpriteMotionController_SetAnimation
    .extern func_ov000_021fb890
    .extern func_ov016_021fd9dc
    .extern func_ov016_021fdaa0
    .extern func_ov016_021ffc2c
.global func_ov016_021ffd84
func_ov016_021ffd84:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x47c]
    cmp r0, #0x0
    beq L_021ffddc
    mov r1, #0x0
    add r0, r4, #0x240
    str r1, [r4, #0x47c]
    bl SpriteMotionController_SetAnimation
    add r0, r4, #0x2ec
    bl SpriteMotionController_Hide
    add r0, r4, #0x398
    bl SpriteMotionController_Hide
    ldr r0, [r4, #0x448]
    mov r1, #0x1
    bl func_ov016_021fd9dc
    ldr r1, [r4, #0x4c]
    mov r0, r4
    bic r1, r1, #0x4
    str r1, [r4, #0x4c]
    bl func_ov016_021ffc2c
    ldmia sp!, {r4, pc}
L_021ffddc:
    mov r2, #0x1
    add r0, r4, #0x240
    mov r1, #0x3
    str r2, [r4, #0x47c]
    bl SpriteMotionController_SetAnimation
    add r0, r4, #0x2ec
    bl SpriteMotionController_Show
    add r0, r4, #0x398
    bl SpriteMotionController_Show
    ldr r0, [r4, #0x450]
    mov r1, #0x1
    bl func_ov000_021fb890
    ldr r0, [r4, #0x4c]
    mov r1, #0x14
    bic r0, r0, #0x2
    orr r0, r0, #0x4
    str r0, [r4, #0x4c]
    ldr r3, [r4, #0x444]
    ldr r2, [r4, #0x480]
    ldr r3, [r3, #0x4c]
    ldr r0, [r4, #0x448]
    mla r1, r2, r1, r3
    bl func_ov016_021fdaa0
    ldmia sp!, {r4, pc}
    .size func_ov016_021ffd84, . - func_ov016_021ffd84

