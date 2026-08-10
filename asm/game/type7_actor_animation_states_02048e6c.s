; Matching retail form; see src/game/type7_actor_animation_states.c.
.text
.extern func_0200b2c0
.extern Actor_GetCachedTerrainHeight
.extern func_02047dd8
.extern func_0204a5b8
.extern func_0204b7bc
.extern func_020be328
.global func_02048e6c
.global func_02048e98
.global func_02048f98
.global func_02048fb4
.type func_02048e6c, @function
.type func_02048e98, @function
.type func_02048f98, @function
.type func_02048fb4, @function

func_02048e6c: ; 0x02048e6c
    ldr r1, [r0, #0x268]
    bic r1, r1, #0x8000
    str r1, [r0, #0x268]
    ldr r2, [r0, #0x1dc]
    ldr r1, [r0, #0x24]
    cmp r2, r1
    movlt r1, #0xb
    movge r1, #0x3
    strh r1, [r0, #0xd6]
    mov r0, #0x0
    bx lr

func_02048e98: ; 0x02048e98
    stmdb sp!, {r3, r4, r5, lr}
    mov r1, #0x0
    mov r4, r0
    str r1, [r4, #0x40]
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    str r1, [r4, #0x3c]
    bl func_0200b2c0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_0200b2c0
    ldr r0, [r4, #0x280]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x268]
    tst r0, #0x40
    bne .L_02048f60
    tst r0, #0x20
    beq .L_02048f20
    mov r0, r4
    bl func_0204a5b8
    cmp r0, #0x0
    beq .L_02048f20
    ldr r1, [r4, #0x268]
    mov r0, r4
    bic r1, r1, #0x20
    str r1, [r4, #0x268]
    bl func_02047dd8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02048f20:
    ldr r0, [r4, #0x268]
    tst r0, #0x80
    beq .L_02048f60
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    mov r5, r0
    ldr r0, [r4, #0x280]
    bl Actor_GetCachedTerrainHeight
    sub r0, r5, r0
    bl func_020be328
    cmp r0, #0x20000
    bge .L_02048f60
    mov r0, r4
    bl func_02047dd8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02048f60:
    ldr r1, [r4, #0x1dc]
    ldr r0, [r4, #0x24]
    cmp r1, r0
    movlt r0, #0xb
    strlth r0, [r4, #0xd6]
    blt .L_02048f90
    ldr r0, [r4, #0x268]
    tst r0, #0x20
    movne r0, #0x5
    strneh r0, [r4, #0xd6]
    moveq r0, #0x4
    streqh r0, [r4, #0xd6]
.L_02048f90:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}

func_02048f98: ; 0x02048f98
    ldr r1, [r0, #0x268]
    tst r1, #0x4
    movne r1, #0x7
    moveq r1, #0x6
    strh r1, [r0, #0xd6]
    mov r0, #0x0
    bx lr

func_02048fb4: ; 0x02048fb4
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r1, r4, #0x200
    ldrsh r1, [r1, #0x48]
    cmp r1, #0xa
    bne .L_02048fd4
    mov r1, #0x0
    bl func_0204b7bc
.L_02048fd4:
    mov r0, #0x6
    strh r0, [r4, #0xd6]
    mov r0, #0x0
    ldmia sp!, {r4, pc}

.size func_02048e6c, func_02048e98 - func_02048e6c
.size func_02048e98, func_02048f98 - func_02048e98
.size func_02048f98, func_02048fb4 - func_02048f98
.size func_02048fb4, . - func_02048fb4

