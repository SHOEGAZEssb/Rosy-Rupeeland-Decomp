.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_02073fc4
.extern func_ov066_0220fe40
.extern func_ov066_02210514

.global func_ov066_02210458
func_ov066_02210458:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r0
    mov r6, r2
    mov r5, r3
    bl func_ov066_02210514
    mov r1, #0x0
    mov r2, r1
    add r0, r4, #0xc
    bl func_ov066_0220fe40
    smull r1, r0, r6, r6
    adds r1, r1, #0x800
    mov r7, r1, lsr #0xc
    adc r0, r0, #0x0
    orr r7, r7, r0, lsl #0x14
    ldr ip, .L_02210510
    str r6, [r4, #0x18]
    mov lr, #0x0
    umull r9, r8, r7, ip
    mov r0, r5
    mla r8, r7, lr, r8
    mov r6, r7, asr #0x1f
    adds r7, r9, #0x800
    mla r8, r6, ip, r8
    adc r6, r8, #0x0
    mov r7, r7, lsr #0xc
    orr r7, r7, r6, lsl #0x14
    ldr r1, [sp, #0x20]
    ldr r2, [sp, #0x24]
    ldr r3, [sp, #0x28]
    mov r5, #0x1
    str r7, [r4, #0x1c]
    str r5, [sp, #0x0]
    bl func_02073fc4
    ldr r1, [sp, #0x2c]
    str r0, [r4, #0x20]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r3, [r4, #0x20]
    mov r2, #0x0
    ldrh r1, [r3, #0x24]
    mov r0, r4
    orr r1, r1, #0xa
    strh r1, [r3, #0x24]
    ldr r1, [r4, #0x20]
    strb r2, [r1, #0x3a]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02210510: .word 0x3244
.size func_ov066_02210458, . - func_ov066_02210458
