.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern data_021052fc
.extern data_ov097_0221a4c8
.extern func_0201e0ec
.extern ActorExtendedType2_GetDescriptorValue25
.extern Sound_PlayOwnedEffect
.extern func_020a291c
.extern func_020befec
.extern func_020bf1f8
.extern func_ov097_022177e0
.extern func_ov097_02217afc
.extern gGameWork
.extern gSoundContext
.extern genrand_int32

.global func_ov097_02218940
func_ov097_02218940:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x8
    mov r8, r0
    mov r0, #0x1b
    strh r0, [r8, #0xd6]
    ldr r1, [r8, #0x260]
    add r0, r8, #0x200
    bic r1, r1, #0x20
    str r1, [r8, #0x260]
    ldrsh r0, [r0, #0x98]
    cmp r0, #0x0
    bne .L_02218998
    mov r0, #0x0
    mov r1, #0x100
    str r0, [sp, #0x0]
    ldr r0, .L_02218b0c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r8
    add r1, r1, #0xed
    mov r2, #0x9
    bl Sound_PlayOwnedEffect
.L_02218998:
    add r0, r8, #0x200
    ldrsh r1, [r0, #0x98]
    cmp r1, #0xf0
    bge .L_02218aa4
    mov r1, #0x8
    strb r1, [r8, #0x24c]
    ldr r1, [r8, #0x260]
    orr r1, r1, #0x2
    str r1, [r8, #0x260]
    ldrsh r0, [r0, #0x98]
    cmp r0, #0xa
    bge .L_022189e4
    mov r0, r8
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x1
    ldreq r0, [r8, #0x260]
    biceq r0, r0, #0x8
    streq r0, [r8, #0x260]
    beq .L_022189f0
.L_022189e4:
    ldr r0, [r8, #0x260]
    orr r0, r0, #0x8
    str r0, [r8, #0x260]
.L_022189f0:
    add r0, r8, #0x200
    ldrsh r0, [r0, #0x98]
    cmp r0, #0xc8
    bge .L_02218a88
    mov r1, #0x1e
    bl func_020befec
    cmp r1, #0x0
    bne .L_02218a88
    bl genrand_int32
    ldr r1, .L_02218b10
    ldr r3, [r8, #0x20]
    ldr r1, [r1, #0x0]
    ldr r2, [r8, #0x1c]
    add r1, r1, #0x37c
    mov r5, r0
    add r0, r1, #0x2c00
    mov r6, r3, asr #0xc
    mov r7, r2, asr #0xc
    ldr r10, [r8, #0x24]
    bl func_0201e0ec
    mov r4, r0
    add r0, r8, #0x68
    bl func_ov097_02217afc
    mov r9, r0
    mov r0, r5
    mov r1, #0x24
    bl func_020bf1f8
    mov r3, r5, lsr #0x4
    mov r0, r4
    sub r6, r6, r10, asr #0xc
    and r3, r3, #0xf
    add r2, r9, r9, lsr #0x1f
    sub r3, r6, r3
    sub r4, r7, #0x12
    sub r3, r3, r2, asr #0x1
    add r2, r1, r4
    mov r1, #0x1
    bl func_020a291c
.L_02218a88:
    add r0, r8, #0x200
    ldrsh r2, [r0, #0x98]
    mov r1, #0x3
    add r2, r2, #0x1
    strh r2, [r0, #0x98]
    strh r1, [r8, #0xda]
    b .L_02218b04
.L_02218aa4:
    ldr r1, .L_02218b14
    mov r0, r8
    ldr r3, [r1, #0x10]
    ldr r2, [r1, #0x14]
    mov r1, #0x0
    str r3, [r8, #0x2a4]
    str r2, [r8, #0x2a8]
    strb r1, [r8, #0x2bc]
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x0
    ldr r0, .L_02218b18
    moveq r2, #0x4
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    movne r2, #0x5
    mov r3, r1
    bl func_ov097_022177e0
    add r0, r8, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x98]
    strh r1, [r0, #0xbe]
    mov r0, #0x4
    strh r0, [r8, #0xda]
    strb r1, [r8, #0x24c]
.L_02218b04:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_02218b0c: .word gSoundContext
.L_02218b10: .word data_021052fc
.L_02218b14: .word data_ov097_0221a4c8
.L_02218b18: .word gGameWork
.size func_ov097_02218940, . - func_ov097_02218940
