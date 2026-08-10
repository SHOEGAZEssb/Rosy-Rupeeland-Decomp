.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_ov059_02210600
.extern func_ov059_02210620

.global func_ov059_022105a8
func_ov059_022105a8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    str r1, [r5, #0x1c]
    str r2, [r5, #0x20]
    str r3, [r5, #0x24]
    ldr r1, [r5, #0x20]
    ldr r0, [r5, #0x1c]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r5, #0x14
    bl func_ov059_02210620
    mov r4, r0
    add r0, r5, #0x14
    bl func_ov059_02210600
    ldr r1, [r5, #0x1c]
    strh r0, [r1, #0x2c]
    strh r4, [r1, #0x2e]
    ldr r1, [r5, #0x1c]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov059_022105a8, . - func_ov059_022105a8
