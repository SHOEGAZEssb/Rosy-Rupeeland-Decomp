.text

/* Exact fallback; see src/overlays/ov035/overlay035_tertiary_render.c for documented portable C. */

    .extern Graphics3DSceneState_Apply
    .extern func_ov045_0220bc3c
    .extern GraphicsAnimationInstanceManager_Render


    .global func_ov035_021ffe44
func_ov035_021ffe44: 
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    add r0, r4, #0xc
    bl Graphics3DSceneState_Apply
    mov ip, #0x0
    mvn r0, #0x3f
    str r0, [sp, #0x0]
    mov r0, #0x4000
    str r0, [sp, #0x4]
    sub r0, ip, #0x90
    sub r1, ip, #0xa0
    sub r2, ip, #0x20
    mov r3, #0x140
    str ip, [sp, #0x8]
    bl func_ov045_0220bc3c ; func_ov048_0220bc3c
    mvn r0, #0x3f
    mov r2, #0x20
    str r0, [sp, #0x0]
    mov r0, #0x4000
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    sub r3, r2, #0xc0
    mov r0, #0x90
    mov r1, #0x140
    bl func_ov045_0220bc3c ; func_ov048_0220bc3c
    ldr r0, [r4, #0x124]
    add r1, r4, #0x64
    bl GraphicsAnimationInstanceManager_Render
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.size func_ov035_021ffe44, .-func_ov035_021ffe44

