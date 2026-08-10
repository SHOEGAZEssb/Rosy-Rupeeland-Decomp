.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_ov070_0221189c

.global func_ov070_022126b8
func_ov070_022126b8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x1f4]
    cmp r0, #0x2
    beq .L_02212714
    mov r0, #0x0
    str r0, [r4, #0xf0]
    str r0, [r4, #0xec]
    ldr r0, [r4, #0x6c]
    mov r1, #0x7
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x6c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x13c]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x13c]
    b .L_0221271c
.L_02212714:
    mov r0, #0x1f
    str r0, [r4, #0x134]
.L_0221271c:
    ldr r0, [r4, #0x118]
    cmp r0, #0x0
    beq .L_02212734
    add r0, r4, #0xd0
    add r1, r4, #0xdc
    bl func_ov070_0221189c
.L_02212734:
    ldr r1, [r4, #0x134]
    mvn r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x134]
    str r0, [r4, #0x120]
    mov r0, #0x0
    str r0, [r4, #0x11c]
    str r0, [r4, #0x118]
    ldr r0, [r4, #0x48]
    mov r1, #0x6
    str r1, [r0, #0x1cc]
    ldmia sp!, {r4, pc}
.size func_ov070_022126b8, . - func_ov070_022126b8
