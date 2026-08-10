; Matching retail form; see src/game/actor_terrain_transition_classify.c.
.text
.extern data_021052fc
.extern Actor_QueryTerrainHeight
.extern Actor_QueryTerrainCell

    .global func_02034718
    .type func_02034718, @function
func_02034718: ; 0x02034718
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r4, .L_020347fc
    mov r7, r1
    ldr r4, [r4, #0x0]
    mov r6, r2
    add r4, r4, #0x2000
    mov r5, r3
    cmp r7, #0x1
    mov r8, r0
    ldr r3, [r4, #0xed4]
    cmpge r6, #0x1
    blt .L_0203477c
    ldr r3, [r3, #0x20]
    mov r4, r3, lsl #0x10
    mov r4, r4, lsr #0xc
    mov r4, r4, asr #0x4
    sub r4, r4, #0x1
    cmp r4, r7
    movge r3, r3, lsr #0x10
    movge r3, r3, lsl #0x4
    movge r3, r3, asr #0x4
    subge r3, r3, #0x1
    cmpge r3, r6
    bge .L_02034784
.L_0203477c:
    mov r0, #0x2
    b .L_020347f4
.L_02034784:
    bl Actor_QueryTerrainCell
    mov r1, r0, lsl #0x16
    mov r4, r1, lsr #0x1b
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    cmp r4, #0x7
    moveq r0, #0x2
    beq .L_020347f4
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl Actor_QueryTerrainHeight
    cmp r5, r0
    movlt r0, #0x2
    blt .L_020347f4
    sub r1, r5, #0x1
    cmp r0, r1
    movle r0, #0x1
    ble .L_020347f4
    ldr r0, [sp, #0x4]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    moveq r0, #0x1
    beq .L_020347f4
    cmp r4, #0xe
    moveq r0, #0x1
    movne r0, #0x0
.L_020347f4:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_020347fc: .word data_021052fc
    .size func_02034718, . - func_02034718

    .global func_02034800
