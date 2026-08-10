; Matching retail form; see src/game/game_phase_area_scene_controls.c.
.text
.extern func_0202844c
.extern ActorCollection_SetEnabled
.extern func_ov056_0220ee20

    .global GamePhaseAreaScene_SetEnabled
GamePhaseAreaScene_SetEnabled: ; 0x020122a0
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0x2000
    ldr r0, [r0, #0xeac]
    mov r4, r1
    ldr r1, [r0, #0x40]
    mov r1, r1, lsl #0xc
    movs r1, r1, lsr #0x1e
    cmpne r1, #0x3
    bne L_0201233c
    mov r1, r4
    add r0, r5, #0x8
    bl ActorCollection_SetEnabled
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq L_020122f0
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x24]
    blx r2
L_020122f0:
    add r0, r5, #0x2000
    ldr r0, [r0, #0xed0]
    cmp r0, #0x0
    beq L_02012308
    mov r1, r4
    bl func_ov056_0220ee20
L_02012308:
    add r0, r5, #0x2000
    ldr r0, [r0, #0xebc]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    add r0, r5, #0x2000
    ldr r2, [r0, #0xea8]
    mov r1, r4, lsl #0x1f
    bic r2, r2, #0x20
    orr r1, r2, r1, lsr #0x1a
    str r1, [r0, #0xea8]
    ldmia sp!, {r3, r4, r5, pc}
L_0201233c:
    cmp r4, #0x0
    beq L_020123cc
    ldr r1, [r0, #0x40]
    mov r1, r1, lsl #0xe
    movs r1, r1, asr #0x1f
    beq L_020123cc
    bl func_0202844c
    cmp r0, #0x0
    beq L_020123cc
    add r0, r5, #0x8
    mov r1, #0x1
    bl ActorCollection_SetEnabled
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq L_02012388
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x24]
    blx r2
L_02012388:
    add r0, r5, #0x2000
    ldr r0, [r0, #0xed0]
    cmp r0, #0x0
    beq L_020123a0
    mov r1, #0x1
    bl func_ov056_0220ee20
L_020123a0:
    add r0, r5, #0x2000
    ldr r0, [r0, #0xebc]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    add r0, r5, #0x2000
    ldr r1, [r0, #0xea8]
    orr r1, r1, #0x20
    str r1, [r0, #0xea8]
    ldmia sp!, {r3, r4, r5, pc}
L_020123cc:
    add r0, r5, #0x8
    mov r1, #0x0
    bl ActorCollection_SetEnabled
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq L_020123f4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x24]
    blx r2
L_020123f4:
    add r0, r5, #0x2000
    ldr r0, [r0, #0xed0]
    cmp r0, #0x0
    beq L_0201240c
    mov r1, #0x0
    bl func_ov056_0220ee20
L_0201240c:
    add r0, r5, #0x2000
    ldr r0, [r0, #0xebc]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    add r0, r5, #0x2000
    ldr r1, [r0, #0xea8]
    bic r1, r1, #0x20
    str r1, [r0, #0xea8]
    ldmia sp!, {r3, r4, r5, pc}
    .size GamePhaseAreaScene_SetEnabled, . - GamePhaseAreaScene_SetEnabled

