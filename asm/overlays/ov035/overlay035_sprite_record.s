.text

/* Exact fallback; see src/overlays/ov035/overlay035_sprite_record.c for documented portable C. */

    .extern func_02095308
    .extern GraphicsAnimationInstance_SetAnimation
    .extern data_ov035_02203af8


    .global func_ov035_021fdce8
func_ov035_021fdce8: 
    ldr r2, L_021fdd04
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0xc]
    bx lr
L_021fdd04: .word data_ov035_02203af8
.size func_ov035_021fdce8, .-func_ov035_021fdce8

    .global func_ov035_021fdd08

func_ov035_021fdd08: 
    stmdb sp!, {r4, lr}
    ldr r1, L_021fdd24
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02095308
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fdd24: .word data_ov035_02203af8
.size func_ov035_021fdd08, .-func_ov035_021fdd08

    .global func_ov035_021fdd28

func_ov035_021fdd28: 
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r6, r2
    and r1, r1, #0xff
    mov r5, r3
    bl GraphicsAnimationInstance_SetAnimation
    str r6, [r4, #0x20]
    ldr r0, [sp, #0x18]
    ldr r2, [sp, #0x10]
    str r5, [r4, #0x24]
    ldr r1, [sp, #0x14]
    str r2, [r4, #0x28]
    strb r1, [r4, #0x5a]
    ldrh r1, [r4, #0x50]
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    strh r0, [r4, #0x50]
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov035_021fdd28, .-func_ov035_021fdd28

    .global func_ov035_021fdd70

func_ov035_021fdd70: 
    stmib r0, {r1, r2, r3}
    bx lr
.size func_ov035_021fdd70, .-func_ov035_021fdd70

    .global func_ov035_021fdd78

func_ov035_021fdd78: 
    str r1, [r0, #0x10]
    str r2, [r0, #0x14]
    str r3, [r0, #0x18]
    bx lr
.size func_ov035_021fdd78, .-func_ov035_021fdd78

