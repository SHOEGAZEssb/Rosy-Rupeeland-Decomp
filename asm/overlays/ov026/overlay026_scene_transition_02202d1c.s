.text

/* Exact fallback; see src/overlays/ov026/overlay026_scene_transition.c. */
.extern data_ov026_0220434c
.extern func_02091b98
.extern func_02091c7c
.extern func_02092260
.extern Presentation_SetScript
.extern Presentation_IsScriptComplete
.extern func_ov026_022009dc
.extern func_ov026_02200dd8


    .global func_ov026_02202d1c
func_ov026_02202d1c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x79c]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_02202e14
L_02202d34: ; jump table
    b L_02202d44 ; case 0
    b L_02202d60 ; case 1
    b L_02202da0 ; case 2
    b L_02202de4 ; case 3
L_02202d44:
    ldr r0, [r4, #0x160]
    ldr r1, L_02202e24
    mov r2, #0x0
    bl Presentation_SetScript
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
L_02202d60:
    ldr r0, [r4, #0x160]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    beq L_02202e14
    ldr r0, [r4, #0x160]
    ldr r1, [r4, #0x368]
    mov r2, #0x0
    bl Presentation_SetScript
    add r0, r4, #0x3a8
    add r0, r0, #0x400
    mov r1, #0x78
    bl func_02091b98
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
    b L_02202e14
L_02202da0:
    add r0, r4, #0x3a8
    add r0, r0, #0x400
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_02202e14
    ldr r1, L_02202e28
    mov r0, r4
    bl func_02092260
    add r0, r4, #0x3a8
    add r0, r0, #0x400
    mov r1, #0xf0
    bl func_02091b98
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
    b L_02202e14
L_02202de4:
    mov r1, #0x8
    bl func_ov026_02200dd8
    add r0, r4, #0x3a8
    add r0, r0, #0x400
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_02202e14
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_02202e14:
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02202e24: .word data_ov026_0220434c
L_02202e28: .word 0x7b80
.size func_ov026_02202d1c, .-func_ov026_02202d1c

