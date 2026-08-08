.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_resource_transition.c. */
.extern Heap_Free
.extern __destroy_arr
.extern func_02003e38
.extern func_02072000
.extern func_02099fb0
.extern func_ov041_021fce00

    .global func_ov041_021fdeb4
func_ov041_021fdeb4: ; 0x021fdeb4
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0xfc
    bl func_02072000
    add r0, r5, #0x108
    bl func_02072000
    add r0, r5, #0x114
    bl func_02072000
    add r0, r5, #0x120
    bl func_02072000
    add r0, r5, #0x12c
    bl func_02072000
    add r0, r5, #0x138
    bl func_02072000
    add r0, r5, #0x144
    bl func_02072000
    add r0, r5, #0x9c
    bl func_02072000
    add r0, r5, #0xa8
    bl func_02072000
    add r0, r5, #0xb4
    bl func_02072000
    add r0, r5, #0xc0
    bl func_02072000
    add r0, r5, #0xcc
    bl func_02072000
    add r0, r5, #0xd8
    bl func_02072000
    add r0, r5, #0xe4
    bl func_02072000
    add r0, r5, #0x48
    bl func_02072000
    add r0, r5, #0x54
    bl func_02072000
    add r0, r5, #0x60
    bl func_02072000
    add r0, r5, #0x6c
    bl func_02072000
    add r0, r5, #0x78
    bl func_02072000
    add r0, r5, #0x84
    bl func_02072000
    ldr r0, [r5, #0x170]
    cmp r0, #0x0
    beq .L_021fdf74
    bl func_02003e38
    mov r0, #0x0
    str r0, [r5, #0x170]
.L_021fdf74:
    ldr r0, [r5, #0x16c]
    cmp r0, #0x0
    beq .L_021fdf8c
    bl func_02003e38
    mov r0, #0x0
    str r0, [r5, #0x16c]
.L_021fdf8c:
    ldr r4, [r5, #0x14]
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    beq .L_021fdfc0
    ldr r3, .L_021fdfcc
    add r0, r4, #0x64
    mov r1, #0x4
    mov r2, #0xc
    bl __destroy_arr
    mov r0, r4
    bl func_02099fb0
    mov r0, r4
    bl Heap_Free
.L_021fdfc0:
    mov r0, #0x0
    str r0, [r5, #0x14]
    ldmia sp!, {r3, r4, r5, pc}
.L_021fdfcc: .word func_ov041_021fce00
    .size func_ov041_021fdeb4, . - func_ov041_021fdeb4

