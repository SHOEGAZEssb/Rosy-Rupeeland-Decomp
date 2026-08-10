.text

/* Exact fallback; see src/overlays/ov027/overlay027_scene_render.c. */
.extern func_020773e4
.extern Graphics3DSceneState_Apply
.extern func_020b0558
.extern func_ov027_021fcefc
.extern func_ov027_021fd0b0
.extern func_ov027_021fd834
.extern func_ov043_0220b9bc
.extern func_ov048_0220bad4


    .global func_ov027_021fe0f8
func_ov027_021fe0f8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, r4, #0x198
    bl func_ov043_0220b9bc ; func_ov048_0220b9bc
    cmp r0, #0x0
    mov r0, #0x0
    streq r0, [r4, #0x10c]
    moveq r0, #0xc00
    strne r0, [r4, #0x10c]
    str r0, [r4, #0x110]
    bl func_020b0558
    ldr r2, L_021fe1bc
    ldr r1, L_021fe1c0
    mov r0, #0x0
    str r2, [r1, #0x0]
    str r0, [r1, #-0x7c]
    add r0, r4, #0x80
    bl Graphics3DSceneState_Apply
    ldr r0, [r4, #0x114]
    bl func_ov027_021fcefc
    ldr r0, [r4, #0x58]
    add r1, r4, #0xd8
    bl func_020773e4
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    bl func_ov027_021fd0b0
    ldr r5, [r4, #0x154]
    b L_021fe190
L_021fe184:
    mov r0, r5
    bl func_ov027_021fd834
    ldr r5, [r5, #0x8]
L_021fe190:
    cmp r5, #0x0
    bne L_021fe184
    ldr r2, L_021fe1c4
    mov r0, #0x1
    str r0, [r2, #0x0]
    mov r1, #0x0
    add r0, r4, #0x198
    str r1, [r2, #0xf8]
    bl func_ov048_0220bad4
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
L_021fe1bc: .word 0x7f107fff
L_021fe1c0: .word 0x40004c0
L_021fe1c4: .word 0x4000448
.size func_ov027_021fe0f8, .-func_ov027_021fe0f8

