.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Triple_Destroy
.extern VecFx32Bezier_Evaluate3D
.extern Actor_GetCachedTerrainHeight
.extern func_0204cfa4
.extern TrackedResourceActor_SpawnFromKey
.extern func_020593dc
.extern func_020ada8c
.extern func_020befec
.extern func_020bf1f8
.extern func_ov095_02217d58
.extern func_ov095_02218404
.extern func_ov095_02218414
.extern func_ov095_0221a208
.extern func_ov095_0221a250
.extern func_ov095_0221ae5c
.extern func_ov095_0221ae9c
.extern gSoundContext

.global func_ov095_0221a418
func_ov095_0221a418:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0xb8
    mov r4, r0
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x98]
    cmp r1, #0x0
    ldreqsh r1, [r4, #0xda]
    cmpeq r1, #0x14
    bne .L_0221a4e0
    ldr r2, [r4, #0x14]
    mov r1, #0x0
    orr r2, r2, #0x40
    orr r2, r2, #0x2000000
    str r2, [r4, #0x14]
    strh r1, [r0, #0xd6]
    add r0, r4, #0x2e0
    add r1, r4, #0x18
    bl VecFx32Object_Assign
    ldr r1, [r4, #0x300]
    add r0, r4, #0x2f0
    add r1, r1, #0x18
    bl VecFx32Object_Assign
    ldr r0, [r4, #0x2fc]
    add r0, r0, #0x10000
    str r0, [r4, #0x2fc]
    ldr r0, [r4, #0x2f8]
    add r3, r0, #0x14000
    str r3, [r4, #0x2f8]
    ldr r1, [r4, #0x2e8]
    ldr r2, [r4, #0x2e4]
    ldr r0, [r4, #0x2f4]
    sub r1, r1, r3
    sub r0, r2, r0
    bl func_0204cfa4
    mov r1, #0x6
    bl func_020befec
    mov r0, r0, asr #0xc
    add r1, r0, #0x5a
    ldr r2, [r4, #0x314]
    ldr r0, .L_0221a86c
    mov r1, r1, lsl #0x12
    and r0, r2, r0
    orr r0, r0, r1, lsr #0x10
    str r0, [r4, #0x314]
    ldr r0, [r4, #0x14]
    mov r1, #0x2
    orr r0, r0, #0x80
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x54]
    strb r1, [r0, #0x3a]
.L_0221a4e0:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_ov095_02218404
    mov r0, #0x0
    strb r0, [r4, #0x24c]
    ldr r3, [r4, #0x260]
    ldr r1, .L_0221a870
    mov r2, #0x1b
    and r1, r3, r1
    str r1, [r4, #0x260]
    strh r2, [r4, #0xd6]
    ldrsh r1, [r4, #0xda]
    sub r1, r1, #0x14
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_0221a7dc
.L_0221a550:
    b .L_0221a564
    b .L_0221a658
    b .L_0221a7dc
    b .L_0221a680
    b .L_0221a750
.L_0221a564:
    add r1, r4, #0x200
    ldrsh r2, [r1, #0xdc]
    add r2, r2, #0x1
    strh r2, [r1, #0xdc]
    ldr r2, [r4, #0x314]
    ldrsh r3, [r1, #0xdc]
    mov r2, r2, lsl #0x10
    cmp r3, r2, lsr #0x12
    bhi .L_0221a63c
    add r0, sp, #0x38
    add r1, r4, #0x2f0
    add r2, r4, #0x2e0
    bl func_ov095_02218414
    add r0, sp, #0x28
    add r1, sp, #0x38
    mov r2, #0x2000
    bl func_ov095_0221a208
    add r0, sp, #0xa8
    add r2, sp, #0x28
    add r1, r4, #0x2e0
    bl func_ov095_02217d58
    add r0, sp, #0x28
    bl VecFx32Object_Destroy
    add r0, sp, #0x38
    bl VecFx32Object_Destroy
    ldr r1, [r4, #0x2fc]
    add r0, sp, #0x78
    add r1, r1, #0x18000
    str r1, [sp, #0xb4]
    add r1, r4, #0x2e0
    add r2, r4, #0x2f0
    add r3, sp, #0xa8
    bl func_ov095_0221a250
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xdc]
    ldr r1, [r4, #0x314]
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0xc
    mov r1, r1, lsr #0x12
    bl func_020bf1f8
    mov r2, r0
    add r0, sp, #0x18
    add r1, sp, #0x78
    bl VecFx32Bezier_Evaluate3D
    add r0, r4, #0x18
    add r1, sp, #0x18
    bl VecFx32Object_Assign
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
    add r0, sp, #0x78
    bl VecFx32Triple_Destroy
    add r0, sp, #0xa8
    bl VecFx32Object_Destroy
    b .L_0221a864
.L_0221a63c:
    mov r2, #0x15
    strh r2, [r4, #0xda]
    strh r0, [r1, #0xdc]
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x2000000
    str r0, [r4, #0x14]
    b .L_0221a864
.L_0221a658:
    ldr r1, [r4, #0x54]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    movne r1, #0x16
    strneh r1, [r4, #0xda]
    addne r1, r4, #0x200
    strneh r0, [r1, #0xdc]
    b .L_0221a864
.L_0221a680:
    add r0, sp, #0x8
    mov r1, #0x5000
    mov r2, #0x8000
    mov r3, #0x1a000
    bl VecFx32Object_InitComponents
    add r0, sp, #0x68
    add r2, sp, #0x8
    add r1, r4, #0x18
    bl func_ov095_02217d58
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xdc]
    cmp r0, #0x3c
    bge .L_0221a71c
    mov r1, #0x14
    bl func_020ada8c
    cmp r0, #0x0
    bne .L_0221a71c
    add r0, sp, #0x58
    add r1, sp, #0x68
    bl VecFx32Object_InitCopy
    add r0, sp, #0x48
    add r1, sp, #0x68
    bl VecFx32Object_InitCopy
    ldr r1, [sp, #0x50]
    mov r0, r4
    add r1, r1, #0x20000
    str r1, [sp, #0x50]
    bl Actor_GetCachedTerrainHeight
    str r0, [sp, #0x54]
    add r1, sp, #0x58
    add r2, sp, #0x48
    mov r0, #0x40
    bl TrackedResourceActor_SpawnFromKey
    add r0, sp, #0x48
    bl VecFx32Object_Destroy
    add r0, sp, #0x58
    bl VecFx32Object_Destroy
.L_0221a71c:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    add r1, r1, #0x1
    strh r1, [r0, #0xdc]
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0xa0
    movge r1, #0x16
    strgeh r1, [r4, #0xda]
    movge r1, #0x0
    strgeh r1, [r0, #0xdc]
    add r0, sp, #0x68
    bl VecFx32Object_Destroy
    b .L_0221a864
.L_0221a750:
    add r1, r4, #0x200
    ldrsh r1, [r1, #0xdc]
    cmp r1, #0x78
    bne .L_0221a790
    mov r1, #0x200
    str r0, [sp, #0x0]
    ldr r0, .L_0221a874
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    sub r1, r1, #0x12
    mov r2, #0xc
    bl func_020593dc
    ldr r0, [r4, #0x54]
    mov r1, #0x200
    strh r1, [r0, #0x36]
.L_0221a790:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    add r1, r1, #0x1
    strh r1, [r0, #0xdc]
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0xb4
    blt .L_0221a864
    mov r1, #0x1
    strb r1, [r4, #0x319]
    ldr r2, [r4, #0x14]
    mov r1, #0x0
    orr r2, r2, #0x2000000
    bic r2, r2, #0x40
    str r2, [r4, #0x14]
    strh r1, [r0, #0xdc]
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x80
    str r0, [r4, #0x14]
    b .L_0221a864
.L_0221a7dc:
    mov r0, r4
    bl func_ov095_0221ae5c
    cmp r0, #0x0
    bne .L_0221a7fc
    mov r0, r4
    bl func_ov095_0221ae9c
    cmp r0, #0x0
    beq .L_0221a814
.L_0221a7fc:
    mov r0, #0x18
    strh r0, [r4, #0xda]
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xdc]
    b .L_0221a864
.L_0221a814:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0xdc]
    add r1, r1, #0x1
    strh r1, [r0, #0xdc]
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0x258
    ble .L_0221a864
    mov r1, #0x17
    strh r1, [r4, #0xda]
    mov r2, #0x0
    strh r2, [r0, #0xdc]
    mov r1, #0x200
    str r2, [sp, #0x0]
    ldr r0, .L_0221a874
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    sub r1, r1, #0x12
    mov r2, #0xb
    bl func_020593dc
.L_0221a864:
    add sp, sp, #0xb8
    ldmia sp!, {r4, pc}
.L_0221a86c: .word 0xffff0003
.L_0221a870: .word 0xffffebf5
.L_0221a874: .word gSoundContext
.size func_ov095_0221a418, . - func_ov095_0221a418
