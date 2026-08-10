; Matching retail form; see src/game/type7_actor_helpers.c.
.text
.extern data_020e16b0
.extern data_020e16d0
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern func_0200b2c0
.extern func_02031758
.extern Actor_RefreshTerrainHeight
.extern Actor_ApplyMotionImpulse
.extern ActorVector_DivideByScalar
.extern func_0206dcac
.global func_020464f4
.type func_020464f4, @function
.global func_02046544
.type func_02046544, @function
.global func_020465b8
.type func_020465b8, @function
func_020464f4: ; 0x020464f4
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x18
    add r1, r4, #0x214
    bl func_020050a4
    mov r0, r4
    bl Actor_RefreshTerrainHeight
    mov r1, #0x0
    ldr r0, [r4, #0x1dc]
    mov r2, r1
    mov r3, r1
    str r0, [r4, #0x24]
    add r0, r4, #0x38
    bl func_0200b2c0
    add r0, r4, #0x88
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    ldmia sp!, {r4, pc}

.size func_020464f4, . - func_020464f4
func_02046544: ; 0x02046544
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r1
    mov r4, r2
    bl func_02031758
    add r0, sp, #0x0
    add r1, r5, #0x18
    bl func_02005030
    ldrsh r2, [r5, #0x6a]
    ldr r3, [sp, #0x8]
    ldr r1, .L_020465b4
    add r0, r5, #0x2a8
    smlabb r1, r2, r1, r3
    str r1, [sp, #0x8]
    ldr ip, [r0, #0x0]
    add r2, sp, #0x0
    ldr ip, [ip, #0xc]
    mov r1, r4
    mov r3, #0x0
    blx ip
    ldr r0, [r5, #0x234]
    cmp r0, #0x0
    beq .L_020465a4
    bl func_0206dcac
.L_020465a4:
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_020465b4: .word 0xb33

.size func_02046544, . - func_02046544
func_020465b8: ; 0x020465b8
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    cmp r2, #0x0
    beq .L_020465dc
    ldr r0, [r4, #0x29c]
    ldrh r0, [r0, #0x40]
    cmp r0, #0x0
    beq .L_02046650
.L_020465dc:
    ldr r0, .L_02046658
    ldr ip, [r4, #0x208]
    ldr r0, [r0, #0x20]
    mov lr, #0x1
    cmp ip, r0
    ldr r0, .L_0204665c
    bne .L_0204660c
    ldr r3, [r4, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r3, r0
    cmpne ip, #0x0
    moveq lr, #0x0
.L_0204660c:
    cmp lr, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0204662c
    mov r0, r4
    bl Actor_ApplyMotionImpulse
    b .L_02046650
.L_0204662c:
    add r0, sp, #0x0
    mov r2, #0x2000
    bl ActorVector_DivideByScalar
    add r1, sp, #0x0
    mov r0, r4
    mov r2, #0x0
    bl Actor_ApplyMotionImpulse
    add r0, sp, #0x0
    bl func_02005058
.L_02046650:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_02046658: .word data_020e16b0
.L_0204665c: .word data_020e16d0
.size func_020465b8, . - func_020465b8
