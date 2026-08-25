    .text

/* Exact fallback; see src/overlays/ov016/overlay016_final_handlers.c. */
    .extern data_021e9ac0
    .extern data_ov016_022013f0
    .extern data_ov016_02201428
    .extern ActorDescriptorState_FindInactiveQuantity
    .extern func_0206fb18
    .extern func_02096450
    .extern Overlay000_Grid_Render
    .extern Overlay016ActorValue_Init
    .extern Overlay016_UpdateScene
    .extern Overlay016_CreatePanelMessage
    .extern Overlay016_DestroyPanelMessage
.global Overlay016_UpdateQuantityPromptState
Overlay016_UpdateQuantityPromptState:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_022011e4
    cmp r0, #0x1
    beq L_0220125c
    b L_022012e4
L_022011e4:
    ldr r0, [r4, #0x468]
    bl func_0206fb18
    str r0, [r4, #0x484]
    ldr r1, [r4, #0x468]
    ldr r0, L_022012f8
    ldr r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    ldrh r1, [r1, #0x4]
    add r0, r0, #0x1c
    bl ActorDescriptorState_FindInactiveQuantity
    ldr r1, [r4, #0x484]
    add r1, r0, r1
    cmp r1, #0x63
    rsbge r0, r0, #0x63
    strge r0, [r4, #0x484]
    ldr r2, [r4, #0x484]
    mov r0, r4
    cmp r2, #0x1
    ble L_0220123c
    mov r1, #0x1d
    bl Overlay016_CreatePanelMessage
    b L_02201244
L_0220123c:
    mov r1, #0x1f
    bl Overlay016_CreatePanelMessage
L_02201244:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022012e4
L_0220125c:
    ldr r0, [r4, #0x20]
    add r1, r4, #0x30
    mov r0, r0, lsl #0x1a
    mov r0, r0, asr #0x1f
    str r0, [sp, #0x0]
    ldr r2, [r4, #0x20]
    ldr r0, [r4, #0x464]
    mov r3, r2, lsl #0x1b
    ldr r2, [r4, #0x2c]
    mov r3, r3, asr #0x1f
    bl func_02096450
    cmp r0, #0x0
    beq L_022012e4
    ldr r1, [r4, #0x464]
    ldr r0, [r1, #0x1b8]
    cmp r0, #0x0
    beq L_022012c4
    ldr r1, [r1, #0xc]
    mov r0, #0x1
    str r1, [r4, #0x484]
    ldr r1, L_022012fc
    str r0, [r4, #0x478]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    b L_022012e4
L_022012c4:
    mov r0, r4
    bl Overlay016_DestroyPanelMessage
    ldr r0, [r4, #0x44c]
    bl Overlay000_Grid_Render
    ldr r1, L_02201300
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
L_022012e4:
    mov r0, r4
    bl Overlay016_UpdateScene
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_022012f8: .word data_021e9ac0
L_022012fc: .word data_ov016_022013f0
L_02201300: .word data_ov016_02201428
    .size Overlay016_UpdateQuantityPromptState, . - Overlay016_UpdateQuantityPromptState

