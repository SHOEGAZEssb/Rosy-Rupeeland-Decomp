.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_sprite_recovery.c.
.extern GraphicsSpriteState_SetAnimationIndex

.global func_ov049_0220bb84
func_ov049_0220bb84:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x88]
    b .L_0220bbcc
.L_0220bb94:
    add r1, r5, r4, lsl #0x2
    ldr r0, [r1, #0x68]
    ldrh r0, [r0, #0x42]
    tst r0, #0x4
    bne .L_0220bbcc
    ldr r0, [r1, #0x4c]
    mov r1, #0x1
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r5, r4, lsl #0x1
    mov r1, #0x1a4
    strh r1, [r0, #0xac]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_0220bbcc:
    subs r4, r4, #0x1
    bpl .L_0220bb94
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov049_0220bb84, . - func_ov049_0220bb84
