; Matching retail form; see src/game/actor_terrain_step_eligibility.c.
.text
.extern data_021052fc
.extern Actor_QueryTerrainHeight
.extern Actor_QueryTerrainCell

    .global func_0203463c
    .type func_0203463c, @function
func_0203463c: ; 0x0203463c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r4, .L_02034714
    mov r6, r1
    ldr r4, [r4, #0x0]
    mov r5, r2
    add ip, r4, #0x2000
    mov r4, r3
    cmp r6, #0x1
    mov r7, r0
    ldr r3, [ip, #0xed4]
    cmpge r5, #0x1
    blt .L_020346a0
    ldr r3, [r3, #0x20]
    mov ip, r3, lsl #0x10
    mov ip, ip, lsr #0xc
    mov ip, ip, asr #0x4
    sub ip, ip, #0x1
    cmp ip, r6
    movge r3, r3, lsr #0x10
    movge r3, r3, lsl #0x4
    movge r3, r3, asr #0x4
    subge r3, r3, #0x1
    cmpge r3, r5
    bge .L_020346a8
.L_020346a0:
    mov r0, #0x0
    b .L_0203470c
.L_020346a8:
    bl Actor_QueryTerrainHeight
    cmp r0, r4
    subne r1, r4, #0x1
    cmpne r0, r1
    movne r0, #0x0
    bne .L_0203470c
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl Actor_QueryTerrainCell
    mov r1, r0, lsl #0x16
    mov r1, r1, lsr #0x1b
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    cmp r1, #0x7
    moveq r0, #0x0
    beq .L_0203470c
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    moveq r0, #0x0
    beq .L_0203470c
    cmp r1, #0xe
    movne r0, #0x1
    moveq r0, #0x0
.L_0203470c:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02034714: .word data_021052fc
    .size func_0203463c, . - func_0203463c

    .global func_02034718
