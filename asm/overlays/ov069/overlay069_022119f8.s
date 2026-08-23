.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern Sound_Play
.extern data_020c9670
.extern data_021052fc
.extern data_ov069_0221279c
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_0209e328
.extern func_0209e330
.extern Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
.extern Graphics3dPresentation_CreatePreset11To13SpriteEffectAt
.extern func_020adc40
.extern func_020adc90
.extern func_020ae024
.extern func_020befec
.extern func_ov039_022014e0
.extern func_ov039_0220391c
.extern func_ov039_02203940
.extern func_ov039_02203964
.extern func_ov039_0220397c
.extern func_ov039_02203990
.extern func_ov039_022039a4
.extern func_ov069_02210928
.extern func_ov069_0221094c
.extern func_ov069_02210970
.extern func_ov069_02210988
.extern func_ov069_0221099c
.extern func_ov069_022109b0
.extern func_ov069_022124f0
.extern gSoundContext

.global func_ov069_022119f8
func_ov069_022119f8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xd4
    ldr r1, .L_022124a0
    mov r6, #0x0
    mov r10, r0
    str r1, [sp, #0xc8]
    str r6, [sp, #0xcc]
    str r6, [sp, #0xd0]
    ldr r2, [r10, #0x4c]
    mov r4, #0x1000
    ldr r0, [r2, #0x74]
    mov r5, #0x5000
    cmp r0, #0x19
    blt .L_02211afc
    cmp r0, #0x1a
    bgt .L_02211afc
    ldr r0, [r2, #0x14]
    ldr r1, [r10, #0x48]
    cmp r0, #0x0
    beq .L_02211a54
    add r1, r1, #0x2c
    bl func_ov069_022109b0
    b .L_02211a60
.L_02211a54:
    ldr r0, [r2, #0x18]
    add r1, r1, #0x2c
    bl func_ov039_022039a4
.L_02211a60:
    mov r7, r0
    cmp r7, #0x0
    blt .L_02211ae8
    add r0, sp, #0xb8
    bl VecFx32Object_Init
    ldr r1, [r10, #0x4c]
    add r2, sp, #0xb8
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    beq .L_02211a94
    mov r1, r7
    bl func_ov069_0221094c
    b .L_02211aa0
.L_02211a94:
    ldr r0, [r1, #0x18]
    mov r1, r7
    bl func_ov039_02203940
.L_02211aa0:
    ldr r1, [sp, #0xbc]
    ldr r0, [sp, #0xc0]
    str r1, [sp, #0xcc]
    str r0, [sp, #0xd0]
    ldr r2, [r10, #0x4c]
    ldr r1, [r10, #0x48]
    ldr r0, [r2, #0x14]
    cmp r0, #0x0
    beq .L_02211ad0
    add r1, r1, #0x2c
    bl func_ov069_0221099c
    b .L_02211adc
.L_02211ad0:
    ldr r0, [r2, #0x18]
    add r1, r1, #0x2c
    bl func_ov039_02203990
.L_02211adc:
    add r0, sp, #0xb8
    bl VecFx32Object_Destroy
    b .L_02211eac
.L_02211ae8:
    mov r1, #0x200000
    mov r0, #0x190000
    str r1, [sp, #0xcc]
    str r0, [sp, #0xd0]
    b .L_02211eac
.L_02211afc:
    cmp r0, #0x17
    cmpne r0, #0x18
    ldr r0, [r2, #0x14]
    bne .L_02211b94
    cmp r0, #0x0
    mov r4, #0x2000
    ldr r5, .L_022124a4
    beq .L_02211b4c
    ldr r0, [r0, #0x98]
    mov r6, #0x1
    ldr r0, [r0, #0x20]
    add r0, r0, #0x1d000
    str r0, [sp, #0xcc]
    ldr r0, [r10, #0x4c]
    ldr r0, [r0, #0x14]
    ldr r0, [r0, #0x98]
    ldr r0, [r0, #0x24]
    add r0, r0, #0x71000
    str r0, [sp, #0xd0]
    b .L_02211eac
.L_02211b4c:
    ldr r1, [r2, #0x18]
    add r0, sp, #0x78
    bl func_ov039_022014e0
    ldr r1, [sp, #0x7c]
    add r0, sp, #0x78
    str r1, [sp, #0xcc]
    bl VecFx32Object_Destroy
    ldr r1, [r10, #0x4c]
    add r0, sp, #0x68
    ldr r1, [r1, #0x18]
    bl func_ov039_022014e0
    ldr r1, [sp, #0x70]
    add r0, sp, #0x68
    add r1, r1, #0x64000
    str r1, [sp, #0xd0]
    bl VecFx32Object_Destroy
    mov r6, #0x1
    b .L_02211eac
.L_02211b94:
    cmp r0, #0x0
    ldr r1, [r10, #0x48]
    beq .L_02211bb0
    mov r2, #0xa0000
    add r1, r1, #0x2c
    bl func_ov069_02210988
    b .L_02211bc0
.L_02211bb0:
    ldr r0, [r2, #0x18]
    add r1, r1, #0x2c
    mov r2, #0xa0000
    bl func_ov039_0220397c
.L_02211bc0:
    mov r7, r0
    cmp r7, #0x0
    blt .L_02211c88
    add r0, sp, #0xa8
    bl VecFx32Object_Init
    ldr r1, [r10, #0x4c]
    add r2, sp, #0xa8
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    beq .L_02211bf4
    mov r1, r7
    bl func_ov069_02210928
    b .L_02211c00
.L_02211bf4:
    ldr r0, [r1, #0x18]
    mov r1, r7
    bl func_ov039_0220391c
.L_02211c00:
    ldr r1, [sp, #0xac]
    ldr r0, [sp, #0xb0]
    str r1, [sp, #0xcc]
    str r0, [sp, #0xd0]
    ldr r2, [r10, #0x4c]
    ldr r1, [r10, #0x48]
    ldr r0, [r2, #0x14]
    cmp r0, #0x0
    beq .L_02211c30
    add r1, r1, #0x2c
    bl func_ov069_02210970
    b .L_02211c3c
.L_02211c30:
    ldr r0, [r2, #0x18]
    add r1, r1, #0x2c
    bl func_ov039_02203964
.L_02211c3c:
    cmp r0, #0x0
    beq .L_02211c7c
    ldr r0, .L_022124a8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    ldr r3, [r10, #0x48]
    mov r1, #0x8
    str r1, [sp, #0x0]
    ldr r2, [r3, #0x30]
    ldr r1, [r3, #0x34]
    mov r2, r2, asr #0xc
    mov r3, r1, asr #0xc
    mov r1, #0x4
    bl Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
.L_02211c7c:
    add r0, sp, #0xa8
    bl VecFx32Object_Destroy
    b .L_02211d3c
.L_02211c88:
    ldr r1, [r10, #0x4c]
    ldr r0, [r1, #0x74]
    cmp r0, #0x0
    ldrne r1, .L_022124ac
    addne r0, r1, #0x11000
    strne r1, [sp, #0xcc]
    strne r0, [sp, #0xd0]
    bne .L_02211d3c
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    beq .L_02211ccc
    ldr r1, [r0, #0x98]
    ldr r0, .L_022124b0
    ldr r1, [r1, #0x20]
    str r1, [sp, #0xcc]
    str r0, [sp, #0xd0]
    b .L_02211cf0
.L_02211ccc:
    ldr r1, [r1, #0x18]
    add r0, sp, #0x58
    bl func_ov039_022014e0
    ldr r1, [sp, #0x5c]
    add r0, sp, #0x58
    str r1, [sp, #0xcc]
    bl VecFx32Object_Destroy
    ldr r0, .L_022124b4
    str r0, [sp, #0xd0]
.L_02211cf0:
    ldr r0, [r10, #0x4c]
    ldr r2, [sp, #0xcc]
    ldr r0, [r0, #0x8]
    ldr r1, [sp, #0xd0]
    ldr r0, [r0, #0x48]
    ldr r0, [r0, #0x30]
    add r0, r2, r0
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [sp, #0xcc]
    ldr r0, [r10, #0x4c]
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0x48]
    ldr r0, [r0, #0x34]
    add r1, r1, r0
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    mov r0, r0, asr #0x2
    str r0, [sp, #0xd0]
.L_02211d3c:
    add r0, sp, #0x98
    bl VecFx32Object_Init
    ldr r1, [r10, #0x4c]
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    beq .L_02211d68
    ldr r1, [r0, #0x98]
    add r0, sp, #0x98
    add r1, r1, #0x1c
    bl VecFx32Object_Assign
    b .L_02211d88
.L_02211d68:
    ldr r1, [r1, #0x18]
    add r0, sp, #0x48
    bl func_ov039_022014e0
    add r0, sp, #0x98
    add r1, sp, #0x48
    bl VecFx32Object_Assign
    add r0, sp, #0x48
    bl VecFx32Object_Destroy
.L_02211d88:
    ldr r2, [r10, #0x48]
    ldr r1, [sp, #0xa0]
    ldr r7, [r2, #0x30]
    ldr r3, [sp, #0x9c]
    mov r0, #0x69000
    ldr r2, [r2, #0x34]
    add r1, r1, #0xa000
    sub r7, r7, r3
    rsb r0, r0, #0x0
    cmp r7, r0
    sub r8, r2, r1
    ble .L_02211ea4
    cmp r7, #0x69000
    bge .L_02211ea4
    add r0, r0, #0x19000
    cmp r8, r0
    ble .L_02211ea4
    cmp r8, #0x50000
    bge .L_02211ea4
    cmp r7, #0x0
    rsblt r11, r7, #0x0
    movge r11, r7
    cmp r8, #0x0
    rsblt r9, r8, #0x0
    movge r9, r8
    mov r0, r11
    mov r1, #0x69000
    bl func_020adc90
    str r0, [sp, #0x4]
    mov r0, r9
    mov r1, #0x50000
    bl func_020adc90
    ldr r1, [sp, #0x4]
    cmp r1, r0
    movle r11, #0x0
    movgt r9, #0x0
    movle r7, r11
    movgt r8, r9
    cmp r7, #0x0
    movlt r1, #0x1000
    rsblt r1, r1, #0x0
    blt .L_02211e38
    movgt r1, #0x1000
    movle r1, #0x0
.L_02211e38:
    rsb r0, r11, #0x69000
    smull r2, r1, r0, r1
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    ldr r3, [r10, #0x48]
    orr r1, r1, r0, lsl #0x14
    ldr r2, [r3, #0x30]
    cmp r8, #0x0
    add r0, r2, r1
    str r0, [r3, #0x30]
    mov r1, #0x0
    mov r0, #0x800
    sublt r1, r0, #0x1800
    blt .L_02211e7c
    cmp r8, #0x0
    movgt r1, #0x1000
.L_02211e7c:
    rsb r0, r9, #0x50000
    smull r2, r1, r0, r1
    adds r2, r2, #0x800
    ldr r3, [r10, #0x48]
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    ldr r2, [r3, #0x34]
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [r3, #0x34]
.L_02211ea4:
    add r0, sp, #0x98
    bl VecFx32Object_Destroy
.L_02211eac:
    ldr r0, [r10, #0x60]
    cmp r0, #0x1
    bne .L_02211ee4
    ldr r0, [r10, #0x64]
    add r0, r0, #0x1
    str r0, [r10, #0x64]
    cmp r0, #0xf
    blt .L_02212498
    ldr r1, [r10, #0x60]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r10, #0x60]
    str r0, [r10, #0x64]
    b .L_02212498
.L_02211ee4:
    cmp r0, #0x2
    bne .L_02211fa8
    ldr r0, [r10, #0x64]
    add r1, r10, #0x50
    add r0, r0, #0x1
    str r0, [r10, #0x64]
    ldr r0, [r10, #0x48]
    add r0, r0, #0x2c
    bl VecFx32Object_Add
    ldr r0, [r10, #0x64]
    mov r1, #0x32
    mov r0, r0, lsl #0xe
    bl func_020befec
    mov r1, r0, asr #0x4
    ldr r0, .L_022124b8
    mov r1, r1, lsl #0x2
    ldrsh r2, [r0, r1]
    mov r1, #0x3c
    ldr r0, [r10, #0x48]
    smulbb r2, r2, r1
    str r2, [r0, #0x38]
    ldr r4, [r10, #0x48]
    ldr r0, [r4, #0x38]
    rsb r0, r0, r0, lsl #0x8
    mov r0, r0, asr #0xc
    bl func_020befec
    add r0, r0, #0x100
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    strh r0, [r4, #0x3c]
    strh r0, [r4, #0x3e]
    ldr r2, [r10, #0x64]
    ldr r1, .L_022124bc
    ldr r0, [r10, #0x4c]
    mul r1, r2, r1
    bl func_0209e328
    ldr r0, [r10, #0x64]
    cmp r0, #0x32
    blt .L_02212498
    ldr r0, [r10, #0x48]
    mov r1, #0x14
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x0
    str r0, [r10, #0x64]
    ldr r0, [r10, #0x60]
    add r0, r0, #0x1
    str r0, [r10, #0x60]
    b .L_02212498
.L_02211fa8:
    cmp r0, #0x3
    bne .L_02211fd0
    ldr r0, [r10, #0x64]
    add r0, r0, #0x1
    str r0, [r10, #0x64]
    cmp r0, #0x1e
    ldrge r0, [r10, #0x60]
    addge r0, r0, #0x1
    strge r0, [r10, #0x60]
    b .L_02212498
.L_02211fd0:
    cmp r0, #0x4
    bne .L_022120a0
    ldr r1, [r10, #0x48]
    ldr r0, [r1, #0x38]
    sub r0, r0, #0x8000
    str r0, [r1, #0x38]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x38]
    cmp r0, #0x0
    bge .L_02212070
    ldr r0, [r10, #0x60]
    mov r2, #0x0
    add r0, r0, #0x1
    str r0, [r10, #0x60]
    str r2, [r10, #0x64]
    ldr r1, [r10, #0x48]
    ldr r0, .L_022124a8
    str r2, [r1, #0x38]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    ldr r3, [r10, #0x48]
    mov r1, #0x0
    ldr r2, [r3, #0x34]
    ldr r4, [r3, #0x30]
    mov r3, r2, asr #0xc
    mov r2, r4, asr #0xc
    add r3, r3, #0x8
    bl Graphics3dPresentation_CreatePreset11To13SpriteEffectAt
    ldr r2, [r10, #0x4c]
    mov r0, #0x19
    str r0, [r2, #0x44]
    mov r1, #0x3
    ldr r0, .L_022124c0
    str r1, [r2, #0x48]
    ldr r0, [r0, #0x0]
    mov r1, #0x63
    mov r2, #0x11
    bl Sound_Play
.L_02212070:
    ldr r4, [r10, #0x48]
    mov r1, #0x3c
    ldr r0, [r4, #0x38]
    rsb r0, r0, r0, lsl #0x8
    mov r0, r0, asr #0xc
    bl func_020befec
    add r0, r0, #0x100
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    strh r0, [r4, #0x3c]
    strh r0, [r4, #0x3e]
    b .L_02212498
.L_022120a0:
    cmp r0, #0x5
    bne .L_02212160
    ldr r0, [r10, #0x64]
    add r0, r0, #0x1
    str r0, [r10, #0x64]
    cmp r0, #0x19
    blt .L_02212498
    ldr r1, [r10, #0x4c]
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    beq .L_022120f8
    ldr r0, [r0, #0x98]
    ldr r0, [r0, #0x20]
    sub r0, r0, #0x1a000
    str r0, [sp, #0xcc]
    ldr r0, [r10, #0x4c]
    ldr r0, [r0, #0x14]
    ldr r0, [r0, #0x98]
    ldr r0, [r0, #0x24]
    add r0, r0, #0x5a000
    str r0, [sp, #0xd0]
    b .L_0221213c
.L_022120f8:
    ldr r1, [r1, #0x18]
    add r0, sp, #0x38
    bl func_ov039_022014e0
    ldr r1, [sp, #0x3c]
    add r0, sp, #0x38
    sub r1, r1, #0x1a000
    str r1, [sp, #0xcc]
    bl VecFx32Object_Destroy
    ldr r1, [r10, #0x4c]
    add r0, sp, #0x28
    ldr r1, [r1, #0x18]
    bl func_ov039_022014e0
    ldr r1, [sp, #0x30]
    add r0, sp, #0x28
    add r1, r1, #0x5a000
    str r1, [sp, #0xd0]
    bl VecFx32Object_Destroy
.L_0221213c:
    add r1, sp, #0xc8
    mov r0, r10
    bl func_ov069_022124f0
    ldr r1, [r10, #0x60]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r10, #0x60]
    str r0, [r10, #0x64]
    b .L_02212498
.L_02212160:
    cmp r0, #0x6
    bne .L_0221222c
    ldr r0, [r10, #0x64]
    add r1, r10, #0x50
    add r0, r0, #0x1
    str r0, [r10, #0x64]
    ldr r0, [r10, #0x48]
    add r0, r0, #0x2c
    bl VecFx32Object_Add
    ldr r0, [r10, #0x64]
    mov r1, #0x32
    mov r0, r0, lsl #0xf
    bl func_020befec
    mov r1, r0, asr #0x4
    ldr r0, .L_022124b8
    mov r1, r1, lsl #0x2
    ldrsh r2, [r0, r1]
    mov r1, #0x3c
    ldr r0, [r10, #0x48]
    smulbb r2, r2, r1
    str r2, [r0, #0x38]
    ldr r4, [r10, #0x48]
    mov r0, #0x14
    ldr r2, [r4, #0x38]
    mul r0, r2, r0
    mov r0, r0, asr #0xc
    bl func_020befec
    add r0, r0, #0x100
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    strh r0, [r4, #0x3c]
    strh r0, [r4, #0x3e]
    ldr r0, [r10, #0x4c]
    bl func_0209e330
    mov r1, r0
    ldr r0, [r10, #0x4c]
    add r1, r1, #0x800
    bl func_0209e328
    ldr r0, [r10, #0x64]
    cmp r0, #0x32
    blt .L_02212498
    ldr r0, [r10, #0x48]
    mov r1, #0x8
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x0
    str r0, [r10, #0x64]
    ldr r0, [r10, #0x60]
    add r0, r0, #0x1
    str r0, [r10, #0x60]
    b .L_02212498
.L_0221222c:
    cmp r0, #0x7
    beq .L_02212498
    mov r1, #0x0
    add r0, sp, #0x88
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    ldr r0, [r10, #0x48]
    ldr r1, [sp, #0xcc]
    ldr r0, [r0, #0x30]
    ldr r8, [sp, #0xd0]
    sub r3, r1, r0
    smull r1, r0, r3, r3
    str r3, [sp, #0x8c]
    adds r7, r1, #0x800
    ldr r2, [r10, #0x48]
    adc r3, r0, #0x0
    ldr r1, [r2, #0x34]
    mov r7, r7, lsr #0xc
    sub r1, r8, r1
    smull r2, r0, r1, r1
    adds r2, r2, #0x800
    adc r0, r0, #0x0
    mov r2, r2, lsr #0xc
    orr r7, r7, r3, lsl #0x14
    orr r2, r2, r0, lsl #0x14
    add r0, r7, r2
    str r1, [sp, #0x90]
    bl func_020adc40
    mov r7, r0
    cmp r7, r5
    ble .L_0221237c
    ldr r0, [sp, #0x8c]
    ldr r1, [sp, #0x90]
    bl func_020ae024
    rsb r0, r0, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    add r0, r0, #0x1000
    mov r0, r0, asr #0xd
    and r6, r0, #0x7
    ldr r0, [sp, #0x8c]
    mov r1, r7
    bl func_020adc90
    str r0, [sp, #0x8c]
    ldr r0, [sp, #0x90]
    mov r1, r7
    bl func_020adc90
    sub r1, r7, r5
    cmp r1, r4
    movlt r4, r1
    ldr r1, [sp, #0x8c]
    str r0, [sp, #0x90]
    smull r2, r3, r1, r4
    ldr r0, [sp, #0x90]
    adds r5, r2, #0x800
    smull r2, r1, r0, r4
    adc r0, r3, #0x0
    adds r2, r2, #0x800
    mov r3, r5, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    adc r0, r1, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    add r1, sp, #0x88
    str r3, [sp, #0x8c]
    str r2, [sp, #0x90]
    add r0, r10, #0x50
    bl VecFx32Object_Assign
    ldr r0, [r10, #0x48]
    add r1, r10, #0x50
    add r0, r0, #0x2c
    bl VecFx32Object_Add
    ldr r2, [r10, #0x48]
    ldr r0, [r2, #0xc]
    ldrb r0, [r0, #0x38]
    cmp r6, r0
    beq .L_02212490
    and r1, r6, #0xff
    strh r1, [r2, #0x40]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02212490
.L_0221237c:
    ldr r2, [r10, #0x48]
    ldr r0, [r2, #0xc]
    ldrh r1, [r2, #0x40]
    ldrb r0, [r0, #0x38]
    orr r1, r1, #0x8
    cmp r1, r0
    beq .L_022123ac
    and r1, r1, #0xff
    strh r1, [r2, #0x40]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
.L_022123ac:
    cmp r6, #0x0
    beq .L_02212490
    ldr r1, [r10, #0x4c]
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    addne r0, r0, #0x1c00
    ldrneh r0, [r0, #0xae]
    ldreq r0, [r1, #0x18]
    addeq r0, r0, #0x1c00
    ldreqh r0, [r0, #0xaa]
    cmp r0, #0x78
    ble .L_02212490
    ldr r0, [r10, #0x60]
    cmp r0, #0x0
    bne .L_02212490
    mov r0, #0x1
    str r0, [r10, #0x60]
    mov r2, #0x0
    str r2, [r10, #0x64]
    ldr r0, [r10, #0x48]
    mov r1, #0x13
    ldr r0, [r0, #0xc]
    strb r2, [r0, #0x3a]
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r10, #0x4c]
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    beq .L_02212448
    ldr r0, [r0, #0x98]
    ldr r0, [r0, #0x20]
    str r0, [sp, #0xcc]
    ldr r0, [r10, #0x4c]
    ldr r0, [r0, #0x14]
    ldr r0, [r0, #0x98]
    ldr r0, [r0, #0x24]
    str r0, [sp, #0xd0]
    b .L_02212484
.L_02212448:
    ldr r1, [r1, #0x18]
    add r0, sp, #0x18
    bl func_ov039_022014e0
    ldr r1, [sp, #0x1c]
    add r0, sp, #0x18
    str r1, [sp, #0xcc]
    bl VecFx32Object_Destroy
    ldr r1, [r10, #0x4c]
    add r0, sp, #0x8
    ldr r1, [r1, #0x18]
    bl func_ov039_022014e0
    ldr r1, [sp, #0x10]
    add r0, sp, #0x8
    str r1, [sp, #0xd0]
    bl VecFx32Object_Destroy
.L_02212484:
    add r1, sp, #0xc8
    mov r0, r10
    bl func_ov069_022124f0
.L_02212490:
    add r0, sp, #0x88
    bl VecFx32Object_Destroy
.L_02212498:
    add sp, sp, #0xd4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022124a0: .word data_ov069_0221279c
.L_022124a4: .word 0x119a
.L_022124a8: .word data_021052fc
.L_022124ac: .word 0x1da000
.L_022124b0: .word 0x609000
.L_022124b4: .word 0x528000
.L_022124b8: .word data_020c9670
.L_022124bc: .word 0xffffee66
.L_022124c0: .word gSoundContext
.size func_ov069_022119f8, . - func_ov069_022119f8
