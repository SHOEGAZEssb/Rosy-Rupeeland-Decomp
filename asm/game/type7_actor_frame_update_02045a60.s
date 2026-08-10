; Matching retail form; see src/game/type7_actor_frame_update.c.
.text
.extern GameWork_ClearFlag
.extern Heap_Free
.extern data_020e16b0
.extern data_020e1728
.extern data_020e1748
.extern data_020e1838
.extern data_021052fc
.extern func_02005058
.extern func_020050a4
.extern func_02025d14
.extern func_02026588
.extern func_02032228
.extern func_02032370
.extern Actor_UpdateAnimationState
.extern Actor_GetCachedTerrainHeight
.extern ActorDerivedRuntime_UpdateFrame
.extern Actor_UpdateGroundContactProbe
.extern Type7Actor_ResetMotionAndCooldown
.extern func_02048148
.extern func_02048b94
.extern func_0204b1e0
.extern func_0204b7bc
.extern func_0206c978
.extern func_0206cd10
.extern func_020adcac
.extern func_020be328
.extern gGameWork
.global Type7Actor_UpdateFrame
.type Type7Actor_UpdateFrame, @function
Type7Actor_UpdateFrame: ; 0x02045a60
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r0, [r4, #0x268]
    tst r0, #0x400
    bne .L_020461dc
    tst r0, #0x40000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_020461dc
    ldr r0, [r4, #0x10]
    tst r0, #0x1000000
    beq .L_02045b20
    mov r0, r4
    bl ActorDerivedRuntime_UpdateFrame
    ldr r2, [r4, #0x280]
    cmp r2, #0x0
    beq .L_020461dc
    ldr r1, [r4, #0x180]
    ldr r0, [r4, #0x294]
    cmp r1, r0
    bne .L_020461dc
    adds r1, r2, #0x18
    addne r1, r1, #0x4
    adds r0, r4, #0x18
    ldr r5, [r4, #0x25c]
    mov r6, #0x0
    addne r0, r0, #0x4
    bl func_020adcac
    cmp r0, r5, lsl #0x1
    movgt r6, #0x1
    bgt .L_02045afc
    ldr r0, [r4, #0x280]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    movne r6, #0x1
.L_02045afc:
    cmp r6, #0x0
    beq .L_020461dc
    ldr r1, [r4, #0x10]
    mov r0, r4
    bic r1, r1, #0x1000000
    str r1, [r4, #0x10]
    mov r1, #0x0
    str r1, [r4, #0x180]
    bl Type7Actor_ResetMotionAndCooldown
.L_02045b20:
    ldr r0, [r4, #0xd0]
    tst r0, #0x4000
    beq .L_02045b88
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x46]
    cmp r0, #0x14
    bge .L_02045b48
    mov r0, r4
    mov r1, #0x1
    bl func_0204b7bc
.L_02045b48:
    ldr r0, [r4, #0x268]
    tst r0, #0x100000
    beq .L_02045b70
    add r0, r4, #0x200
    mov r1, #0xb4
    strh r1, [r0, #0x46]
    ldr r0, [r4, #0x268]
    bic r0, r0, #0x100000
    str r0, [r4, #0x268]
    b .L_02045b88
.L_02045b70:
    ldr r1, [r4, #0x29c]
    add r0, r4, #0x200
    ldrh r2, [r1, #0x40]
    ldrsh r1, [r0, #0x46]
    cmp r1, r2
    strlth r2, [r0, #0x46]
.L_02045b88:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x18]
    blx r1
    ldr r2, [r4, #0x268]
    ldr r0, .L_020461e4
    add r1, r4, #0x200
    and r0, r2, r0
    str r0, [r4, #0x268]
    ldrh r0, [r1, #0x54]
    mov r3, #0x1
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneh r0, [r1, #0x54]
    mov r0, #0x0
    strh r3, [r4, #0xd6]
    strh r0, [r4, #0xda]
    str r0, [r4, #0x40]
    str r0, [r4, #0x3c]
    ldr r1, [r4, #0x14]
    bic r1, r1, #0x100
    str r1, [r4, #0x14]
    ldr r1, [r4, #0x280]
    cmp r1, #0x0
    bne .L_02045d34
    ldr r1, [r4, #0x234]
    cmp r1, #0x0
    bne .L_02045c68
    ldr r1, [r4, #0xd0]
    tst r1, #0x10
    ldreq r2, [r4, #0x24]
    ldreq r1, [r4, #0x1dc]
    cmpeq r2, r1
    movne r3, #0x0
    cmp r3, #0x0
    beq .L_02045c68
    ldr r1, [r4, #0x108]
    cmp r1, #0x0
    bne .L_02045c68
    ldr r1, [r4, #0x298]
    cmp r1, #0x0
    beq .L_02045c68
    ldr r1, .L_020461e8
    ldr r3, [r4, #0x208]
    ldr r1, [r1, #0x78]
    mov r5, #0x1
    cmp r3, r1
    ldr r1, .L_020461ec
    bne .L_02045c60
    ldr r2, [r4, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r5, #0x0
.L_02045c60:
    cmp r5, #0x0
    movne r0, #0x1
.L_02045c68:
    cmp r0, #0x0
    beq .L_02045ca4
    ldr r1, [r4, #0x1fc]
    mov r0, r4
    str r1, [r4, #0x10c]
    ldr r1, [r4, #0x29c]
    ldrh r1, [r1, #0x56]
    str r1, [r4, #0x110]
    ldr r1, [r4, #0x29c]
    ldrh r1, [r1, #0x58]
    str r1, [r4, #0x114]
    ldr r2, [r0, #0x0]
    ldr r1, [r4, #0x298]
    ldr r2, [r2, #0x74]
    blx r2
.L_02045ca4:
    ldr r0, [r4, #0x108]
    cmp r0, #0x0
    ble .L_02045d34
    mov r0, #0x0
    str r0, [r4, #0x108]
    ldr r2, [r4, #0x104]
    ldr r0, .L_020461e8
    add r1, r4, #0x200
    str r2, [r0, #0x2b8]
    ldr r0, [r4, #0x200]
    ldr r2, .L_020461f0
    str r0, [r4, #0x1fc]
    ldr r3, [r4, #0x29c]
    mov r0, r4
    ldrsh r3, [r3, #0x30]
    strh r3, [r1, #0x58]
    ldr r1, [r2, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    bl func_02048b94
    ldr r0, .L_020461f0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xe8]
    bl func_02025d14
    mov r1, #0x0
    bl func_02026588
    ldr r0, .L_020461f0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xe8]
    bl func_02025d14
    mov r1, #0x0
    strb r1, [r0, #0x8d]
    mov r0, r4
    bl func_02048148
.L_02045d34:
    ldr r1, [r4, #0x280]
    cmp r1, #0x0
    beq .L_02045d68
    ldr r3, [r1, #0x0]
    add r0, sp, #0x0
    ldr r3, [r3, #0xb4]
    mov r2, r4
    blx r3
    add r1, sp, #0x0
    add r0, r4, #0x214
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
.L_02045d68:
    ldr r0, [r4, #0x234]
    cmp r0, #0x0
    beq .L_02045db4
    bl func_0206cd10
    cmp r0, #0x2
    bne .L_02045db4
    ldr r5, [r4, #0x234]
    cmp r5, #0x0
    beq .L_02045d9c
    mov r0, r5
    bl func_0206c978
    mov r0, r5
    bl Heap_Free
.L_02045d9c:
    mov r1, #0x0
    ldr r0, .L_020461f4
    str r1, [r4, #0x234]
    ldr r0, [r0, #0x0]
    ldr r1, .L_020461f8
    bl GameWork_ClearFlag
.L_02045db4:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    bne .L_02045f3c
    add r0, r4, #0x200
    ldrsh r2, [r0, #0x4a]
    mvn r1, #0x0
    cmp r2, r1
    beq .L_02045dfc
    ldrsh r1, [r0, #0x48]
    cmp r1, r2
    addlt r1, r1, #0x1
    strlth r1, [r0, #0x48]
    blt .L_02045dfc
    mov r0, r4
    bl func_02048148
.L_02045dfc:
    ldr r0, [r4, #0x20c]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r4, #0x208]
    ldrne r1, [r2, r1]
    ldreq r1, [r4, #0x208]
    blx r1
    ldr r0, [r4, #0x9c]
    cmp r0, #0x0
    ldreq r0, [r4, #0xa0]
    cmpeq r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_02045e60
    ldrsh r0, [r4, #0xd6]
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    movls r0, #0x8
    strlsh r0, [r4, #0xd6]
.L_02045e60:
    ldr r0, .L_020461e8
    ldr r2, [r4, #0x208]
    ldr r0, [r0, #0x98]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_020461fc
    bne .L_02045e90
    ldr r1, [r4, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02045e90:
    cmp r3, #0x0
    bne .L_02045eac
    mov r0, r4
    add r1, r4, #0x284
    mov r2, #0x800
    bl func_02032370
    b .L_02045f0c
.L_02045eac:
    ldr r1, [r4, #0x210]
    cmp r1, #0x0
    beq .L_02045ecc
    mov r0, r4
    add r1, r1, #0x18
    mov r2, #0x800
    bl func_02032370
    b .L_02045f0c
.L_02045ecc:
    ldr r0, [r4, #0x234]
    cmp r0, #0x0
    bne .L_02045ef8
    ldr r0, [r4, #0x268]
    tst r0, #0xc
    beq .L_02045ef8
    mov r0, r4
    add r1, r4, #0x224
    mov r2, #0x800
    bl func_02032370
    b .L_02045f0c
.L_02045ef8:
    ldr r1, [r4, #0x3c]
    ldr r2, [r4, #0x40]
    mov r0, r4
    mov r3, #0x800
    bl func_02032228
.L_02045f0c:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x46]
    cmp r1, #0x0
    ble .L_02045f3c
    mov r1, #0x0
    str r1, [r4, #0x40]
    str r1, [r4, #0x3c]
    ldrsh r2, [r0, #0x46]
    mov r1, #0xf
    sub r2, r2, #0x1
    strh r2, [r0, #0x46]
    strh r1, [r4, #0xd6]
.L_02045f3c:
    ldr r6, [r4, #0x280]
    cmp r6, #0x0
    beq .L_02045f80
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    mov r5, r0
    mov r0, r6
    bl Actor_GetCachedTerrainHeight
    sub r0, r5, r0
    bl func_020be328
    cmp r0, #0x20000
    ldr r0, [r4, #0x268]
    orrge r0, r0, #0x800000
    strge r0, [r4, #0x268]
    biclt r0, r0, #0x800000
    strlt r0, [r4, #0x268]
    b .L_02045f8c
.L_02045f80:
    ldr r0, [r4, #0x268]
    bic r0, r0, #0x800000
    str r0, [r4, #0x268]
.L_02045f8c:
    ldr r0, [r4, #0x268]
    tst r0, #0x80000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_02045fbc
    mov r0, r4
    bl Actor_UpdateGroundContactProbe
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa4]
    blx r1
.L_02045fbc:
    mov r0, r4
    bl Actor_UpdateAnimationState
    mov r0, r4
    bl func_0204b1e0
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x50]
    cmp r1, #0x0
    ble .L_020460d8
    sub r1, r1, #0x1
    strh r1, [r0, #0x50]
    ldr r1, [r4, #0x210]
    cmp r1, #0x0
    beq .L_02046044
    ldrb r0, [r1, #0x4d]
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02046044
    ldrh r0, [r1, #0x4e]
    cmp r0, #0x14
    bne .L_02046044
    add r0, r1, #0x100
    ldrh r0, [r0, #0xf0]
    mov r0, r0, lsl #0x1e
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    movhs r0, #0x1
    movlo r0, #0x0
    cmp r0, #0x0
    addne r0, r4, #0x200
    ldrnesh r1, [r0, #0x50]
    subne r1, r1, #0x6
    strneh r1, [r0, #0x50]
.L_02046044:
    ldr r0, .L_020461e8
    ldr r2, [r4, #0x208]
    ldr r0, [r0, #0x188]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02046200
    bne .L_02046074
    ldr r1, [r4, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02046074:
    cmp r3, #0x0
    beq .L_020460c0
    ldrb r0, [r4, #0x4b]
    cmp r0, #0x0
    ldreqb r0, [r4, #0x4a]
    cmpeq r0, #0x0
    addne r0, r4, #0x200
    ldrnesh r1, [r0, #0x50]
    subne r1, r1, #0x4
    strneh r1, [r0, #0x50]
    bne .L_020460c0
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    ldreq r0, [r4, #0x40]
    cmpeq r0, #0x0
    addeq r0, r4, #0x200
    ldreqsh r1, [r0, #0x50]
    subeq r1, r1, #0x2
    streqh r1, [r0, #0x50]
.L_020460c0:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x50]
    cmp r1, #0x0
    movlt r1, #0x0
    strlth r1, [r0, #0x50]
    b .L_020460f0
.L_020460d8:
    addlt r1, r1, #0x1
    strlth r1, [r0, #0x50]
    ldr r1, [r4, #0x268]
    ldr r0, .L_02046204
    and r0, r1, r0
    str r0, [r4, #0x268]
.L_020460f0:
    add r0, r4, #0x200
    ldrh r1, [r0, #0x56]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0x56]
    add r0, r4, #0x200
    ldrh r1, [r0, #0x5a]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0x5a]
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x64]
    cmp r1, #0x0
    beq .L_02046140
    subgt r1, r1, #0x1
    addle r1, r1, #0x1
    strh r1, [r0, #0x64]
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x50]
.L_02046140:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x4e]
    cmp r1, #0x0
    ble .L_02046168
    sub r1, r1, #0x1
    strh r1, [r0, #0x4e]
    ldrsh r1, [r0, #0x4e]
    cmp r1, #0x0
    moveq r1, #0x5a
    streqh r1, [r0, #0x64]
.L_02046168:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x66]
    cmp r1, #0x0
    ble .L_02046190
    sub r1, r1, #0x14
    strh r1, [r0, #0x66]
    ldrsh r1, [r0, #0x66]
    cmp r1, #0x0
    movlt r1, #0x0
    strlth r1, [r0, #0x66]
.L_02046190:
    add r0, r4, #0x200
    ldrh r1, [r0, #0xa0]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0xa0]
    add r0, r4, #0x200
    ldrh r1, [r0, #0xa4]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0xa4]
    add r0, r4, #0x200
    ldrh r1, [r0, #0xa6]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0xa6]
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
.L_020461dc:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_020461e4: .word 0xaf7efe
.L_020461e8: .word data_020e16b0
.L_020461ec: .word data_020e1728
.L_020461f0: .word data_021052fc
.L_020461f4: .word gGameWork
.L_020461f8: .word 0x3fd
.L_020461fc: .word data_020e1748
.L_02046200: .word data_020e1838
.L_02046204: .word 0xfffff7f3
.size Type7Actor_UpdateFrame, . - Type7Actor_UpdateFrame
