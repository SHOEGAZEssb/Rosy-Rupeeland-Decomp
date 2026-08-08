.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_capture_update.c. */
.extern func_020b4f54
.extern func_020b4f68

    .global func_ov041_021fe56c
func_ov041_021fe56c: ; 0x021fe56c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020b4f54
    ldr r1, .L_021fe590
    mov r2, #0x1
    str r2, [r1, #0x0]
    str r2, [r4, #0x1f0]
    bl func_020b4f68
    ldmia sp!, {r4, pc}
.L_021fe590: .word 0x4000540
    .size func_ov041_021fe56c, . - func_ov041_021fe56c

