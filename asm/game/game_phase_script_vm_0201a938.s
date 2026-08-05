; Matching retail form; see src/game/game_phase_script_vm_sound_parameter_opcodes.c.
.text
.extern func_02012704
.extern func_02059278
.extern func_0205929c
.extern func_020592c0
.extern func_020595b0
.extern func_020596e8
.extern gSoundContext
.global func_0201a938
func_0201a938: ; 0x0201a938
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl func_02012704
    mov r5, r0
    mov r0, r6
    bl func_02012704
    mov r4, r0
    mov r0, r6
    bl func_02012704
    sub r0, r0, #0x15
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_0201aa08
L_0201a96c: ; jump table
    b L_0201a980 ; case 0
    b L_0201a9a0 ; case 1
    b L_0201a9c0 ; case 2
    b L_0201a9dc ; case 3
    b L_0201a9f4 ; case 4
L_0201a980:
    ldr r0, L_0201aa10
    mov r1, r4, lsl #0x10
    mov r2, r5, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_02059278
    b L_0201aa08
L_0201a9a0:
    ldr r0, L_0201aa10
    mov r1, r4, lsl #0x10
    mov r2, r5, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_0205929c
    b L_0201aa08
L_0201a9c0:
    ldr r0, L_0201aa10
    mov r1, r4, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r2, r5
    mov r1, r1, lsr #0x10
    bl func_020592c0
    b L_0201aa08
L_0201a9dc:
    ldr r0, L_0201aa10
    mov r1, r4
    ldr r0, [r0, #0x0]
    mov r2, r5
    bl func_020595b0
    b L_0201aa08
L_0201a9f4:
    ldr r0, L_0201aa10
    mov r1, r4
    ldr r0, [r0, #0x0]
    mov r2, r5
    bl func_020596e8
L_0201aa08:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_0201aa10: .word gSoundContext
.size func_0201a938, . - func_0201a938
