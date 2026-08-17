    .text
/* Exact fallback; see src/overlays/ov021/overlay021_widget_helpers.c. */
    .extern data_021e9ac0
    .extern ActorDescriptor_IsInvalid
    .extern func_02064d90

.global func_ov021_021feae4
func_ov021_021feae4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    ldr r1, L_021feb5c
    ldr r5, [r1, #0x0]
    ldr r1, [r0, #0x54]
    mov r0, r5
    bl func_02064d90
    mov r4, #0x0
    ldr r6, [r5, #0x10]
    mov r8, r4
    mov r9, #0x1
    mov r7, #0x24
    b L_021feb4c
L_021feb14:
    ldr r0, [r5, #0x8]
    mla r10, r4, r7, r0
    mov r0, r10
    bl ActorDescriptor_IsInvalid
    cmp r0, #0x0
    bne L_021feb48
    ldr r0, [r10, #0xc]
    cmp r0, #0x0
    movne r0, r9
    moveq r0, r8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021feb48:
    add r4, r4, #0x1
L_021feb4c:
    cmp r4, r6
    blt L_021feb14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021feb5c: .word data_021e9ac0
    .size func_ov021_021feae4, . - func_ov021_021feae4

