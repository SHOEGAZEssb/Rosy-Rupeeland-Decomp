; Matching retail form; see src/game/game_phase_script_vm_debug_object_opcodes.c.
.text
.extern data_021f3ecc
.extern func_0200f404
.extern func_0200f7bc
.extern func_0200f824
.extern func_02012704
.extern func_0201d9e4
.extern func_0201da34
.extern func_020791e0

    .global func_0201579c
func_0201579c: ; 0x0201579c
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    bl func_02012704
    mov r0, r5
    bl func_02012704
    mov r0, r5
    bl func_02012704
    mov r6, r0
    mov r0, r5
    bl func_02012704
    mov r4, r0
    mov r0, r5
    bl func_0201da34
    mov r0, r4, lsl #0x10
    mov r1, r0, lsr #0x10
    ldr r0, L_02015814
    bl func_020791e0
    mov r5, r0
    mov r0, r6
    bl func_0201d9e4
    mov r4, r0
    bl func_0200f824
    bl func_0200f7bc
    bl func_0200f824
    mov r1, r4
    mov r2, r5
    mov r3, #0x1
    bl func_0200f404
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_02015814: .word data_021f3ecc
    .size func_0201579c, . - func_0201579c

