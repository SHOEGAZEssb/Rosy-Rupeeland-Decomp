.text
/* Exact fallback; see overlay039_helper_pool2.c for portable C. */
    .extern VecFx32Object_InitComponents
    .extern VecFx32Object_Init
    .extern RuntimePresentationManager_GetGraphics3dPresentation
    .extern func_0209c430
    .extern VecFx32Object_Destroy
    .extern gGamePhaseRuntime
    .global func_ov039_02203794
func_ov039_02203794:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x84
    mov r1, #0xa
    mvn r8, #0x7
    mov r10, r0
    sub r9, r1, #0x1
    mov r4, r8, lsr #0x11
    add r7, sp, #0x6c
    mov r6, #0x8
    mov r11, #0x18000
    mov r5, #0x0
L_022037c0:
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x74]
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    bne L_02203908
    mov r1, #0x1000
    add r0, sp, #0x74
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    mov r1, #0x28000
    add r0, sp, #0x2c
    str r1, [r0, #0x0]
    mov r1, #0x10000
    str r1, [r0, #0x4]
    str r11, [sp, #0x24]
    str r5, [sp, #0x28]
    mov r1, #0x28000
    add r0, sp, #0x34
    stmia r0, {r1, r5}
    mov r1, #0x38000
    add r0, sp, #0x3c
    str r1, [r0, #0x0]
    mov r1, #0x10000
    str r1, [r0, #0x4]
    mov r1, #0x38000
    add r0, sp, #0x44
    stmia r0, {r1, r5}
    mov r1, #0x48000
    add r0, sp, #0x4c
    str r1, [r0, #0x0]
    mov r1, #0x10000
    str r1, [r0, #0x4]
    mov r1, #0x48000
    add r0, sp, #0x54
    stmia r0, {r1, r5}
    mov r1, #0x58000
    add r0, sp, #0x5c
    str r1, [r0, #0x0]
    mov r1, #0x10000
    str r1, [r0, #0x4]
    add r0, sp, #0x14
    str r8, [sp, #0x64]
    str r8, [sp, #0x68]
    str r6, [r7, #0x0]
    str r6, [r7, #0x4]
    bl VecFx32Object_Init
    add r0, r10, r9, lsl #0x2
    ldr r2, [r0, #0x74]
    ldr r1, L_02203918
    ldr r2, [r2, #0x4]
    ldr r1, [r1, #0x0]
    str r2, [sp, #0x18]
    ldr r2, [r0, #0x74]
    add r1, r1, #0x37c
    add r0, r1, #0x2c00
    ldr r1, [r2, #0x8]
    str r1, [sp, #0x1c]
    mov r1, #0x0
    str r1, [sp, #0x20]
    bl RuntimePresentationManager_GetGraphics3dPresentation
    add r1, sp, #0x64
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    add r1, r10, r9, lsl #0x2
    ldr r2, [r1, #0x74]
    add r1, sp, #0x14
    ldr r3, [r2, #0x1c]
    add r2, sp, #0x74
    and ip, r3, #0x6
    add r3, sp, #0x24
    add r3, r3, ip, lsl #0x3
    str r3, [sp, #0x8]
    str r4, [sp, #0xc]
    mov r3, #0x0
    str r3, [sp, #0x10]
    bl func_0209c430
    add r0, sp, #0x14
    bl VecFx32Object_Destroy
    add r0, sp, #0x74
    bl VecFx32Object_Destroy
L_02203908:
    subs r9, r9, #0x1
    bpl L_022037c0
    add sp, sp, #0x84
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02203918: .word gGamePhaseRuntime
    .size func_ov039_02203794, .-func_ov039_02203794

