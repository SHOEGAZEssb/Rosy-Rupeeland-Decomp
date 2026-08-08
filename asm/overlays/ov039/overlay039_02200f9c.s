.text
/* Exact fallback; see overlay039_scene_lifecycle.c for portable C. */
    .extern func_0209a208
    .extern func_ov039_02201234
    .extern func_02072b68
    .extern data_ov039_02208138
    .global func_ov039_02200f9c
func_ov039_02200f9c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x28
    ldr r5, L_02201108
    add r4, sp, #0x8
    mov r10, r0
    mov r9, r1
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r5, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    ldr r1, L_0220110c
    str r9, [sp, #0x0]
    mov r0, #0x1
    str r0, [sp, #0x4]
    mov r0, r10
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0x4c]
    mov r0, #0x1
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r1, [r10, #0x4c]
    mov r0, r10
    mov r2, #0x200000
    mov r3, #0x118000
    bl func_ov039_02201234
    mov r0, #0x8
    mov r7, #0x1
    ldr r1, [r10, #0x4c]
    mov r2, #0xa
    str r2, [r1, #0x44]
    ldr r1, [r10, #0x4c]
    sub r8, r0, #0x1
    ldrh r0, [r1, #0x42]
    ldr r6, L_02201110
    mov r5, r7
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    mov r11, #0x200000
    add r4, sp, #0x8
L_02201040:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r6
    add r2, r6, #0x1
    add r3, r6, #0x2
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x50]
    str r5, [sp, #0x0]
    str r5, [sp, #0x4]
    ldr r1, [r1, #0x50]
    mov r0, r10
    mov r2, r11
    mov r3, #0x118000
    bl func_ov039_02201234
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0x50]
    and r1, r8, #0xff
    ldr r0, [r0, #0xc]
    bl func_02072b68
    add r1, r10, r8, lsl #0x2
    ldr r2, [r4, r8, lsl #0x2]
    ldr r0, [r1, #0x50]
    subs r8, r8, #0x1
    str r2, [r0, #0x44]
    ldr r1, [r1, #0x50]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    bpl L_02201040
    ldr r1, L_02201114
    str r9, [sp, #0x0]
    mov r2, #0x2
    mov r0, r10
    str r2, [sp, #0x4]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0x70]
    mov r0, #0x1
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r1, [r10, #0x70]
    mov r0, r10
    mov r2, #0x200000
    mov r3, #0x118000
    bl func_ov039_02201234
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02201108: .word data_ov039_02208138
L_0220110c: .word 0x128b
L_02201110: .word 0x128e
L_02201114: .word 0x13bd
    .size func_ov039_02200f9c, .-func_ov039_02200f9c

