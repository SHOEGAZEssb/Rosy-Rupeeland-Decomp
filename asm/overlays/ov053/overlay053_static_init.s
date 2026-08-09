.section .init, 4, 1, 6
; Matching fallback for the portable implementation in src/overlays/ov053/overlay053_recovery.c.
.extern __register_global_object
.extern data_ov053_0220dd40
.extern data_ov053_0220dd4c
.extern data_ov053_0220dd58
.extern data_ov053_0220dd64
.extern data_ov053_0220dd70
.extern data_ov053_0220dd7c
.extern data_ov053_0220dd84
.extern data_ov053_0220dd8c
.extern data_ov053_0220dd94
.extern data_ov053_0220dd9c
.extern func_ov053_0220db84
.extern func_ov053_0220db9c

.global __sinit_ov053_0220dbb4
__sinit_ov053_0220dbb4:
    stmdb sp!, {r3, lr}
    ldr r0, .L_0220dc5c
    mov r1, #0x5c
    mov r2, #0x94
    bl func_ov053_0220db84
    ldr r0, .L_0220dc5c
    ldr r1, .L_0220dc60
    ldr r2, .L_0220dc64
    bl __register_global_object
    ldr r0, .L_0220dc68
    mov r1, #0x68
    mov r2, #0x7c
    bl func_ov053_0220db84
    ldr r0, .L_0220dc68
    ldr r1, .L_0220dc60
    ldr r2, .L_0220dc6c
    bl __register_global_object
    ldr r0, .L_0220dc70
    mov r1, #0x80
    mov r2, #0x74
    bl func_ov053_0220db84
    ldr r0, .L_0220dc70
    ldr r1, .L_0220dc60
    ldr r2, .L_0220dc74
    bl __register_global_object
    ldr r0, .L_0220dc78
    mov r1, #0x98
    mov r2, #0x7c
    bl func_ov053_0220db84
    ldr r0, .L_0220dc78
    ldr r1, .L_0220dc60
    ldr r2, .L_0220dc7c
    bl __register_global_object
    ldr r0, .L_0220dc80
    mov r1, #0xa8
    mov r2, #0x94
    bl func_ov053_0220db84
    ldr r0, .L_0220dc80
    ldr r1, .L_0220dc60
    ldr r2, .L_0220dc84
    bl __register_global_object
    ldmia sp!, {r3, pc}
.L_0220dc5c: .word data_ov053_0220dd7c
.L_0220dc60: .word func_ov053_0220db9c
.L_0220dc64: .word data_ov053_0220dd58
.L_0220dc68: .word data_ov053_0220dd84
.L_0220dc6c: .word data_ov053_0220dd4c
.L_0220dc70: .word data_ov053_0220dd8c
.L_0220dc74: .word data_ov053_0220dd64
.L_0220dc78: .word data_ov053_0220dd94
.L_0220dc7c: .word data_ov053_0220dd40
.L_0220dc80: .word data_ov053_0220dd9c
.L_0220dc84: .word data_ov053_0220dd70
.size __sinit_ov053_0220dbb4, . - __sinit_ov053_0220dbb4
