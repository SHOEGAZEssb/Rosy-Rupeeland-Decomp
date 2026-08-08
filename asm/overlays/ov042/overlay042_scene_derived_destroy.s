.text

/* Exact fallback for func_ov042_021fd858; see the documented portable C in
 * src/overlays/ov042/overlay042_scene_base.c. */
.extern __destroy_arr
.extern func_02099fb0
.extern func_ov042_021fcf9c

    .global func_ov042_021fd858
func_ov042_021fd858:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x228
    ldr r3, .L_021fd8cc
    add r0, r0, #0x1000
    mov r1, #0x30
    mov r2, #0xc
    bl __destroy_arr
    add r0, r4, #0x3e8
    ldr r3, .L_021fd8cc
    add r0, r0, #0xc00
    mov r1, #0x30
    mov r2, #0xc
    bl __destroy_arr
    add r0, r4, #0xfc
    ldr r3, .L_021fd8cc
    add r0, r0, #0x400
    mov r1, #0x64
    mov r2, #0xc
    bl __destroy_arr
    add r0, r4, #0x4c
    mov r1, #0x64
    mov r2, #0xc
    ldr r3, .L_021fd8cc
    bl __destroy_arr
    mov r0, r4
    bl func_02099fb0
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_021fd8cc: .word func_ov042_021fcf9c
    .size func_ov042_021fd858, . - func_ov042_021fd858
