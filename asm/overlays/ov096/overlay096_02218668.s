.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern data_020e6e68
.extern func_02005070
.extern ActorExtendedType2_GetDescriptorValue2A
.extern func_020593dc
.extern func_ov096_02218590
.extern func_ov096_0221880c
.extern func_ov096_0221881c
.extern gSoundContext

.global func_ov096_02218668
func_ov096_02218668:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_ov096_02218590
    cmp r0, #0x0
    bne .L_022186a4
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r6, #0x29c
    strh r1, [r6, #0xda]
    bl func_ov096_0221880c
    b .L_022187f4
.L_022186a4:
    ldrsh r0, [r6, #0xda]
    cmp r0, #0x0
    bne .L_02218718
    mov r0, r6
    bl func_ov096_0221881c
    cmp r0, #0x0
    beq .L_02218700
    mov r0, #0x1
    strh r0, [r6, #0xda]
    add r1, r6, #0x200
    mov r3, #0x0
    strh r3, [r1, #0xac]
    ldrh r2, [r1, #0xae]
    add r0, r6, #0x29c
    bic r2, r2, #0x1
    strh r2, [r1, #0xae]
    ldr r1, [r5, #0x0]
    ldr r2, [r4, #0x0]
    bl func_ov096_0221880c
    mov r0, r6
    bl ActorExtendedType2_GetDescriptorValue2A
    mov r0, r0, lsl #0x4
    str r0, [r6, #0x44]
.L_02218700:
    add r1, r6, #0x200
    ldrh r2, [r1, #0xae]
    ldr r0, .L_022187fc
    and r0, r2, r0
    strh r0, [r1, #0xae]
    b .L_022187f4
.L_02218718:
    add r1, r6, #0x200
    ldrsh r2, [r1, #0xac]
    mov r0, r6
    add r2, r2, #0x1
    strh r2, [r1, #0xac]
    ldr r1, [r6, #0x2a0]
    str r1, [r5, #0x0]
    ldr r1, [r6, #0x2a4]
    str r1, [r4, #0x0]
    bl func_ov096_0221881c
    cmp r0, #0x0
    beq .L_022187c4
    ldr r0, [r5, #0x0]
    add r1, r6, #0x200
    mov r0, r0, lsl #0x2
    str r0, [r5, #0x0]
    ldr r0, [r4, #0x0]
    mov r0, r0, lsl #0x2
    str r0, [r4, #0x0]
    ldrh r3, [r1, #0xae]
    mov r0, r3, lsl #0x10
    movs r0, r0, lsr #0x11
    bne .L_022187c4
    ldr r0, .L_022187fc
    ldr r2, .L_02218800
    and r3, r3, r0
    orr r3, r3, #0x2
    strh r3, [r1, #0xae]
    ldrh r1, [r6, #0x4e]
    mov r1, r1, lsl #0x1
    ldrh r2, [r2, r1]
    cmp r2, r0, lsr #0x10
    beq .L_022187c4
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, #0x100
    ldr r0, .L_02218804
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r6
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl func_020593dc
.L_022187c4:
    add r0, r6, #0x29c
    bl func_02005070
    ldr r1, .L_02218808
    cmp r0, r1
    bge .L_022187f4
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r6, #0x29c
    bl func_ov096_0221880c
    mov r0, #0x0
    strh r0, [r6, #0xda]
.L_022187f4:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_022187fc: .word 0xffff0001
.L_02218800: .word data_020e6e68
.L_02218804: .word gSoundContext
.L_02218808: .word 0x333
.size func_ov096_02218668, . - func_ov096_02218668
