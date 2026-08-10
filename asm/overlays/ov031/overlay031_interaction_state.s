.text

/* Exact fallback; see src/overlays/ov031/overlay031_scene_states.c for documented portable C. */
.extern data_ov031_021fe700
.extern data_ov031_021fe708
.extern func_020740a4
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern func_02092260
.extern func_ov031_021fd5c0
.extern func_ov031_021fd7fc
.extern func_ov031_021fd934
.extern func_ov031_021fdd04
.extern func_ov031_021fddbc
.extern func_ov031_021fdf20
.extern gDebugFont


    .global func_ov031_021fe4ac
func_ov031_021fe4ac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_021fe4d4
    cmp r1, #0x1
    beq L_021fe53c
    cmp r1, #0x2
    beq L_021fe57c
    b L_021fe5a4
L_021fe4d4:
    bl func_ov031_021fddbc
    cmp r0, #0x0
    beq L_021fe5a4
    ldr r0, L_021fe5c8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r4, #0x54]
    cmp r0, #0x2
    bne L_021fe51c
    ldr r1, [r4, #0x4c]
    mov r0, #0x0
    bic r1, r1, #0x4
    str r1, [r4, #0x4c]
    ldr r1, [r4, #0x4]
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe5a4
L_021fe51c:
    mov r0, r4
    mov r1, #0x3a
    bl func_02092260
    ldr r1, L_021fe5cc
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov031_021fd934
    b L_021fe5a4
L_021fe53c:
    ldr r0, [r4, #0x548]
    bl func_ov031_021fd7fc
    cmp r0, #0x0
    beq L_021fe5a4
    ldr r1, [r4, #0x4c]
    mov r0, r4
    orr r1, r1, #0x4
    str r1, [r4, #0x4c]
    mov r1, #0x1e
    bl func_ov031_021fdd04
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe5a4
L_021fe57c:
    bl func_ov031_021fddbc
    cmp r0, #0x0
    beq L_021fe5a4
    mov r0, r4
    mov r1, #0x3a
    bl func_02092260
    ldr r1, L_021fe5d0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov031_021fd934
L_021fe5a4:
    mov r0, r4
    mov r1, #0x0
    bl func_ov031_021fdf20
    ldr r0, [r4, #0x58]
    bl func_020740a4
    ldr r0, [r4, #0x548]
    bl func_ov031_021fd5c0
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe5c8: .word gDebugFont
L_021fe5cc: .word data_ov031_021fe700
L_021fe5d0: .word data_ov031_021fe708
.size func_ov031_021fe4ac, .-func_ov031_021fe4ac
