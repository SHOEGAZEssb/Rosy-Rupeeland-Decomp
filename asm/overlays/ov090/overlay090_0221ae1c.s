.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern data_021052fc
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern ActorDerivedType1_TeardownActiveRecord
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020adcac
.extern func_ov077_02214eec
.extern func_ov090_0221a420
.extern func_ov090_0221ad64

.global func_ov090_0221ae1c
func_ov090_0221ae1c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    ldr r1, .L_0221b030
    mov r5, #0x10000000
    ldr r1, [r1, #0x0]
    mov r10, r0
    add r0, r1, #0x2000
    ldr r8, [r0, #0xea4]
    sub r6, r5, #0x10000001
    add r9, r8, #0x18
    mov r7, #0x0
    add r11, sp, #0x0
.L_0221ae4c:
    add r0, r10, r7, lsl #0x2
    ldr r1, [r0, #0x1f4]
    mov r0, r11
    bl func_ov090_0221a420
    mov r0, r9
    cmp r9, #0x0
    addne r0, r9, #0x4
    add r1, r11, #0x4
    bl func_020adcac
    mov r4, r0
    mov r0, r11
    bl VecFx32Object_Destroy
    cmp r4, r5
    movlt r6, r7
    add r7, r7, #0x1
    movlt r5, r4
    cmp r7, #0x3
    blt .L_0221ae4c
    add r0, r10, r6, lsl #0x2
    ldr r0, [r0, #0x1f4]
    ldr r1, [r8, #0x278]
    bl func_ov077_02214eec
    strb r6, [r10, #0x223]
    cmp r0, #0x0
    beq .L_0221aec4
    cmp r0, #0x1
    beq .L_0221af24
    cmp r0, #0x2
    beq .L_0221af84
    b .L_0221aff8
.L_0221aec4:
    ldr r1, .L_0221b034
    mov r0, r10
    sub r2, r1, #0xa8
    add r3, r1, #0x1
    bl func_ov090_0221ad64
    ldr r0, [r10, #0x200]
    mov r1, #0x4
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r4, [r10, #0x200]
    mov r3, #0x180
    ldrh r1, [r4, #0x24]
    add r0, r10, #0x100
    mov r2, #0x0
    orr r1, r1, #0x2
    strh r1, [r4, #0x24]
    ldr r4, [r10, #0x200]
    add r1, r3, #0x1a
    strh r3, [r4, #0x32]
    strh r3, [r4, #0x34]
    strh r2, [r0, #0xf0]
    str r1, [r10, #0x21c]
    mov r0, #0x10
    strb r0, [r10, #0x1ec]
    b .L_0221aff8
.L_0221af24:
    ldr r1, .L_0221b034
    mov r0, r10
    sub r2, r1, #0xa8
    add r3, r1, #0x1
    bl func_ov090_0221ad64
    ldr r0, [r10, #0x200]
    mov r1, #0x4
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r4, [r10, #0x200]
    mov r3, #0x180
    ldrh r1, [r4, #0x24]
    add r0, r10, #0x100
    mov r2, #0x0
    orr r1, r1, #0x2
    strh r1, [r4, #0x24]
    ldr r4, [r10, #0x200]
    add r1, r3, #0x1a
    strh r3, [r4, #0x32]
    strh r3, [r4, #0x34]
    strh r2, [r0, #0xf0]
    str r1, [r10, #0x21c]
    mov r0, #0x11
    strb r0, [r10, #0x1ec]
    b .L_0221aff8
.L_0221af84:
    add r0, r10, #0x224
    add r1, r8, #0x18
    bl VecFx32Object_Assign
    ldr r1, .L_0221b038
    mov r0, r10
    sub r2, r1, #0x9c
    add r3, r1, #0x1
    bl func_ov090_0221ad64
    ldr r2, [r10, #0x200]
    mov r1, #0x0
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r2, [r10, #0x200]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r0, [r10, #0x200]
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r10, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xf0]
    mov r1, #0x14
    mov r0, r10
    strb r1, [r10, #0x1ec]
    ldr r2, [r0, #0x0]
    mov r1, #0x82
    ldr r2, [r2, #0xc4]
    blx r2
.L_0221aff8:
    ldr r0, [r8, #0x278]
    cmp r0, #0x0
    beq .L_0221b01c
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xe8]
    blx r2
    mov r0, r8
    bl ActorDerivedType1_TeardownActiveRecord
.L_0221b01c:
    ldr r0, [r8, #0x14]
    orr r0, r0, #0x2
    str r0, [r8, #0x14]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221b030: .word data_021052fc
.L_0221b034: .word 0x10a9
.L_0221b038: .word 0x109d
.size func_ov090_0221ae1c, . - func_ov090_0221ae1c
