.text

/* Exact fallback; see src/overlays/ov026/overlay026_scene_transition.c. */
.extern data_ov026_02204098
.extern data_ov026_0220434c
.extern func_02091b98
.extern func_02091c7c
.extern SceneSound_PlayPackedEffect
.extern Presentation_SetScript
.extern Presentation_IsScriptComplete
.extern func_ov026_022009dc
.extern func_ov026_02200dd8


    .global func_ov026_02202e2c
func_ov026_02202e2c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    ldr lr, L_02202f40
    add ip, sp, #0x0
    mov r4, r0
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1}
    stmia ip, {r0, r1}
    ldr r0, [r4, #0x79c]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_02202f2c
L_02202e60: ; jump table
    b L_02202e70 ; case 0
    b L_02202e8c ; case 1
    b L_02202ecc ; case 2
    b L_02202f00 ; case 3
L_02202e70:
    ldr r0, [r4, #0x160]
    ldr r1, L_02202f44
    mov r2, #0x0
    bl Presentation_SetScript
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
L_02202e8c:
    ldr r0, [r4, #0x160]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    beq L_02202f2c
    ldr r0, [r4, #0x160]
    add r1, sp, #0x0
    mov r2, #0x0
    bl Presentation_SetScript
    add r0, r4, #0x3a8
    add r0, r0, #0x400
    mov r1, #0x3c
    bl func_02091b98
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
    b L_02202f2c
L_02202ecc:
    add r0, r4, #0x3a8
    add r0, r0, #0x400
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_02202f2c
    ldr r1, L_02202f48
    mov r0, r4
    bl SceneSound_PlayPackedEffect
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
    b L_02202f2c
L_02202f00:
    mov r0, r4
    mov r1, #0x8
    bl func_ov026_02200dd8
    ldr r0, [r4, #0x160]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    beq L_02202f2c
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x1
    b L_02202f38
L_02202f2c:
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x0
L_02202f38:
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
L_02202f40: .word data_ov026_02204098
L_02202f44: .word data_ov026_0220434c
L_02202f48: .word 0x7b80
.size func_ov026_02202e2c, .-func_ov026_02202e2c

