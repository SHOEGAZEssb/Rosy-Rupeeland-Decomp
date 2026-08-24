.text

/* Exact fallback; see src/overlays/ov027/overlay027_sprite_runtime.c. */
.extern gFx32CosSinTable
.extern GraphicsAnimationInstance_SetAnimation
.extern PresentationScalar_SetImmediate
.extern Presentation_InterpolateScalar
.extern func_020ae024


    .global func_ov027_021fd4dc
func_ov027_021fd4dc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    ldr r3, [r6, #0xa4]
    mov r5, r1
    mov r4, r2
    mov r1, #0x1
    mov r2, #0x0
    bl Presentation_InterpolateScalar
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr lr, L_021fd620
    mov r1, r1, lsl #0x1
    mov ip, r0, lsl #0x1
    mov r0, r6
    mov r2, r5
    mov r3, r4
    ldrsh r4, [lr, r1]
    mov r1, #0x1
    ldrsh r5, [lr, ip]
    bl Presentation_InterpolateScalar
    ldr lr, [r6, #0xb4]
    ldr ip, [r6, #0xb0]
    mul r3, r4, lr
    rsb r2, r4, #0x0
    mul r1, r2, ip
    mul r4, r5, ip
    mul ip, r5, lr
    mov r2, r3, asr #0xb
    add r3, r3, r2, lsr #0x14
    mov r2, r4, asr #0xb
    add r2, r4, r2, lsr #0x14
    mov r4, ip, asr #0xb
    add r5, ip, r4, lsr #0x14
    mov r4, r3, asr #0xc
    mov r3, r1, asr #0xb
    add r2, r4, r2, asr #0xc
    mov r4, r0
    add r0, r1, r3, lsr #0x14
    mov r1, r5, asr #0xc
    mul r2, r4, r2
    add r0, r1, r0, asr #0xc
    mul r3, r4, r0
    ldr r1, [r6, #0xa0]
    mov r0, r2, asr #0x7
    add r2, r2, r0, lsr #0x18
    ldr r1, [r1, #0x4]
    mov r0, r3, asr #0x7
    add r5, r3, r0, lsr #0x18
    add r0, r6, #0xc
    add r1, r1, r2, asr #0x8
    mov r7, r2, asr #0x8
    mov r8, r5, asr #0x8
    bl PresentationScalar_SetImmediate
    add r0, r6, #0x1c
    ldr r1, [r6, #0xa0]
    ldr r1, [r1, #0x8]
    add r1, r1, r5, asr #0x8
    bl PresentationScalar_SetImmediate
    cmp r4, #0x20
    bge L_021fd5f4
    ldr r0, [r6, #0x9c]
    ldrb r1, [r0, #0x54]
    cmp r1, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r1, #0x4
    bl GraphicsAnimationInstance_SetAnimation
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fd5f4:
    mov r0, r7
    mov r1, r8
    bl func_020ae024
    mov r2, r0, lsr #0xd
    ldr r0, [r6, #0x9c]
    ldrb r1, [r0, #0x54]
    cmp r2, r1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    and r1, r2, #0xff
    bl GraphicsAnimationInstance_SetAnimation
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fd620: .word gFx32CosSinTable
.size func_ov027_021fd4dc, .-func_ov027_021fd4dc

