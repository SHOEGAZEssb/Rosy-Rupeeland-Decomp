.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.
.extern Sound_Play
.extern GraphicsSpriteState_SetAnimationIndex
.extern gSoundContext

.global func_ov070_02212764
func_ov070_02212764:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x1
    str r0, [r4, #0x138]
    str r0, [r4, #0x11c]
    ldr r2, [r4, #0xd4]
    ldr r0, [r4, #0xec]
    mov r1, #0x0
    add r0, r2, r0
    str r0, [r4, #0xd4]
    ldr r3, [r4, #0xd8]
    ldr r2, [r4, #0xf0]
    sub r0, r1, #0x14
    add r2, r3, r2
    str r2, [r4, #0xd8]
    str r1, [r4, #0xec]
    ldr r2, [r4, #0xf4]
    mov r1, #0x6
    mul r0, r2, r0
    str r0, [r4, #0xf0]
    ldr r0, [r4, #0x6c]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x6c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_022127fc
    ldr r0, .L_02212824
    mov r1, #0x1e0
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    b .L_02212810
.L_022127fc:
    ldr r0, .L_02212824
    ldr r1, .L_02212828
    ldr r0, [r0, #0x0]
    mov r2, #0xe
    bl Sound_Play
.L_02212810:
    ldr r0, [r4, #0x13c]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x13c]
    ldmia sp!, {r4, pc}
.L_02212824: .word gSoundContext
.L_02212828: .word 0x12d
.size func_ov070_02212764, . - func_ov070_02212764
