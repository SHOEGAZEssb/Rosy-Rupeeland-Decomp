.text

/* Exact fallback; see src/overlays/ov035/overlay035_animated_object.c for documented portable C. */

    .extern func_020955b0
    .extern func_02094bbc
    .extern func_020948e4
    .extern data_ov035_02203bec


    .global func_ov035_021fdb54
func_ov035_021fdb54: 
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r1, r2
    mov r4, r0
    mov r6, r3
    bl func_020955b0
    ldr r0, L_021fdbdc
    mov r1, #0xa00
    str r0, [r4, #0x0]
    cmp r6, #0x0
    str r5, [r4, #0xa0]
    ldr r0, [sp, #0x18]
    ldr r2, [sp, #0x10]
    str r0, [r4, #0xac]
    str r2, [r4, #0xa8]
    rsbne r1, r1, #0x0
    movne r5, #0xa00
    ldr r3, [sp, #0x14]
    subeq r5, r1, #0x1400
    mov r0, r4
    str r6, [r4, #0xa4]
    bl func_02094bbc
    mov r2, r5
    add r0, r4, #0xc
    mov r1, #0x1
    bl func_020948e4
    mov r0, #0x78
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    mov r1, #0x1
    mov r0, r4
    str r1, [r4, #0x88]
    ldmia sp!, {r4, r5, r6, pc}
L_021fdbdc: .word data_ov035_02203bec
.size func_ov035_021fdb54, .-func_ov035_021fdb54

