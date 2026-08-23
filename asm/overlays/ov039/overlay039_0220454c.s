.text
/* Exact fallback; see overlay039_resource_objects.c for portable C. */
    .extern RuntimePresentationManager_GetGraphics3dPresentation
    .extern VecFx32Object_InitComponents
    .extern VecFx32Object_Init
    .extern func_0209c430
    .extern VecFx32Object_Destroy
    .extern data_021052fc
    .global func_ov039_0220454c
func_ov039_0220454c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xb4
    ldr r1, L_02204824
    mov r10, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, #0x3
    mov r7, r0
    sub r9, r1, #0x1
L_02204578:
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x9c]
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    beq L_02204814
    mov r0, #0x80000
    mov r6, #0x0
    mvn r11, #0x13
    str r0, [sp, #0x84]
    mov r1, #0x1000
    mov r4, #0xc0000
    add r5, sp, #0x8c
    mov r3, #0x40000
    add r2, sp, #0x9c
    mov r0, #0x100000
    str r0, [r2, #0x0]
    str r3, [r2, #0x4]
    str r3, [r5, #0x4]
    add ip, sp, #0x94
    add r8, sp, #0xac
    mov lr, #0x14
    add r0, sp, #0x74
    mov r2, r1
    mov r3, r1
    str r4, [r5, #0x0]
    str r6, [sp, #0x88]
    str r11, [sp, #0xa4]
    str r11, [sp, #0xa8]
    str lr, [r8, #0x0]
    str lr, [r8, #0x4]
    stmia ip, {r4, r6}
    bl VecFx32Object_InitComponents
    add r0, sp, #0x64
    bl VecFx32Object_Init
    add r3, r10, r9, lsl #0x2
    ldr r0, [r3, #0x9c]
    mov r1, r6
    ldr r2, [r0, #0x10]
    mov r0, #0xc8
    str r2, [sp, #0x68]
    ldr r2, [r3, #0x9c]
    ldr r2, [r2, #0x14]
    str r2, [sp, #0x6c]
    str r1, [sp, #0x70]
    ldr r1, [r3, #0x9c]
    ldr r1, [r1, #0x4]
    mul r0, r1, r0
    add r0, r0, #0x400
    cmp r0, #0x1000
    movgt r0, #0x1000
    str r0, [sp, #0x78]
    str r0, [sp, #0x7c]
    add r0, r10, r9, lsl #0x2
    ldr r2, [r0, #0x9c]
    add r1, sp, #0xa4
    str r1, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r2, #0x4]
    add r1, sp, #0x84
    and r0, r0, #0x2
    add r1, r1, r0, lsl #0x3
    str r1, [sp, #0x8]
    ldr r0, L_02204828
    add r1, sp, #0x64
    str r0, [sp, #0xc]
    mov r0, #0xc8
    str r0, [sp, #0x10]
    ldr r0, [r2, #0x24]
    add r2, sp, #0x74
    mov r3, r0, lsl #0x10
    mov r0, r7
    mov r3, r3, lsr #0x10
    bl func_0209c430
    mov r0, #0x8
    mvn r5, #0xc
    sub r8, r0, #0x1
    add r6, r10, r9, lsl #0x2
    mov r4, r5, lsr #0x11
    add r11, sp, #0x5c
L_022046b8:
    ldr r0, [r6, #0x9c]
    add r0, r0, r8, lsl #0x2
    ldr r0, [r0, #0x28]
    cmp r0, #0x0
    beq L_022047fc
    mov r0, #0xd
    str r0, [r11, #0x0]
    str r0, [r11, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x34]
    mov r0, #0x40000
    str r0, [sp, #0x38]
    mov r1, #0xa0000
    add r0, sp, #0x3c
    str r1, [r0, #0x0]
    mov r1, #0x60000
    str r1, [r0, #0x4]
    mov r1, #0xa0000
    add r0, sp, #0x44
    str r1, [r0, #0x0]
    mov r1, #0x40000
    str r1, [r0, #0x4]
    mov r1, #0xc0000
    add r0, sp, #0x4c
    str r1, [r0, #0x0]
    mov r1, #0x60000
    str r1, [r0, #0x4]
    mov r1, #0x1000
    add r0, sp, #0x24
    mov r2, r1
    mov r3, r1
    str r5, [sp, #0x54]
    str r5, [sp, #0x58]
    bl VecFx32Object_InitComponents
    add r0, sp, #0x14
    bl VecFx32Object_Init
    mov r0, #0xc
    mul r1, r8, r0
    ldr r0, [r6, #0x9c]
    add r0, r0, r1
    ldr r0, [r0, #0x8c]
    str r0, [sp, #0x18]
    ldr r0, [r6, #0x9c]
    add r0, r0, r1
    ldr r0, [r0, #0x90]
    str r0, [sp, #0x1c]
    mov r0, #0x0
    str r0, [sp, #0x20]
    ldr r0, [r6, #0x9c]
    ldr r1, [r0, #0x4]
    mov r0, #0xc8
    mul r0, r1, r0
    add r0, r0, #0x400
    cmp r0, #0x1000
    movgt r0, #0x1000
    str r0, [sp, #0x28]
    str r0, [sp, #0x2c]
    ldr r2, [r6, #0x9c]
    add r1, sp, #0x54
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r3, [r2, #0x4]
    mov r0, r7
    and ip, r3, #0x2
    add r3, sp, #0x34
    add r3, r3, ip, lsl #0x3
    str r3, [sp, #0x8]
    str r4, [sp, #0xc]
    mov r3, #0xc8
    str r3, [sp, #0x10]
    ldr r3, [r2, #0x24]
    add r1, sp, #0x14
    mov r3, r3, lsl #0x10
    add r2, sp, #0x24
    mov r3, r3, lsr #0x10
    bl func_0209c430
    add r0, sp, #0x14
    bl VecFx32Object_Destroy
    add r0, sp, #0x24
    bl VecFx32Object_Destroy
L_022047fc:
    subs r8, r8, #0x1
    bpl L_022046b8
    add r0, sp, #0x64
    bl VecFx32Object_Destroy
    add r0, sp, #0x74
    bl VecFx32Object_Destroy
L_02204814:
    subs r9, r9, #0x1
    bpl L_02204578
    add sp, sp, #0xb4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02204824: .word data_021052fc
L_02204828: .word 0x7fff
    .size func_ov039_0220454c, .-func_ov039_0220454c

