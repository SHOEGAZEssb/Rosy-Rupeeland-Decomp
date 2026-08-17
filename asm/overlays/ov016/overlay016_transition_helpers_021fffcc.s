    .text

/* Exact fallback; see src/overlays/ov016/overlay016_transition_helpers.c. */
    .extern data_ov016_022013d0
    .extern func_02092260
    .extern func_ov016_021fd628
    .extern Overlay016ActorValue_Init
.global func_ov016_021fffcc
func_ov016_021fffcc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x444]
    bl func_ov016_021fd628
    ldr r1, [r5, #0x54]
    mov r4, r0
    cmp r1, #0x2
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4, #0xc]
    and r0, r1, #0x7
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq L_02200020
    mov r0, r5
    mov r1, #0x9
    bl func_02092260
    mov r0, #0xa
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
L_02200020:
    and r0, r1, #0x2
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    mov r0, r5
    beq L_02200054
    mov r1, #0x9
    bl func_02092260
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
L_02200054:
    mov r1, #0x2
    bl func_02092260
    ldr r0, [r4, #0x0]
    ldr r1, L_02200078
    str r0, [r5, #0x468]
    mov r0, r5
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    ldmia sp!, {r3, r4, r5, pc}
L_02200078: .word data_ov016_022013d0
    .size func_ov016_021fffcc, . - func_ov016_021fffcc

