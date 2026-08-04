; Matching retail form; see src/game/game_phase_touch_prompt_lifecycle.c.
.text
.extern data_020d5604
.extern func_02006138
.extern func_02071eb8
.extern func_0207419c
.global func_02010338
func_02010338:
    stmdb sp!, {r4, lr}
    ldr r1, L_02010380
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq L_02010360
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_02010360:
    ldr r0, [r4, #0x18]
    bl func_0207419c
    add r0, r4, #0xc
    bl func_02071eb8
    mov r0, r4
    bl func_02006138
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02010380: .word data_020d5604
    .size func_02010338, . - func_02010338

