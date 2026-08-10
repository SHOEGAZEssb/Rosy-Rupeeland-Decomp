.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.
.extern GraphicsSpriteState_SetAnimationIndex

.global func_ov070_02212908
func_ov070_02212908:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, #0x2
    mov r7, r0
    mov r6, r2
    mov r5, r3
    sub r4, r4, #0x1
.L_02212920:
    add r0, r7, r4, lsl #0x2
    ldr r2, [r0, #0xc8]
    ldrh r0, [r2, #0x42]
    tst r0, #0x4
    beq .L_0221298c
    bic r0, r0, #0x4
    strh r0, [r2, #0x42]
    add r0, r7, r4, lsl #0x2
    ldr r0, [r0, #0xc8]
    cmp r1, #0x0
    moveq r1, #0xa
    movne r1, #0x10
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r7, #0x48]
    add r2, r7, r4, lsl #0x2
    ldr r1, [r0, #0x190]
    ldr r0, [r2, #0xc8]
    sub r1, r6, r1
    str r1, [r0, #0x30]
    ldr r1, [r7, #0x48]
    ldr r0, [r2, #0xc8]
    ldr r1, [r1, #0x194]
    sub r1, r5, r1
    str r1, [r0, #0x34]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0221298c:
    subs r4, r4, #0x1
    bpl .L_02212920
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov070_02212908, . - func_ov070_02212908
