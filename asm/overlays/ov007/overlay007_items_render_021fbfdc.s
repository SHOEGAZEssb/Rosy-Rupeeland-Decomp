    .text
    .extern func_0209a2ac
    .extern VecFx32Object_InitCopy
    .extern genrand_int32
    .extern VecFx32Object_InitComponents
    .extern VecFx32Object_Assign
    .extern VecFx32Object_Destroy

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov007/overlay007_items_render.c. */
    .global func_ov007_021fbfdc
func_ov007_021fbfdc: ; 0x021fbfdc
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x20
    mov r4, r0
    ldr r1, [r4, #0x4c]
    cmp r1, #0x0
    beq L_021fc0d4
    mov r1, #0x0
    mov r2, #0x1
    bl func_0209a2ac
    add r0, sp, #0x10
    add r1, r4, #0x80
    bl VecFx32Object_InitCopy
    ldrb r0, [r4, #0xa1]
    cmp r0, #0x0
    beq L_021fc048
    bl genrand_int32
    and r0, r0, #0x7
    ldr r1, [sp, #0x14]
    sub r0, r0, #0x4
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x14]
    bl genrand_int32
    and r0, r0, #0x7
    ldr r1, [sp, #0x18]
    sub r0, r0, #0x4
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x18]
L_021fc048:
    ldr r0, [r4, #0x4c]
    add r1, sp, #0x10
    mov r2, #0x1
    bl func_0209a2ac
    mov r0, #0xa
    sub r7, r0, #0x1
    add r6, sp, #0x10
    mov r5, #0x1
L_021fc068:
    add r0, r4, r7, lsl #0x2
    ldr r0, [r0, #0x50]
    mov r1, r6
    mov r2, r5
    bl func_0209a2ac
    subs r7, r7, #0x1
    bpl L_021fc068
    mov r1, #0x0
    add r0, sp, #0x0
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r0, sp, #0x10
    add r1, sp, #0x0
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    ldr r0, [r4, #0x78]
    add r1, sp, #0x10
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r4, #0x7c]
    add r1, sp, #0x10
    mov r2, #0x1
    bl func_0209a2ac
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
L_021fc0d4:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}

    .size func_ov007_021fbfdc, .-func_ov007_021fbfdc
