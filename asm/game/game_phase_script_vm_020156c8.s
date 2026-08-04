; Matching retail form; see src/game/game_phase_script_vm_debug_ui_opcodes.c.
.text
.extern func_0201da9c

    .global func_020156c8
func_020156c8: ; 0x020156c8
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r1, L_020156f8
    mvn ip, #0x0
    str ip, [sp, #0x0]
    add r2, r1, #0x1
    add r3, r1, #0x2
    str ip, [sp, #0x4]
    bl func_0201da9c
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
L_020156f8: .word 0x1372
    .size func_020156c8, . - func_020156c8

