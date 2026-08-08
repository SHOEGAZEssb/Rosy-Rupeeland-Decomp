.text

/* Exact fallback; see src/overlays/ov035/overlay035_transition_variant.c for documented portable C. */

    .extern func_02077d4c
    .extern func_02077d5c
    .extern func_02077d6c
    .extern func_ov035_021fd7b0
    .extern func_ov035_021fe88c
    .extern func_02070454
    .extern func_02070464
    .extern func_ov035_021fd128
    .extern func_ov035_021fe8b0


    .global func_ov035_021fe9dc
func_ov035_021fe9dc: 
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    ldr r5, L_021feb60
    mov r1, #0x0
    mov r4, r0
    str r1, [r5, #0x0]
    ldr r3, [r4, #0x30]
    ldr r2, [r4, #0x20]
    ldr r1, [r4, #0x10]
    mov r0, #0x18000
    str r1, [r5, #0x2c]
    str r2, [r5, #0x2c]
    str r3, [r5, #0x2c]
    str r0, [r5, #0x28]
    mov r0, #0x10000
    str r0, [r5, #0x28]
    mov r0, #0x1000
    str r0, [r5, #0x28]
    ldr r7, [r4, #0x9c]
    mov r0, r7
    bl func_02077d4c
    mov r6, r0
    ldr r0, [r4, #0x9c]
    bl func_02077d5c
    mov r5, r0
    mov r0, r7
    bl func_02077d6c
    mov r2, r5
    mov r3, r0
    mov r0, r6
    mov r1, #0x3
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    mov r1, #0x1
    str r1, [sp, #0x8]
    ldr r5, [r7, #0x10]
    ldr r5, [r5, #0xc]
    str r5, [sp, #0xc]
    bl func_ov035_021fd7b0
    ldr r0, [r4, #0x9c]
    ldr r1, [r0, #0x14]
    ldr r5, [r1, #0xc]
    bl func_02077d4c
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
    str r0, [sp, #0x4]
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x14
    bl func_ov035_021fd128
    mov r2, #0x1
    ldr r1, L_021feb64
    rsb r0, r2, #0x8000
    str r2, [r1, #0x0]
    str r0, [r1, #-0x80]
    mov r1, r5
    mov r0, #0x0
    bl func_ov035_021fe8b0
    ldr r2, L_021feb68
    ldr r3, L_021feb6c
    mov r0, r4
    mov r1, r5
    str r2, [r3, #0x0]
    mov r2, #0x0
    str r2, [r3, #0x0]
    bl func_ov035_021fe8b0
    ldr r3, L_021feb70
    ldr r2, L_021feb74
    mov r0, r4
    mov r1, #0x0
    str r3, [r2, #0x0]
    bl func_ov035_021fe8b0
    ldr r0, L_021feb78
    ldr r2, L_021feb74
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
L_021feb60: .word 0x4000444
L_021feb64: .word 0x4000500
L_021feb68: .word 0xff80ff80
L_021feb6c: .word 0x400048c
L_021feb70: .word 0xff800080
L_021feb74: .word 0x4000494
L_021feb78: .word 0x800080
.size func_ov035_021fe9dc, .-func_ov035_021fe9dc

