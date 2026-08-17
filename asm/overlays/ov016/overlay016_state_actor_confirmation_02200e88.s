    .text

/* Exact fallback; see src/overlays/ov016/overlay016_state_actor_confirmation.c. */
    .extern data_ov016_02201420
    .extern data_ov016_02201448
    .extern data_ov016_02201458
    .extern func_02092260
    .extern func_ov000_021fc714
    .extern Overlay000_GetActiveMetadata
    .extern func_ov016_021fe390
    .extern func_ov016_021fe4d0
    .extern func_ov016_021fe6f4
    .extern Overlay016ActorValue_Init
    .extern func_ov016_021ff7bc
.global func_ov016_02200e88
func_ov016_02200e88:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_02200ea8
    cmp r0, #0x1
    beq L_02200fa8
    b L_02200fc8
L_02200ea8:
    ldr r0, [r4, #0x54]
    cmp r0, #0x1
    ldr r0, [r4, #0x44c]
    bne L_02200f2c
    bl Overlay000_GetActiveMetadata
    mov r1, r0
    ldr r0, [r4, #0x470]
    bl func_ov016_021fe4d0
    cmp r0, #0x0
    mov r0, r4
    beq L_02200f10
    mov r1, #0x2
    bl func_02092260
    ldr r0, [r4, #0x44c]
    bl Overlay000_GetActiveMetadata
    ldr r1, [r0, #0x1c]
    sub r1, r1, #0x1
    str r1, [r0, #0x1c]
    ldr r0, [r4, #0x44c]
    bl func_ov000_021fc714
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200fa8
L_02200f10:
    mov r1, #0x9
    bl func_02092260
    ldr r1, L_02200fd8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    b L_02200fc8
L_02200f2c:
    bl Overlay000_GetActiveMetadata
    mov r2, r0
    ldr r0, [r4, #0x470]
    ldr r1, [r4, #0x468]
    bl func_ov016_021fe390
    movs r5, r0
    mov r0, r4
    beq L_02200f8c
    mov r1, #0x2
    bl func_02092260
    ldr r0, [r4, #0x44c]
    bl Overlay000_GetActiveMetadata
    ldr r2, [r0, #0x1c]
    mov r1, r5, lsl #0x10
    sub r1, r2, r1, lsr #0x10
    str r1, [r0, #0x1c]
    ldr r0, [r4, #0x44c]
    bl func_ov000_021fc714
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200fa8
L_02200f8c:
    mov r1, #0x9
    bl func_02092260
    ldr r1, L_02200fdc
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
    b L_02200fc8
L_02200fa8:
    ldr r0, [r4, #0x470]
    bl func_ov016_021fe6f4
    cmp r0, #0x0
    beq L_02200fc8
    ldr r1, L_02200fe0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
L_02200fc8:
    mov r0, r4
    bl func_ov016_021ff7bc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02200fd8: .word data_ov016_02201458
L_02200fdc: .word data_ov016_02201420
L_02200fe0: .word data_ov016_02201448
    .size func_ov016_02200e88, . - func_ov016_02200e88

