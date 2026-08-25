    .text
    .extern data_ov015_021febe0
    .extern data_ov015_021fec28
    .extern data_ov015_021fec30
    .extern data_ov015_021fec38
    .extern SceneSound_PlayPackedEffect
    .extern func_ov015_021fce30
    .extern func_ov015_021fda78

/* Exact fallback for selected-record dispatch; see src/overlays/ov015/overlay015_selection_runtime.c. */
    .global func_ov015_021fdd1c

func_ov015_021fdd1c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r1, r4, #0x30
    bl func_ov015_021fda78
    str r0, [r4, #0xf0]
    cmp r0, #0x0
    blt L_021fdde8
    mov r1, #0xac
    mla r1, r0, r1, r4
    ldr r0, [r1, #0x1a4]
    cmp r0, #0x24
    bgt L_021fdd70
    bge L_021fddd0
    cmp r0, #0x11
    bgt L_021fdde0
    cmp r0, #0xd
    blt L_021fdde0
    beq L_021fdd7c
    cmp r0, #0x11
    beq L_021fdd9c
    b L_021fdde0
L_021fdd70:
    cmp r0, #0x2c
    beq L_021fddbc
    b L_021fdde0
L_021fdd7c:
    mov r0, r4
    mov r1, #0x5d
    bl SceneSound_PlayPackedEffect
    ldr r1, L_021fddf0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
    b L_021fdde0
L_021fdd9c:
    mov r0, r4
    mov r1, #0x2
    bl SceneSound_PlayPackedEffect
    ldr r1, L_021fddf4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
    b L_021fdde0
L_021fddbc:
    ldr r1, L_021fddf8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
    b L_021fdde0
L_021fddd0:
    ldr r1, L_021fddfc
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
L_021fdde0:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fdde8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fddf0: .word data_ov015_021febe0
L_021fddf4: .word data_ov015_021fec38
L_021fddf8: .word data_ov015_021fec30
L_021fddfc: .word data_ov015_021fec28

    .size func_ov015_021fdd1c, . - func_ov015_021fdd1c
