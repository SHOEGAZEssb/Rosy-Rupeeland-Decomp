.text
; Matching fallback for the portable implementation in src/overlays/ov093/overlay093_recovery.c.
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern data_ov093_022188f0
.extern func_02005058
.extern func_0204d570
.extern GraphicsSpriteState_ReleaseFromGroup
.extern gGameWork

.global func_ov093_02217ad8
func_ov093_02217ad8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02217b84
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, .L_02217b88
    mov r1, #0x3ec
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, .L_02217b88
    ldr r1, .L_02217b8c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, [r4, #0x204]
    bl GraphicsSpriteState_ReleaseFromGroup
    ldr r0, [r4, #0x208]
    bl GraphicsSpriteState_ReleaseFromGroup
    ldr r0, [r4, #0x210]
    bl GraphicsSpriteState_ReleaseFromGroup
    mov r5, #0x0
.L_02217b24:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x214]
    bl GraphicsSpriteState_ReleaseFromGroup
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_02217b24
    ldr r0, [r4, #0x200]
    cmp r0, #0x0
    beq .L_02217b54
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217b54:
    ldr r0, [r4, #0x20c]
    cmp r0, #0x0
    beq .L_02217b6c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217b6c:
    add r0, r4, #0x1ec
    bl func_02005058
    mov r0, r4
    bl func_0204d570
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02217b84: .word data_ov093_022188f0
.L_02217b88: .word gGameWork
.L_02217b8c: .word 0x3f5
.size func_ov093_02217ad8, . - func_ov093_02217ad8
