; Matching retail form; see src/game/type7_actor_target_acquisition.c.
.text
.extern data_020e16e8
.extern data_020e18e0
.extern data_020e18e8
.extern data_020e18f0
.extern data_021052fc
.extern data_02105690
.extern data_021056b8
.extern Actor_GetCachedTerrainHeight
.extern func_02039d0c
.extern func_02046d8c
.extern func_020481dc
.extern func_020adcac
.extern func_020be334
.global func_0204876c
.type func_0204876c, @function

func_0204876c: ; 0x0204876c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r0, [r10, #0x280]
    mov r9, r1
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    add r0, r10, #0x200
    ldrh r1, [r0, #0xa0]
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldrh r1, [r0, #0x56]
    cmp r1, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldrh r0, [r0, #0x5a]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, [r10, #0x268]
    tst r0, #0x4
    beq .L_020487e8
    tst r0, #0x100
    bne .L_020487e0
    ldrsh r0, [r10, #0xd6]
    cmp r0, #0x1
    cmpne r0, #0x2
    beq .L_020487e8
.L_020487e0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_020487e8:
    ldr r0, [r10, #0x29c]
    ldrb r0, [r0, #0x54]
    cmp r0, #0x2
    beq .L_02048880
    ldr r0, .L_02048a30
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_02048830
    mov r0, r4
    bl func_02039d0c
    cmp r0, #0x0
    beq .L_02048880
.L_02048830:
    mov r0, r10
    str r4, [r10, #0x210]
    bl func_02046d8c
    cmp r0, #0x0
    bne .L_02048878
    cmp r9, #0x0
    beq .L_02048864
    ldr r1, .L_02048a34
    mov r0, r10
    mov r3, #0x14
    ldmia r1, {r1, r2}
    bl func_020481dc
    b .L_02048878
.L_02048864:
    ldr r1, .L_02048a38
    mov r0, r10
    mvn r3, #0x0
    ldmia r1, {r1, r2}
    bl func_020481dc
.L_02048878:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02048880:
    ldr r0, [r10, #0x268]
    tst r0, #0x4000
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r5, #0x0
    mov r7, r5
    sub r6, r5, #0x1
    add r4, r10, #0x18
    mvn r11, #0x0
    b .L_02048998
.L_020488a8:
    ldr r0, [r8, #0x260]
    tst r0, #0x2
    beq .L_020488d0
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_020488d4
.L_020488d0:
    mov r0, #0x0
.L_020488d4:
    cmp r0, #0x0
    beq .L_02048994
    ldr r0, [r8, #0x260]
    tst r0, #0x10000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_02048994
    mov r0, r8
    bl Actor_GetCachedTerrainHeight
    str r0, [sp, #0x0]
    mov r0, r10
    bl Actor_GetCachedTerrainHeight
    ldr r1, [sp, #0x0]
    cmp r1, r0
    bne .L_02048994
    mov r0, r10
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r8, #0x24]
    sub r0, r1, r0
    bl func_020be334
    cmp r0, #0x20000
    bgt .L_02048994
    adds r1, r8, #0x18
    addne r1, r1, #0x4
    mov r0, r4
    cmp r4, #0x0
    addne r0, r4, #0x4
    bl func_020adcac
    mov r8, r0
    mov r0, r10
    bl func_02046d8c
    cmp r0, #0x0
    movne r1, #0x30000
    ldr r0, [r10, #0x260]
    moveq r1, #0x0
    add r0, r0, r1
    cmp r8, r0
    bge .L_02048994
    cmp r6, r11
    beq .L_02048988
    ldr r0, .L_02048a3c
    ldr r0, [r0, r7, lsl #0x2]
    cmp r5, r0
    ble .L_02048994
.L_02048988:
    ldr r0, .L_02048a3c
    mov r6, r7
    ldr r5, [r0, r7, lsl #0x2]
.L_02048994:
    add r7, r7, #0x1
.L_02048998:
    cmp r7, #0xa
    bge .L_020489b0
    ldr r0, .L_02048a40
    ldr r8, [r0, r7, lsl #0x2]
    cmp r8, #0x0
    bne .L_020488a8
.L_020489b0:
    mvn r0, #0x0
    cmp r6, r0
    beq .L_02048a28
    ldr r1, .L_02048a40
    mov r0, r10
    ldr r1, [r1, r6, lsl #0x2]
    str r1, [r10, #0x210]
    bl func_02046d8c
    cmp r0, #0x0
    bne .L_02048a20
    cmp r9, #0x0
    beq .L_020489f8
    ldr r1, .L_02048a44
    mov r0, r10
    mov r3, #0x14
    ldmia r1, {r1, r2}
    bl func_020481dc
    b .L_02048a0c
.L_020489f8:
    ldr r1, .L_02048a48
    mov r0, r10
    mvn r3, #0x0
    ldmia r1, {r1, r2}
    bl func_020481dc
.L_02048a0c:
    add r0, r10, #0x200
    mov r1, #0x3c
    strh r1, [r0, #0x56]
    mov r1, #0x0
    strh r1, [r0, #0x5a]
.L_02048a20:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02048a28:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02048a30: .word data_021052fc
.L_02048a34: .word data_020e16e8
.L_02048a38: .word data_020e18f0
.L_02048a3c: .word data_021056b8
.L_02048a40: .word data_02105690
.L_02048a44: .word data_020e18e8
.L_02048a48: .word data_020e18e0

.size func_0204876c, . - func_0204876c

