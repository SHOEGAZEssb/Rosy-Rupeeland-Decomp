    .text
/* Exact fallback; see src/overlays/ov018/overlay018_scene_callbacks.c. */
    .extern data_021052fc
    .extern GamePhaseState_UpdateRenderHelpers
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern func_020b198c
    .extern func_020b4554
    .extern func_ov018_021fd788
.global func_ov018_021ff1b8
func_ov018_021ff1b8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021ff1e0
    cmp r0, #0x1
    beq L_021ff210
    cmp r0, #0x2
    beq L_021ff240
    b L_021ff248
L_021ff1e0:
    ldr r2, [r4, #0xd0]
    mov r1, #0x23
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0xd0]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021ff210:
    ldr r0, [r4, #0xd0]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq L_021ff248
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff248
L_021ff240:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021ff248:
    mov r0, r4
    bl func_ov018_021fd788
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_ov018_021ff1b8, . - func_ov018_021ff1b8

    .global func_ov018_021ff258
func_ov018_021ff258:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x15
    movs r0, r0, asr #0x1f
    beq L_021ff2bc
    ldr r0, L_021ff2c4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_UpdateRenderHelpers
    ldr r3, L_021ff2c8
    ldr r0, [r4, #0x4c]
    ldr r2, [r3, #0x0]
    mov r1, #0x6000
    bic r2, r2, #0x1f00
    orr r0, r2, r0, lsl #0x8
    str r0, [r3, #0x0]
    ldr r0, [r4, #0x190]
    ldr r0, [r0, #0x0]
    bl func_020b4554
    ldr r0, [r4, #0x190]
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x6000
    bl func_020b198c
L_021ff2bc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021ff2c4: .word data_021052fc
L_021ff2c8: .word 0x4001000
    .size func_ov018_021ff258, . - func_ov018_021ff258
