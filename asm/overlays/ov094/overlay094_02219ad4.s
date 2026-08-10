.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern func_ov094_02219a08
.extern gGameWork

.global func_ov094_02219ad4
func_ov094_02219ad4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_02219b4c
    ldr r0, .L_02219b6c
    ldr r1, .L_02219b70
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02219b3c
    ldr r0, .L_02219b6c
    ldr r1, .L_02219b70
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    bl func_ov094_02219a08
    ldr r0, .L_02219b6c
    ldr r1, .L_02219b74
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02219b3c
    mov r0, r4
    bl func_ov094_02219a08
.L_02219b3c:
    ldr r0, [r4, #0xc]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x10]
    bl GraphicsSpriteGroup_AdvanceAnimations
.L_02219b4c:
    ldr r0, .L_02219b6c
    mov r1, #0x3d4
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_02219b6c: .word gGameWork
.L_02219b70: .word 0x3d3
.L_02219b74: .word 0x3d6
.size func_ov094_02219ad4, . - func_ov094_02219ad4
