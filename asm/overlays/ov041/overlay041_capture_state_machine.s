.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_capture_state_machine.c. */
.extern func_0207043c
.extern GraphicsBgResourceData_GetDecoded
.extern func_02070888
.extern func_020afce8
.extern func_020b1924
.extern func_020b2058
.extern func_020befec
.extern func_ov041_021fdd04

    .global func_ov041_021fe8b8
func_ov041_021fe8b8: ; 0x021fe8b8
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r4, [r5, #0x184]
    cmp r4, #0xa
    addls pc, pc, r4, lsl #0x2
    b .L_021feb48
.L_021fe8d4: ; jump table
    b .L_021feb48 ; case 0
    b .L_021fe900 ; case 1
    b .L_021fe938 ; case 2
    b .L_021fe9f8 ; case 3
    b .L_021fe994 ; case 4
    b .L_021fe9f8 ; case 5
    b .L_021fe994 ; case 6
    b .L_021fe9f8 ; case 7
    b .L_021fea7c ; case 8
    b .L_021fead0 ; case 9
    b .L_021feb24 ; case 10
.L_021fe900:
    ldr r0, [r5, #0x188]
    mov r1, #0x3
    add r0, r0, #0x1
    str r0, [r5, #0x188]
    bl func_020befec
    mov r2, r0
    ldr r0, .L_021feb50
    mov r1, #0x2
    bl func_020afce8
    ldr r0, [r5, #0x188]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r5, #0x184]
    b .L_021feb48
.L_021fe938:
    ldr r0, [r5, #0x188]
    mov r1, #0x3
    sub r0, r0, #0x1
    str r0, [r5, #0x188]
    bl func_020befec
    mov r2, r0
    ldr r0, .L_021feb50
    mov r1, #0x2
    bl func_020afce8
    ldr r1, [r5, #0x188]
    mvn r0, #0x2f
    cmp r1, r0
    bgt .L_021feb48
    ldr r0, [r5, #0x184]
    mov r1, #0x6
    add r0, r0, #0x1
    str r0, [r5, #0x184]
    ldr r0, [r5, #0x180]
    add r0, r0, #0x2
    str r0, [r5, #0x180]
    bl func_020befec
    str r1, [r5, #0x180]
    b .L_021feb48
.L_021fe994:
    mov r0, #0x0
    mov r1, r0
    mov r3, r0
    str r0, [sp, #0x0]
    mov r2, #0x1c
    mov r4, r4, lsl #0xc
    bl func_ov041_021fdd04
    ldr r1, [r5, #0x180]
    mov r0, #0xc
    mla r0, r1, r0, r5
    ldr r0, [r0, #0x48]
    ldr r6, [r0, #0x24]
    bl func_0207043c
    add r1, r4, r4, lsr #0x1f
    mov r2, r0, asr #0x1
    mov r3, r1, asr #0x1
    add r2, r0, r2, lsr #0x1e
    mov r1, r4
    add r0, r6, r3, lsl #0x1
    mov r2, r2, asr #0x2
    bl func_020b1924
    ldr r0, [r5, #0x184]
    add r0, r0, #0x1
    str r0, [r5, #0x184]
    b .L_021feb48
.L_021fe9f8:
    mov r0, #0x0
    sub r4, r4, #0x3
    mov r1, r0
    str r0, [sp, #0x0]
    mov r2, #0x1c
    mov r3, #0x2
    mov r4, r4, lsl #0xc
    bl func_ov041_021fdd04
    ldr r1, [r5, #0x180]
    mov r0, #0xc
    add r1, r1, #0x1
    mla r0, r1, r0, r5
    ldr r0, [r0, #0x48]
    ldr r6, [r0, #0x24]
    bl func_0207043c
    mov r2, r0, asr #0x1
    add r2, r0, r2, lsr #0x1e
    add r1, r4, r4, lsr #0x1f
    mov r0, r1, asr #0x1
    mov r1, r4
    add r0, r6, r0, lsl #0x1
    mov r2, r2, asr #0x2
    bl func_020b1924
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, r0
    mov r2, #0x1c
    mov r3, r0
    bl func_ov041_021fdd04
    ldr r0, [r5, #0x184]
    add r0, r0, #0x1
    str r0, [r5, #0x184]
    b .L_021feb48
.L_021fea7c:
    ldr r0, [r5, #0x1ec]
    cmp r0, #0x0
    bne .L_021feb48
    ldr r1, [r5, #0x180]
    mov r0, #0xc
    mla r0, r1, r0, r5
    ldr r6, [r0, #0x4c]
    mov r0, r6
    bl GraphicsBgResourceData_GetDecoded
    mov r4, r0
    mov r0, r6
    bl func_02070888
    mov r1, r0
    add r0, r4, #0x20
    sub r2, r1, #0x20
    mov r1, #0x20
    bl func_020b2058
    ldr r0, [r5, #0x184]
    add r0, r0, #0x1
    str r0, [r5, #0x184]
    b .L_021feb48
.L_021fead0:
    ldr r0, [r5, #0x1ec]
    cmp r0, #0x0
    beq .L_021feb48
    ldr r1, [r5, #0x180]
    mov r0, #0xc
    add r1, r1, #0x1
    mla r0, r1, r0, r5
    ldr r6, [r0, #0x4c]
    mov r0, r6
    bl GraphicsBgResourceData_GetDecoded
    mov r4, r0
    mov r0, r6
    bl func_02070888
    mov r2, r0
    mov r0, r4
    mov r1, #0x100
    bl func_020b2058
    ldr r0, [r5, #0x184]
    add r0, r0, #0x1
    str r0, [r5, #0x184]
    b .L_021feb48
.L_021feb24:
    ldr r1, [r5, #0x188]
    mvn r0, #0x6b
    sub r1, r1, #0x1
    cmp r1, r0
    str r1, [r5, #0x188]
    addlt r0, r0, #0x3c
    strlt r0, [r5, #0x188]
    movlt r0, #0x1
    strlt r0, [r5, #0x184]
.L_021feb48:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_021feb50: .word 0x4000050
    .size func_ov041_021fe8b8, . - func_ov041_021fe8b8

