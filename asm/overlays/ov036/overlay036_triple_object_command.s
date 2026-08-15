.text

/* Exact fallback; see src/overlays/ov036/overlay036_triple_object_command.c for documented portable C. */

    .extern Presentation_SetScript
    .extern Sound_Play
    .extern data_ov036_02204dac
    .extern data_ov036_02204dd0
    .extern data_ov036_02204ffc
    .extern data_ov036_02204d8c
    .extern gSoundContext
    .extern data_ov036_02204e60
    .extern data_ov036_02204df4
    .extern data_ov036_02205168
    .extern data_ov036_02204ee4

    .global func_ov036_02203b24
func_ov036_02203b24:
    stmdb sp!, {r4, lr}
    ldr r2, [r1, #0x0]
    mov r4, r0
    cmp r2, #0x4
    addls pc, pc, r2, lsl #0x2
    b L_02203c14
L_02203b3c: ; jump table
    b L_02203b50 ; case 0
    b L_02203b60 ; case 1
    b L_02203b88 ; case 2
    b L_02203bb0 ; case 3
    b L_02203bec ; case 4
L_02203b50:
    ldr r1, [r1, #0x4]
    mov r0, #0x2
    str r1, [r4, #0xb0]
    ldmia sp!, {r4, pc}
L_02203b60:
    ldr r0, [r4, #0x158]
    ldr r1, L_02203c1c
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0x154]
    ldr r1, L_02203c20
    mov r2, #0x1
    bl Presentation_SetScript
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_02203b88:
    ldr r0, [r4, #0x158]
    ldr r1, L_02203c24
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0x154]
    ldr r1, L_02203c28
    mov r2, #0x1
    bl Presentation_SetScript
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_02203bb0:
    ldr r0, L_02203c2c
    ldr r1, L_02203c30
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
    ldr r0, [r4, #0x158]
    ldr r1, L_02203c34
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0x154]
    ldr r1, L_02203c38
    mov r2, #0x1
    bl Presentation_SetScript
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_02203bec:
    ldr r0, [r4, #0x158]
    ldr r1, L_02203c3c
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0x154]
    ldr r1, L_02203c40
    mov r2, #0x1
    bl Presentation_SetScript
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_02203c14:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_02203c1c: .word data_ov036_02204dac
L_02203c20: .word data_ov036_02204dd0
L_02203c24: .word data_ov036_02204ffc
L_02203c28: .word data_ov036_02204d8c
L_02203c2c: .word gSoundContext
L_02203c30: .word 0x1b3
L_02203c34: .word data_ov036_02204e60
L_02203c38: .word data_ov036_02204df4
L_02203c3c: .word data_ov036_02205168
L_02203c40: .word data_ov036_02204ee4
    .size func_ov036_02203b24, .-func_ov036_02203b24

