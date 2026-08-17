.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.
.extern data_020f4e18
.extern GamePhaseProgress_GetOrCreateGlobal
.extern AnimationResourceState_InitEmbedded
.extern AnimationResourceState_Destroy
.extern func_02071ee0
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateState

.global func_ov055_0220e400
func_ov055_0220e400:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    mov r2, #0x0
    str r2, [r5, #0x0]
    str r2, [r5, #0x4]
    add r0, sp, #0x4
    str r2, [r5, #0x8]
    mov r4, r1
    bl AnimationResourceState_InitEmbedded
    bl GamePhaseProgress_GetOrCreateGlobal
    ldr r0, [r0, #0x10]
    str r0, [r5, #0x8]
    cmp r0, #0x2
    bne .L_0220e460
    ldr r3, .L_0220e50c
    ldr r0, .L_0220e510
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl func_02071ee0
    b .L_0220e480
.L_0220e460:
    ldr r3, .L_0220e514
    ldr r0, .L_0220e510
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl func_02071ee0
.L_0220e480:
    mov r0, #0x2
    str r0, [sp, #0x0]
    ldr r1, [sp, #0x4]
    ldr r2, [sp, #0x8]
    ldr r3, [sp, #0xc]
    mov r0, r4
    bl GraphicsSpriteGroup_CreateState
    str r0, [r5, #0x0]
    ldrh r2, [r0, #0x24]
    mov r1, #0x1
    orr r2, r2, #0x4
    strh r2, [r0, #0x24]
    ldr r0, [r5, #0x0]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x0]
    mov r0, #0x80
    strh r0, [r1, #0x2c]
    mov r0, #0x2f
    strh r0, [r1, #0x2e]
    ldr r0, [r5, #0x8]
    ldr r1, [r5, #0x0]
    cmp r0, #0x2
    ldreqh r0, [r1, #0x24]
    mov r2, #0x2
    orreq r0, r0, #0x2
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x0]
    add r0, sp, #0x4
    strb r2, [r1, #0x3a]
    bl AnimationResourceState_Destroy
    mov r0, r5
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_0220e50c: .word 0x224d
.L_0220e510: .word data_020f4e18
.L_0220e514: .word 0x223b
.size func_ov055_0220e400, . - func_ov055_0220e400
