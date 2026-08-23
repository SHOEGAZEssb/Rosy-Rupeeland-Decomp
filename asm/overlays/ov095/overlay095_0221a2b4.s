.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_021052fc
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern Sound_PlayOwnedEffect
.extern Graphics3dPresentation_CreatePreset28To29PointSpriteEffectAt
.extern func_020befec
.extern func_020bf1f8
.extern func_ov095_02217d90
.extern gSoundContext
.extern genrand_int32

.global func_ov095_0221a2b4
func_ov095_0221a2b4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x8
    mov r8, r0
    ldr r1, [r8, #0x260]
    add r0, r8, #0x200
    orr r1, r1, #0x3
    orr r1, r1, #0x1000
    orr r1, r1, #0x8
    str r1, [r8, #0x260]
    ldrsh r0, [r0, #0x98]
    cmp r0, #0x0
    bne .L_0221a30c
    mov r0, #0x0
    mov r1, #0x200
    str r0, [sp, #0x0]
    ldr r0, .L_0221a3f0
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r8
    sub r1, r1, #0x12
    mov r2, #0x7
    bl Sound_PlayOwnedEffect
.L_0221a30c:
    add r0, r8, #0x200
    ldrsh r1, [r0, #0x98]
    cmp r1, #0x3c
    bge .L_0221a3d8
    ldr r1, [r8, #0x260]
    orr r1, r1, #0x2
    orr r1, r1, #0x400
    orr r1, r1, #0x8
    str r1, [r8, #0x260]
    ldrsh r0, [r0, #0x98]
    cmp r0, #0x2d
    bge .L_0221a3c4
    mov r1, #0xa
    bl func_020befec
    cmp r1, #0x0
    bne .L_0221a3c4
    bl genrand_int32
    ldr r1, .L_0221a3f4
    ldr r3, [r8, #0x20]
    ldr r1, [r1, #0x0]
    ldr r2, [r8, #0x1c]
    add r1, r1, #0x37c
    mov r5, r0
    add r0, r1, #0x2c00
    mov r6, r3, asr #0xc
    mov r7, r2, asr #0xc
    ldr r10, [r8, #0x24]
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r4, r0
    add r0, r8, #0x68
    bl func_ov095_02217d90
    mov r9, r0
    mov r0, r5
    mov r1, #0x18
    bl func_020bf1f8
    mov r3, r5, lsr #0x4
    mov r0, r4
    sub r6, r6, r10, asr #0xc
    and r3, r3, #0xf
    add r2, r9, r9, lsr #0x1f
    sub r3, r6, r3
    sub r4, r7, #0xc
    sub r3, r3, r2, asr #0x1
    add r2, r1, r4
    mov r1, #0x1
    bl Graphics3dPresentation_CreatePreset28To29PointSpriteEffectAt
.L_0221a3c4:
    add r0, r8, #0x200
    ldrsh r1, [r0, #0x98]
    add r1, r1, #0x1
    strh r1, [r0, #0x98]
    b .L_0221a3e8
.L_0221a3d8:
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x200]
    blx r1
.L_0221a3e8:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_0221a3f0: .word gSoundContext
.L_0221a3f4: .word data_021052fc
.size func_ov095_0221a2b4, . - func_ov095_0221a2b4
