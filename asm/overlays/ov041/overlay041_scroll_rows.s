.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_capture_update.c. */
.extern func_02070e0c
.extern func_ov041_021fdd04
.extern func_ov041_021fe6e4
.extern func_ov041_021fe794

    .global func_ov041_021fe824
func_ov041_021fe824: ; 0x021fe824
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, #0x0
.L_021fe830:
    mov r0, r4
    mov r1, r5
    bl func_ov041_021fe6e4
    mov r0, r4
    mov r1, r5
    bl func_ov041_021fe794
    add r5, r5, #0x1
    cmp r5, #0xd
    blt .L_021fe830
    ldr r0, [r4, #0x184]
    cmp r0, #0x3
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x1ec]
    mov r2, #0x1c
    cmp r0, #0x0
    mov r0, #0x0
    moveq r3, #0x0
    movne r3, #0x2
    mov r1, r0
    str r0, [sp, #0x0]
    bl func_ov041_021fdd04
    ldr r0, [r4, #0x1ec]
    ldr r1, [r4, #0x180]
    cmp r0, #0x0
    movne r2, #0x1
    moveq r2, #0x0
    add r1, r1, r2
    mov r0, #0xc
    mla r0, r1, r0, r4
    ldr r0, [r0, #0x50]
    mov r1, #0x1
    mov r2, #0x0
    bl func_02070e0c
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov041_021fe824, . - func_ov041_021fe824

