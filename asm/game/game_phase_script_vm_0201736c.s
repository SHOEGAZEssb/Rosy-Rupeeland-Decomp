; Matching retail form; see src/game/game_phase_script_vm_brightness_opcodes.c.
.text
.extern data_020f4dc8
.extern func_02002ac0
.extern func_02002cd0
.extern func_02002d28
.global func_0201736c
func_0201736c:
    stmdb sp!, {r4, lr}
    ldr r0, L_020173a0
    mov r1, #0
    bl func_02002d28
    mov r4, r0
    bl func_02002cd0
    mov r1, r0
    mov r0, r4
    mvn r2, #7
    mov r3, #16
    bl func_02002ac0
    mov r0, #0
    ldmia sp!, {r4, pc}
L_020173a0: .word data_020f4dc8
    .size func_0201736c, . - func_0201736c
