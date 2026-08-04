; Matching retail form; see src/game/game_phase_script_vm_debug_ui_opcodes.c.
.text
.extern func_0200f404
.extern func_0200f7bc
.extern func_0200f824
.extern func_02012704
.extern func_0201d9e4
.extern func_0201da20
.extern func_0201da34
.extern func_020337d4

    .global func_02015610
func_02015610: ; 0x02015610
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
    ldr r0, [r5, #0x84]
    bl func_020337d4
    mov r1, r4
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    bl func_0201da20
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
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
    .size func_02015610, . - func_02015610

