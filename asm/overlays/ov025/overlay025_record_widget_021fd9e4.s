.text

/* Exact fallback; see src/overlays/ov025/overlay025_record_widget.c. */
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020befec


    .global func_ov025_021fd9e4
func_ov025_021fd9e4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    mov r0, #0x1
    str r0, [r4, #0x88]
    ldr r0, [r4, #0xc]
    add r1, r1, #0x58
    str r1, [r0, #0x18]
    ldr r0, [r4, #0x74]
    cmp r0, #0x0
    beq L_021fdb08
    ldr r0, [r4, #0x80]
    cmp r0, #0x0
    ldr r0, [r4, #0x10]
    beq L_021fda28
    mov r1, #0x2
    bl GraphicsSpriteState_SetAnimationIndex
    b L_021fda30
L_021fda28:
    mov r1, #0x2e
    bl GraphicsSpriteState_SetAnimationIndex
L_021fda30:
    ldr r0, [r4, #0x7c]
    cmp r0, #0xa
    bge L_021fda90
    ldr r5, [r4, #0x14]
    cmp r5, #0x0
    beq L_021fda64
    ldrb r0, [r5, #0x38]
    mov r1, #0xa
    bl func_020befec
    add r1, r1, #0xa
    mov r0, r5
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
L_021fda64:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq L_021fda78
    mov r1, #0x30
    bl GraphicsSpriteState_SetAnimationIndex
L_021fda78:
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq L_021fdaec
    mov r1, #0xa
    bl GraphicsSpriteState_SetAnimationIndex
    b L_021fdaec
L_021fda90:
    mov r7, #0x0
    mov r5, #0xa
    mov r6, #0x1e
L_021fda9c:
    add r0, r4, r7, lsl #0x2
    ldr r8, [r0, #0x14]
    cmp r8, #0x0
    beq L_021fdae0
    cmp r7, #0x2
    bne L_021fdac4
    mov r0, r8
    mov r1, r6
    bl GraphicsSpriteState_SetAnimationIndex
    b L_021fdae0
L_021fdac4:
    ldrb r0, [r8, #0x38]
    mov r1, r5
    bl func_020befec
    add r1, r1, #0xa
    mov r0, r8
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
L_021fdae0:
    add r7, r7, #0x1
    cmp r7, #0x6
    blt L_021fda9c
L_021fdaec:
    ldr r1, [r4, #0x78]
    ldr r0, [r4, #0x2c]
    mov r1, r1, lsl #0x1
    add r1, r1, #0x4
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fdb08:
    ldr r0, [r4, #0x10]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size func_ov025_021fd9e4, .-func_ov025_021fd9e4

