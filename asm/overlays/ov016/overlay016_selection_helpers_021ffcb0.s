    .text

/* Exact fallback; see src/overlays/ov016/overlay016_selection_helpers.c. */
    .extern data_021e9ac0
    .extern ActorDescriptor_IsInvalid
.global func_ov016_021ffcb0
func_ov016_021ffcb0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r0, L_021ffd80
    mov r4, #0x0
    ldr r5, [r0, #0x0]
    mov r11, r1
    mov r10, r2
    mov r0, r4
    mov r6, r4
L_021ffcd0:
    strb r6, [r10, r0]
    add r0, r0, #0x1
    cmp r0, #0x6
    blt L_021ffcd0
    b L_021ffd60
L_021ffce4:
    add r1, r1, #0x28
    mov r0, #0x24
    mla r8, r6, r0, r1
    mov r0, #0x2
    mov r7, #0x0
    strb r0, [r10, r6]
    b L_021ffd50
L_021ffd00:
    mov r0, #0x24
    mul r9, r7, r0
    ldr r0, [r5, #0x8]
    add r0, r0, r9
    bl ActorDescriptor_IsInvalid
    cmp r0, #0x0
    ldreq r0, [r5, #0x8]
    ldreqh r1, [r8, #0x0]
    addeq r2, r0, r9
    ldreqh r0, [r0, r9]
    cmpeq r1, r0
    bne L_021ffd4c
    ldrh r1, [r8, #0x4]
    ldrh r0, [r2, #0x4]
    cmp r1, r0
    movls r0, #0x1
    strlsb r0, [r10, r6]
    addls r4, r4, #0x1
    b L_021ffd5c
L_021ffd4c:
    add r7, r7, #0x1
L_021ffd50:
    ldr r0, [r5, #0x10]
    cmp r7, r0
    blt L_021ffd00
L_021ffd5c:
    add r6, r6, #0x1
L_021ffd60:
    ldr r1, [r11, #0x0]
    ldr r0, [r1, #0x100]
    cmp r6, r0
    blt L_021ffce4
    cmp r4, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021ffd80: .word data_021e9ac0
    .size func_ov016_021ffcb0, . - func_ov016_021ffcb0

