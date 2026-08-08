.text

/* Exact fallback for func_ov042_021fcfa0; see the documented portable C in
 * src/overlays/ov042/overlay042_base_lifecycle.c. */
.extern __destroy_arr
.extern func_ov042_021fcf9c

    .global func_ov042_021fcfa0
func_ov042_021fcfa0: ; 0x021fcfa0
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x13c
    ldr r3, .L_021fcfc8
    add r0, r0, #0x400
    mov r1, #0x20
    mov r2, #0xc
    bl __destroy_arr
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_021fcfc8: .word func_ov042_021fcf9c
    .size func_ov042_021fcfa0, . - func_ov042_021fcfa0

