; Matching retail form; see src/game/randomized_sprite_particle_emitter.c.
.text
.extern __construct_array
.extern data_020de8cc
.extern data_020f4e14
.extern func_02005030
.extern func_02005580
.extern func_020055d0
.extern func_0200567c
.extern func_02010854
.extern func_0201e250
.extern func_02028c94
.extern func_020742cc

    .global func_02028b98
    .type func_02028b98, @function
func_02028b98: ; 0x02028b98
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x24
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_0201e250
    ldr r0, .L_02028c78
    mov r1, r6
    str r0, [r4, #0x0]
    add r0, r4, #0xc
    str r7, [r4, #0x8]
    bl func_02005030
    mov r1, r5
    add r0, r4, #0x1c
    bl func_02005030
    ldr r1, .L_02028c7c
    ldr r3, .L_02028c80
    str r1, [sp, #0x0]
    add r0, r4, #0x2c
    mov r1, #0x2
    mov r2, #0x10
    bl __construct_array
    mov r0, #0x0
    str r0, [r4, #0x54]
    ldr r1, [sp, #0x38]
    add r0, r4, #0x5c
    str r1, [r4, #0x58]
    bl func_02028c94
    ldr r1, .L_02028c84
    ldr r2, .L_02028c88
    add r0, sp, #0x14
    add r3, r1, #0x1
    bl func_02005580
    add r0, r4, #0x2c
    add r1, sp, #0x14
    bl func_0200567c
    add r0, sp, #0x14
    bl func_020055d0
    ldr r1, .L_02028c8c
    add r0, sp, #0x4
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_02005580
    add r0, r4, #0x3c
    add r1, sp, #0x4
    bl func_0200567c
    add r0, sp, #0x4
    bl func_020055d0
    ldr r0, .L_02028c90
    ldr r0, [r0, #0x0]
    bl func_020742cc
    str r0, [r4, #0x4c]
    mov r0, r4
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02028c78: .word data_020de8cc
.L_02028c7c: .word func_020055d0
.L_02028c80: .word func_02010854
.L_02028c84: .word 0x138e
.L_02028c88: .word 0x1078
.L_02028c8c: .word 0x168b
.L_02028c90: .word data_020f4e14
    .size func_02028b98, . - func_02028b98

