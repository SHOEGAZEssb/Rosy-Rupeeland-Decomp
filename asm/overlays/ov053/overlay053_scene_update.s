.text
; Matching fallback for the portable implementation in src/overlays/ov053/overlay053_recovery.c.
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern Sound_Play
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020740a4
.extern gGameWork
.extern gSoundContext

.global func_ov053_0220d8ac
func_ov053_0220d8ac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x3e]
    add r0, r0, #0x100
    strh r0, [r4, #0x3e]
    ldrsh r0, [r4, #0x38]
    cmp r0, #0x0
    beq .L_0220d8e0
    cmp r0, #0x1
    beq .L_0220d91c
    cmp r0, #0x2
    beq .L_0220d974
    b .L_0220d9a4
.L_0220d8e0:
    ldrsh r0, [r4, #0x36]
    sub r0, r0, #0x1
    strh r0, [r4, #0x36]
    ldrsh r0, [r4, #0x36]
    cmp r0, #0x0
    bgt .L_0220d9a4
    ldr r2, [r4, #0x20]
    mov r0, #0x0
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    strh r0, [r4, #0x36]
    ldrsh r0, [r4, #0x38]
    add r0, r0, #0x1
    strh r0, [r4, #0x38]
.L_0220d91c:
    ldrsh r0, [r4, #0x3c]
    add r0, r0, #0x10
    strh r0, [r4, #0x3c]
    ldrsh r0, [r4, #0x3c]
    cmp r0, #0x200
    blt .L_0220d9a4
    ldr r0, .L_0220d9fc
    ldr r1, .L_0220da00
    ldr r0, [r0, #0x0]
    mov r2, #0x5
    bl Sound_Play
    ldrh r1, [r4, #0x34]
    add r0, r4, r1, lsl #0x2
    add r1, r1, #0x1
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x200
    strh r0, [r4, #0x3c]
    ldrsh r0, [r4, #0x38]
    add r0, r0, #0x1
    strh r0, [r4, #0x38]
.L_0220d974:
    ldrsh r0, [r4, #0x3c]
    sub r0, r0, #0x10
    strh r0, [r4, #0x3c]
    ldrsh r0, [r4, #0x3c]
    cmp r0, #0x20
    bgt .L_0220d9a4
    ldr r2, [r4, #0x20]
    mov r0, #0x0
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    strh r0, [r4, #0x3c]
.L_0220d9a4:
    ldrsh r1, [r4, #0x3c]
    ldr r0, [r4, #0x20]
    strh r1, [r0, #0x32]
    strh r1, [r0, #0x34]
    ldrh r1, [r4, #0x3e]
    ldr r0, [r4, #0x20]
    strh r1, [r0, #0x30]
    ldr r0, [r4, #0x8]
    bl func_020740a4
    ldr r0, .L_0220da04
    ldr r1, .L_0220da08
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, .L_0220da04
    ldr r1, .L_0220da08
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_0220d9fc: .word gSoundContext
.L_0220da00: .word 0x15e
.L_0220da04: .word gGameWork
.L_0220da08: .word 0x413
.size func_ov053_0220d8ac, . - func_ov053_0220d8ac
