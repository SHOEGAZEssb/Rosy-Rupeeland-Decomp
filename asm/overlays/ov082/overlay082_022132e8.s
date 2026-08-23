.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern data_021052fc
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern ActorExtendedType2_GetDescriptorValue2C
.extern ActorExtendedType2_GetDescriptorValue25
.extern Sound_PlayOwnedEffect
.extern func_020a28e0
.extern func_020bf1f8
.extern func_ov082_0221340c
.extern gSoundContext
.extern genrand_int32

.global func_ov082_022132e8
func_ov082_022132e8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x1
    bne .L_022133fc
    mov r0, r10
    bl func_ov082_0221340c
    cmp r0, #0x0
    beq .L_022133fc
    ldr r0, .L_02213404
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    ldr r2, [r10, #0x24]
    ldr r1, [r10, #0x1c]
    ldr r3, [r10, #0x20]
    mov r2, r2, asr #0xc
    mov r1, r1, asr #0xc
    mov r6, r0
    rsb r8, r2, r3, asr #0xc
    sub r9, r1, #0xc
    mov r7, #0x0
    mov r11, #0x18
    mov r4, #0x3c
.L_02213350:
    bl genrand_int32
    mov r5, r0
    mov r1, r11
    bl func_020bf1f8
    mov r0, r5, lsr #0x4
    and r0, r0, #0xf
    sub r3, r8, r0
    add r2, r9, r1
    mov r0, r6
    mov r1, #0x1
    str r4, [sp, #0x0]
    bl func_020a28e0
    add r7, r7, #0x1
    cmp r7, #0x5
    blt .L_02213350
    mov r0, r10
    bl ActorExtendedType2_GetDescriptorValue2C
    cmp r0, #0x0
    beq .L_022133a8
    cmp r0, #0x1
    beq .L_022133d4
    b .L_022133fc
.L_022133a8:
    mov r0, #0x0
    mov r1, #0x100
    str r0, [sp, #0x0]
    ldr r0, .L_02213408
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r10
    add r1, r1, #0xd6
    mov r2, #0x2
    bl Sound_PlayOwnedEffect
    b .L_022133fc
.L_022133d4:
    mov r0, #0x0
    mov r1, #0x100
    str r0, [sp, #0x0]
    ldr r0, .L_02213408
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r10
    add r1, r1, #0xe3
    mov r2, #0x3
    bl Sound_PlayOwnedEffect
.L_022133fc:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02213404: .word data_021052fc
.L_02213408: .word gSoundContext
.size func_ov082_022132e8, . - func_ov082_022132e8
