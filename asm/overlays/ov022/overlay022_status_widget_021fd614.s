    .text
/* Exact fallback; see src/overlays/ov022/overlay022_status_widget.c. */
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern func_0209189c
    .extern TitleRandom_NextBounded
    .extern Overlay022_StatusWidget_SetMode1

.global Overlay022_StatusWidget_UpdateIdleAnimation
Overlay022_StatusWidget_UpdateIdleAnimation:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x28]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r4, pc}
L_021fd62c: ; jump table
    ldmia sp!, {r4, pc} ; case 0
    b L_021fd644 ; case 1
    ldmia sp!, {r4, pc} ; case 2
    ldmia sp!, {r4, pc} ; case 3
    ldmia sp!, {r4, pc} ; case 4
    b L_021fd664 ; case 5
L_021fd644:
    add r0, r4, #0x30
    mov r1, #0x1e
    mov r2, #0xf0
    bl func_0209189c
    str r0, [r4, #0x2c]
    mov r0, #0x5
    str r0, [r4, #0x28]
    ldmia sp!, {r4, pc}
L_021fd664:
    ldr r1, [r4, #0x2c]
    cmp r1, #0x0
    beq L_021fd6bc
    subs r0, r1, #0x1
    str r0, [r4, #0x2c]
    ldmneia sp!, {r4, pc}
    add r0, r4, #0x30
    mov r1, #0x3
    bl TitleRandom_NextBounded
    cmp r0, #0x0
    ldr r0, [r4, #0x20]
    beq L_021fd6a0
    mov r1, #0x4
    bl GraphicsSpriteState_SetAnimationIndex
    b L_021fd6a8
L_021fd6a0:
    mov r1, #0x5
    bl GraphicsSpriteState_SetAnimationIndex
L_021fd6a8:
    ldr r1, [r4, #0x20]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
L_021fd6bc:
    ldr r1, [r4, #0x20]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    ldmeqia sp!, {r4, pc}
    bl Overlay022_StatusWidget_SetMode1
    ldmia sp!, {r4, pc}
.size Overlay022_StatusWidget_UpdateIdleAnimation, . - Overlay022_StatusWidget_UpdateIdleAnimation
