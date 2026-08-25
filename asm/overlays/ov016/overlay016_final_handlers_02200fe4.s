    .text

/* Exact fallback; see src/overlays/ov016/overlay016_final_handlers.c. */
    .extern data_ov016_022013f8
    .extern data_ov016_02201438
    .extern SceneSound_PlayPackedEffect
    .extern func_ov000_021fc714
    .extern func_ov016_021fe6f4
    .extern Overlay016ActorValue_Init
    .extern func_ov016_021ff7bc
.global func_ov016_02200fe4
func_ov016_02200fe4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_02201004
    cmp r1, #0x1
    beq L_02201054
    b L_022010a8
L_02201004:
    ldr r1, [r4, #0x54]
    cmp r1, #0x1
    bne L_02201030
    mov r1, #0x3
    bl SceneSound_PlayPackedEffect
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201054
L_02201030:
    mov r1, #0x9
    bl SceneSound_PlayPackedEffect
    mov r0, #0x0
    ldr r1, L_022010b8
    str r0, [r4, #0x474]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    b L_022010a8
L_02201054:
    ldr r0, [r4, #0x470]
    bl func_ov016_021fe6f4
    cmp r0, #0x0
    beq L_022010a8
    ldr r2, [r4, #0x474]
    mov r0, #0x0
    ldr r1, [r2, #0x1c]
    add r1, r1, #0x1
    str r1, [r2, #0x1c]
    str r0, [r4, #0x474]
    ldr r0, [r4, #0x44c]
    bl func_ov000_021fc714
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    ldr r1, L_022010bc
    str r0, [r4, #0x8]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
L_022010a8:
    mov r0, r4
    bl func_ov016_021ff7bc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_022010b8: .word data_ov016_022013f8
L_022010bc: .word data_ov016_02201438
    .size func_ov016_02200fe4, . - func_ov016_02200fe4

