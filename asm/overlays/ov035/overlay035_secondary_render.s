.text

/* Exact fallback; see src/overlays/ov035/overlay035_secondary_render.c for documented portable C. */

    .extern Graphics3DSceneState_Apply
    .extern func_ov035_021fe9dc
    .extern func_ov035_021fe6e4
    .extern GraphicsAnimationInstanceManager_Render
    .extern func_ov035_021fd7b0
    .extern func_ov035_021fcfa0
    .extern func_ov035_021fd128
    .extern func_ov035_021fda24


    .global func_ov035_021ff3bc
func_ov035_021ff3bc: 
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r0, r5, #0xc
    bl Graphics3DSceneState_Apply
    ldr r0, [r5, #0x140]
    bl func_ov035_021fe9dc
    ldr r0, [r5, #0x13c]
    add r1, r5, #0x64
    bl func_ov035_021fe6e4
    ldr r0, [r5, #0xf8]
    add r1, r5, #0x64
    bl GraphicsAnimationInstanceManager_Render
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    bl func_ov035_021fd7b0
    ldr r4, [r5, #0x120]
    b L_021ff42c
L_021ff41c:
    mov r0, r4
    add r1, r5, #0x64
    bl func_ov035_021fcfa0
    ldr r4, [r4, #0x8]
L_021ff42c:
    cmp r4, #0x0
    bne L_021ff41c
    mov r1, #0x1f
    mov r0, #0x0
    str r1, [sp, #0x0]
    mov r1, r0
    str r0, [sp, #0x4]
    mov r2, #0x3
    mov r3, #0x16
    bl func_ov035_021fd128
    ldr r4, [r5, #0x130]
    b L_021ff468
L_021ff45c:
    mov r0, r4
    bl func_ov035_021fda24
    ldr r4, [r4, #0x8]
L_021ff468:
    cmp r4, #0x0
    bne L_021ff45c
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov035_021ff3bc, .-func_ov035_021ff3bc

