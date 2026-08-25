.text

/* Exact fallback; see src/overlays/ov033/overlay033_scene_lifecycle.c for documented portable C. */

    .extern GraphicsSpriteGroup_Destroy
    .extern TitleCharacterResourceCollection_Destroy
    .extern VecFx32Object_Destroy
    .extern GraphicsSpriteGroup_AdvanceAnimations
    .extern func_ov033_021fcff4

    .global func_ov033_021fd260
func_ov033_021fd260:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x48]
    cmp r0, #0x0
    beq L_021fd280
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd280:
    ldr r0, [r4, #0xc4]
    cmp r0, #0x0
    beq L_021fd298
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd298:
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0xa8]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x0]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0xa0
    bl TitleCharacterResourceCollection_Destroy
    add r0, r4, #0x24
    bl VecFx32Object_Destroy
    add r0, r4, #0x14
    bl VecFx32Object_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov033_021fd260, .-func_ov033_021fd260

    .global func_ov033_021fd2e8
func_ov033_021fd2e8:
    ldr ip, L_021fd2f4
    ldr r0, [r0, #0x0]
    bx ip
L_021fd2f4: .word GraphicsSpriteGroup_AdvanceAnimations
.size func_ov033_021fd2e8, .-func_ov033_021fd2e8

    .global func_ov033_021fd2f8
func_ov033_021fd2f8:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0xcc]
    add r2, r0, r1, asr #0x1
    tst r1, #0x1
    ldrne r1, [r2, #0x0]
    ldrne r0, [r0, #0xc8]
    ldrne r1, [r1, r0]
    ldreq r1, [r0, #0xc8]
    mov r0, r2
    blx r1
    ldmia sp!, {r3, pc}
.size func_ov033_021fd2f8, .-func_ov033_021fd2f8

    .global func_ov033_021fd324
func_ov033_021fd324:
    stmdb sp!, {r4, lr}
    ldr lr, [r0, #0x4]
    ldr r2, [r1, #0x8]
    ldr r1, [r1, #0x4]
    ldr r4, [lr, #0x20]
    mov ip, r2, asr #0xc
    ldr r3, [lr, #0x1c]
    mov r2, r1, asr #0xc
    ldr lr, [lr, #0x24]
    rsb r4, ip, r4, asr #0xc
    ldr r1, [r0, #0x40]
    rsb r2, r2, r3, asr #0xc
    ldr ip, [r0, #0x44]
    sub r4, r4, lr, asr #0xc
    ldr r3, [r0, #0x0]
    add r1, r2, r1
    str r1, [r3, #0x18]
    add r1, r4, ip
    str r1, [r3, #0x1c]
    ldr r0, [r0, #0x48]
    bl func_ov033_021fcff4
    ldmia sp!, {r4, pc}
.size func_ov033_021fd324, .-func_ov033_021fd324
