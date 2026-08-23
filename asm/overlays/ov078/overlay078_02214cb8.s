.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_ov078_02215c88
.extern data_ov078_02215d30
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern Actor_GetCachedTerrainHeight
.extern func_02034a60
.extern ActorExtendedType2_SpawnOptionalPresentation
.extern ActorExtendedType2_GetDescriptorValue2A
.extern ActorExtendedType2_GetDescriptorValue2C
.extern func_0204cfa4
.extern Sound_PlayOwnedEffect
.extern func_020adae4
.extern func_020adc90
.extern func_020befec
.extern func_ov078_02214704
.extern gSoundContext

.global func_ov078_02214cb8
func_ov078_02214cb8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x18
    mov r6, r0
    ldr r1, [r6, #0xd0]
    orr r1, r1, #0x2
    str r1, [r6, #0xd0]
    ldr r1, [r6, #0x260]
    orr r1, r1, #0x21
    str r1, [r6, #0x260]
    ldr r5, [r6, #0x228]
    ldr r1, [r5, #0xd0]
    tst r1, #0x100
    beq .L_02214cfc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    b .L_0221522c
.L_02214cfc:
    ldr r3, [r5, #0x1c]
    ldr r2, [r6, #0x1c]
    ldr r1, [r5, #0x20]
    sub r5, r3, r2
    ldr r0, [r6, #0x20]
    ldr r7, [r6, #0x2b4]
    sub r2, r1, r0
    ldr r3, [r6, #0x2b8]
    add r5, r7, r5
    add r0, sp, #0x8
    add r1, r6, #0x18
    add r7, r3, r2
    bl VecFx32Object_InitCopy
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x10]
    add r2, r1, r5
    add r1, r0, r7
    str r1, [sp, #0x10]
    mov r0, r6
    str r2, [sp, #0xc]
    ldr r2, [r0, #0x0]
    add r1, sp, #0x8
    ldr r2, [r2, #0xd0]
    blx r2
    mov r0, r6
    bl ActorExtendedType2_GetDescriptorValue2A
    cmp r0, #0x0
    bgt .L_02214db8
    ldr r0, [r6, #0x8c]
    ldr r2, [r6, #0x3c]
    add r0, r0, r0, lsl #0x1
    mov r1, #0x6
    mla r0, r2, r1, r0
    bl func_020adae4
    str r0, [r6, #0x8c]
    ldr r0, [r6, #0x90]
    ldr r2, [r6, #0x40]
    add r0, r0, r0, lsl #0x1
    mov r1, #0x6
    mla r0, r2, r1, r0
    bl func_020adae4
    mov r1, #0x0
    str r0, [r6, #0x90]
    str r1, [r6, #0x40]
    str r1, [r6, #0x3c]
    mov r4, #0x78
    b .L_02214eb8
.L_02214db8:
    cmp r0, #0x1
    bne .L_02214e0c
    ldr r0, [r6, #0x3c]
    ldr r1, [r6, #0x8c]
    add r0, r0, r0, lsl #0x2
    add r0, r0, r1, lsl #0x2
    mov r1, #0x6
    bl func_020adae4
    str r0, [r6, #0x8c]
    ldr r0, [r6, #0x40]
    ldr r1, [r6, #0x90]
    add r0, r0, r0, lsl #0x2
    add r0, r0, r1, lsl #0x2
    mov r1, #0x6
    bl func_020adae4
    mov r1, #0x0
    str r0, [r6, #0x90]
    str r1, [r6, #0x40]
    str r1, [r6, #0x3c]
    mov r4, #0x69
    b .L_02214eb8
.L_02214e0c:
    cmp r0, #0x2
    bne .L_02214e68
    ldr r0, [r6, #0x8c]
    ldr r1, [r6, #0x3c]
    add r2, r0, r0, lsl #0x2
    mov r0, #0x6
    mla r0, r1, r0, r2
    mov r1, #0x7
    bl func_020adae4
    str r0, [r6, #0x8c]
    ldr r0, [r6, #0x90]
    ldr r1, [r6, #0x40]
    add r2, r0, r0, lsl #0x2
    mov r0, #0x6
    mla r0, r1, r0, r2
    mov r1, #0x7
    bl func_020adae4
    mov r1, #0x0
    str r0, [r6, #0x90]
    str r1, [r6, #0x40]
    str r1, [r6, #0x3c]
    mov r4, #0x50
    b .L_02214eb8
.L_02214e68:
    cmp r0, #0x3
    blt .L_02214eb8
    ldr r2, [r6, #0x8c]
    ldr r0, [r6, #0x3c]
    mov r1, #0x6
    add r0, r2, r0
    add r0, r0, r0, lsl #0x2
    bl func_020adae4
    str r0, [r6, #0x8c]
    ldr r2, [r6, #0x90]
    ldr r0, [r6, #0x40]
    mov r1, #0x6
    add r0, r2, r0
    add r0, r0, r0, lsl #0x2
    bl func_020adae4
    mov r1, #0x0
    str r0, [r6, #0x90]
    str r1, [r6, #0x40]
    str r1, [r6, #0x3c]
    mov r4, #0x46
.L_02214eb8:
    ldr r0, [r6, #0x2c0]
    mov r1, #0xf
    cmp r0, #0x0
    movne r0, #0x3
    moveq r0, #0x2
    strb r0, [r6, #0x24c]
    mov r0, #0x1b
    strh r0, [r6, #0xd6]
    add r0, r6, #0x200
    ldrsh r0, [r0, #0x98]
    bl func_020befec
    cmp r1, #0x0
    bne .L_02214f28
    mov r0, r6
    mov r1, #0x2
    mov r2, #0x100
    mov r3, #0x14
    bl ActorExtendedType2_SpawnOptionalPresentation
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, #0x100
    ldr r0, .L_02215234
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r6
    mov r1, #0x61
    mov r2, #0x6
    bl Sound_PlayOwnedEffect
.L_02214f28:
    add r0, r6, #0x200
    ldrsh r1, [r0, #0x98]
    add r1, r1, #0x1
    strh r1, [r0, #0x98]
    ldrsh r2, [r0, #0x98]
    cmp r2, r4
    ble .L_02214f58
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x200]
    blx r1
    b .L_02215224
.L_02214f58:
    ldr r1, [r6, #0x260]
    tst r1, #0x10
    beq .L_02214f78
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x200]
    blx r1
    b .L_02215224
.L_02214f78:
    tst r1, #0x80
    beq .L_02214fb0
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x204]
    blx r1
    mov r0, r6
    bl func_ov078_02214704
    mov r0, #0x3000
    str r0, [r6, #0x44]
    add r0, r6, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x9e]
    b .L_02215224
.L_02214fb0:
    cmp r2, #0xf
    ble .L_0221521c
    mov r1, #0xf
    strh r1, [r0, #0x9e]
    ldrb r0, [r6, #0x4b]
    cmp r0, #0x0
    beq .L_02215028
    ldr r2, [r6, #0x3c]
    ldr r1, [r6, #0x8c]
    mov r0, r6
    add r1, r2, r1
    rsb r1, r1, #0x0
    str r1, [r6, #0x8c]
    ldr r2, [r6, #0x40]
    ldr r1, [r6, #0x90]
    add r1, r2, r1
    rsb r1, r1, #0x0
    str r1, [r6, #0x90]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x204]
    blx r1
    mov r0, r6
    bl func_ov078_02214704
    ldr r1, .L_02215238
    mov r0, r6
    mov r2, #0x0
    bl func_02034a60
    mov r0, #0x3000
    str r0, [r6, #0x44]
    b .L_02215224
.L_02215028:
    ldr r1, [r6, #0x2ac]
    cmp r1, #0x0
    beq .L_02215224
    ldrb r0, [r1, #0x4d]
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_022150c8
    ldrh r0, [r1, #0x4e]
    cmp r0, #0x5
    bne .L_022150c8
    mov r0, r6
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r6, #0x24]
    cmp r1, r0
    bne .L_022150c8
    ldr r1, .L_02215238
    mov r0, r6
    mov r2, #0x0
    bl func_02034a60
    ldr r2, [r6, #0x3c]
    ldr r1, [r6, #0x8c]
    mov r0, r6
    add r1, r2, r1
    rsb r1, r1, #0x0
    str r1, [r6, #0x8c]
    ldr r2, [r6, #0x40]
    ldr r1, [r6, #0x90]
    add r1, r2, r1
    rsb r1, r1, #0x0
    str r1, [r6, #0x90]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x204]
    blx r1
    mov r0, r6
    bl func_ov078_02214704
    mov r0, #0x3000
    str r0, [r6, #0x44]
    b .L_02215224
.L_022150c8:
    ldr r0, [r6, #0x2ac]
    ldrb r0, [r0, #0x4d]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02215224
    mov r0, r6
    bl ActorExtendedType2_GetDescriptorValue2C
    mvn r1, #0x0
    cmp r0, r1
    bne .L_02215224
    ldr r5, [r6, #0x2ac]
    add r0, r5, #0x200
    ldrsb r0, [r0, #0x7e]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02215224
    ldr r0, .L_0221523c
    ldr r2, [r5, #0x2a4]
    ldr r0, [r0, #0xa8]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02215240
    bne .L_02215148
    ldr r1, [r5, #0x2a8]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02215148:
    cmp r3, #0x0
    bne .L_02215224
    ldr r3, [r5, #0x1c]
    ldr r2, [r6, #0x1c]
    ldr r1, [r5, #0x20]
    ldr r0, [r6, #0x20]
    sub r4, r3, r2
    sub r8, r1, r0
    mov r0, r4
    mov r1, r8
    bl func_0204cfa4
    mov r7, r0
    cmp r7, #0x1000
    ble .L_02215224
    ldr r1, .L_02215238
    mov r0, r6
    mov r2, #0x0
    bl func_02034a60
    mov r0, r4
    mov r1, r7
    bl func_020adc90
    mov r4, r0
    mov r0, r8
    mov r1, r7
    bl func_020adc90
    ldr r1, [r6, #0x8c]
    sub r1, r1, r4
    str r1, [r6, #0x8c]
    ldr r1, [r6, #0x90]
    sub r1, r1, r0
    str r1, [r6, #0x90]
    ldr r1, [r5, #0x8c]
    add r1, r1, r4
    str r1, [r5, #0x8c]
    ldr r1, [r5, #0x90]
    add r1, r1, r0
    mov r0, r6
    str r1, [r5, #0x90]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x204]
    blx r1
    mov r0, r6
    bl func_ov078_02214704
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x204]
    blx r1
    mov r0, r5
    bl func_ov078_02214704
    mov r0, #0x2000
    str r0, [r6, #0x44]
    str r0, [r5, #0x44]
    b .L_02215224
.L_0221521c:
    mov r1, #0x0
    strh r1, [r0, #0x9e]
.L_02215224:
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
.L_0221522c:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02215234: .word gSoundContext
.L_02215238: .word 0x3088
.L_0221523c: .word data_ov078_02215c88
.L_02215240: .word data_ov078_02215d30
.size func_ov078_02214cb8, . - func_ov078_02214cb8
