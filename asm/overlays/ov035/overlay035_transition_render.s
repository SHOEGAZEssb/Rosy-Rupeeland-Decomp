.text

/* Exact fallback; see src/overlays/ov035/overlay035_transition_render.c for documented portable C. */

    .extern func_020b00f0
    .extern Graphics3DResourceBinding_GetTextureFormat
    .extern Graphics3DResourceBinding_GetTextureWidthClass
    .extern Graphics3DResourceBinding_GetTextureHeightClass
    .extern func_ov035_021fd7b0
    .extern func_ov035_021fe88c
    .extern func_02070454
    .extern func_02070464
    .extern func_ov035_021fd128
    .extern func_ov035_021fe8b0


    .global func_ov035_021fe6e4
func_ov035_021fe6e4: 
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    ldr r6, L_021fe874
    mov r2, #0x0
    mov r4, r0
    str r2, [r6, #0x0]
    ldr r5, [r4, #0x30]
    ldr r3, [r4, #0x20]
    ldr r2, [r4, #0x10]
    mov r0, r1
    str r2, [r6, #0x2c]
    str r3, [r6, #0x2c]
    str r5, [r6, #0x2c]
    bl func_020b00f0
    ldr r0, [r4, #0x70]
    add r1, r6, #0x28
    mov r0, r0, lsl #0x4
    str r0, [r1, #0x0]
    str r0, [r1, #0x0]
    mov r0, #0x1000
    str r0, [r1, #0x0]
    ldr r7, [r4, #0x9c]
    mov r0, r7
    bl Graphics3DResourceBinding_GetTextureFormat
    mov r6, r0
    ldr r0, [r4, #0x9c]
    bl Graphics3DResourceBinding_GetTextureWidthClass
    mov r5, r0
    mov r0, r7
    bl Graphics3DResourceBinding_GetTextureHeightClass
    mov r1, #0x3
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r2, r5
    ldr r5, [r7, #0x10]
    mov r3, r0
    ldr r5, [r5, #0xc]
    mov r0, r6
    mov r1, #0x1
    str r5, [sp, #0xc]
    bl func_ov035_021fd7b0
    ldr r0, [r4, #0x9c]
    ldr r1, [r0, #0x14]
    ldr r5, [r1, #0xc]
    bl Graphics3DResourceBinding_GetTextureFormat
    mov r1, r0
    mov r0, r5
    bl func_ov035_021fe88c
    ldr r0, [r4, #0x9c]
    ldr r0, [r0, #0x4]
    bl func_02070454
    ldr r1, [r4, #0x9c]
    mov r4, r0, lsl #0xc
    ldr r0, [r1, #0x4]
    bl func_02070464
    mov r5, r0, lsl #0xc
    mov r0, #0x1f
    str r0, [sp, #0x0]
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x13
    str r0, [sp, #0x4]
    bl func_ov035_021fd128
    ldr r3, L_021fe878
    mov r0, #0x1
    str r0, [r3, #0x0]
    rsb r2, r0, #0x8000
    mov r1, r5
    mov r0, #0x0
    str r2, [r3, #-0x80]
    bl func_ov035_021fe8b0
    ldr r2, L_021fe87c
    ldr r3, L_021fe880
    mov r0, r4
    mov r1, r5
    str r2, [r3, #0x0]
    mov r2, #0x0
    str r2, [r3, #0x0]
    bl func_ov035_021fe8b0
    ldr r2, L_021fe884
    mov r3, #0x80
    mov r0, r4
    mov r1, #0x0
    str r3, [r2, #0x0]
    bl func_ov035_021fe8b0
    ldr r0, L_021fe888
    ldr r2, L_021fe884
    mov r1, #0x0
    str r0, [r2, #0x0]
    str r1, [r2, #-0xc]
    add r0, r0, #0xff00
    str r0, [r2, #0x0]
    str r1, [r2, #0x70]
    mov r0, #0x1
    str r0, [r2, #-0x4c]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fe874: .word 0x4000444
L_021fe878: .word 0x4000500
L_021fe87c: .word 0xff80
L_021fe880: .word 0x400048c
L_021fe884: .word 0x4000494
L_021fe888: .word 0x1000080
.size func_ov035_021fe6e4, .-func_ov035_021fe6e4

