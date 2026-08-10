.text
/* Exact fallback; see overlay039_final_update.c for portable C. */
    .extern func_0209a2ac
    .extern VecFx32Object_Assign
    .global func_ov039_02207f14
func_ov039_02207f14:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r1
    mov r5, r0
    mov r1, #0x0
    mov r2, #0x1
    bl func_0209a2ac
    add r0, r5, #0x2c
    add r1, r5, #0xc4
    bl VecFx32Object_Assign
    ldr r0, [r5, #0x80]
    ldr r0, [r0, #0x74]
    cmp r0, #0x1
    beq L_02207f58
    cmp r0, #0x17
    blt L_02207f78
    cmp r0, #0x1a
    bgt L_02207f78
L_02207f58:
    ldrsh r2, [r5, #0xc0]
    ldr r0, [r5, #0x54]
    mov r1, r4
    strh r2, [r0, #0x3c]
    strh r2, [r0, #0x3e]
    ldr r0, [r5, #0x54]
    mov r2, #0x1
    bl func_0209a2ac
L_02207f78:
    ldr r0, [r5, #0x48]
    mov r1, r4
    mov r2, #0x1
    bl func_0209a2ac
    ldr r0, [r5, #0x50]
    mov r1, r4
    mov r2, #0x1
    bl func_0209a2ac
    mov r0, #0xa
    sub r7, r0, #0x1
    mov r6, #0x1
L_02207fa4:
    add r0, r5, r7, lsl #0x2
    ldr r0, [r0, #0x58]
    mov r1, r4
    mov r2, r6
    bl func_0209a2ac
    subs r7, r7, #0x1
    bpl L_02207fa4
    ldr r0, [r5, #0x4c]
    mov r1, r4
    mov r2, #0x1
    bl func_0209a2ac
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size func_ov039_02207f14, .-func_ov039_02207f14

