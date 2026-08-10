.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern GraphicsSpriteGroup_AdvanceAnimations

.global func_ov059_02210508
func_ov059_02210508:
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x60]
    sub r1, r3, r1
    str r1, [r0, #0x68]
    ldr r1, [r0, #0x64]
    sub r1, r1, r2
    str r1, [r0, #0x6c]
    ldr r3, [r0, #0x0]
    cmp r3, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, [r0, #0x68]
    ldr r2, [r0, #0x6c]
    add r1, r1, #0x2c
    str r1, [r3, #0x18]
    add r1, r2, #0x3c
    str r1, [r3, #0x1c]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldmia sp!, {r3, pc}
.size func_ov059_02210508, . - func_ov059_02210508
