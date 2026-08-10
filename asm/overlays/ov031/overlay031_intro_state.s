.text

/* Exact fallback; see src/overlays/ov031/overlay031_scene_states.c for documented portable C. */
.extern data_ov031_021fe6f8
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern func_02092260
.extern func_ov031_021fce84
.extern func_ov031_021fce98
.extern func_ov031_021fd5c0
.extern func_ov031_021fd934
.extern func_ov031_021fdd04
.extern func_ov031_021fdf20
.extern func_ov031_021fe17c
.extern func_ov031_021fe1a8
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern gGameWork


    .global func_ov031_021fe28c
func_ov031_021fe28c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b L_021fe47c
L_021fe2a4: ; jump table
    b L_021fe2b8 ; case 0
    b L_021fe2d0 ; case 1
    b L_021fe310 ; case 2
    b L_021fe354 ; case 3
    b L_021fe3a8 ; case 4
L_021fe2b8:
    bl func_ov031_021fe17c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fe2d0:
    ldr r1, [r4, #0x544]
    ldr r0, [r4, #0x540]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    cmp r0, #0x0
    beq L_021fe304
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe47c
L_021fe304:
    add r0, r4, #0xa4
    bl func_ov031_021fce98
    b L_021fe47c
L_021fe310:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x3c
    add r0, r4, #0xa4
    ble L_021fe34c
    mov r1, #0x2
    mov r2, #0x8
    bl func_ov031_021fce84
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe47c
L_021fe34c:
    bl func_ov031_021fce98
    b L_021fe47c
L_021fe354:
    ldr r1, [r4, #0x544]
    ldr r0, [r4, #0x540]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    cmp r0, #0x0
    beq L_021fe39c
    mov r0, r4
    mov r1, #0x6f
    bl func_02092260
    mov r0, r4
    bl func_ov031_021fe1a8
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe47c
L_021fe39c:
    add r0, r4, #0xa4
    bl func_ov031_021fce98
    b L_021fe47c
L_021fe3a8:
    ldr r1, [r4, #0x54]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_021fe46c
L_021fe3b8: ; jump table
    b L_021fe3c8 ; case 0
    b L_021fe410 ; case 1
    b L_021fe458 ; case 2
    b L_021fe464 ; case 3
L_021fe3c8:
    ldr r0, L_021fe4a0
    mov r1, #0x38c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fe3f0
    mov r0, r4
    mov r1, #0x24
    bl func_ov031_021fdd04
    b L_021fe46c
L_021fe3f0:
    ldr r0, L_021fe4a0
    mov r1, #0x38c
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r0, r4
    mov r1, #0x1f
    bl func_ov031_021fdd04
    b L_021fe46c
L_021fe410:
    ldr r0, L_021fe4a0
    ldr r1, L_021fe4a4
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fe438
    mov r0, r4
    mov r1, #0x25
    bl func_ov031_021fdd04
    b L_021fe46c
L_021fe438:
    ldr r0, L_021fe4a0
    ldr r1, L_021fe4a4
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r0, r4
    mov r1, #0x20
    bl func_ov031_021fdd04
    b L_021fe46c
L_021fe458:
    mov r1, #0x1d
    bl func_ov031_021fdd04
    b L_021fe46c
L_021fe464:
    mov r1, #0x26
    bl func_ov031_021fdd04
L_021fe46c:
    ldr r1, L_021fe4a8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov031_021fd934
L_021fe47c:
    mov r0, r4
    mov r1, #0x0
    bl func_ov031_021fdf20
    ldr r0, [r4, #0x58]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x548]
    bl func_ov031_021fd5c0
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe4a0: .word gGameWork
L_021fe4a4: .word 0x38d
L_021fe4a8: .word data_ov031_021fe6f8
.size func_ov031_021fe28c, .-func_ov031_021fe28c
