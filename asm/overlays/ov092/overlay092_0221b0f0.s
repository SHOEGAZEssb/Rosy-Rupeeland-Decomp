.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern func_02050a8c
.extern GraphicsSpriteState_SetAnimationIndex

.global func_ov092_0221b0f0
func_ov092_0221b0f0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_02050a8c
    ldr r0, [r5, #0x54]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldrsh r1, [r4, #0xa]
    ldr r0, [r5, #0x54]
    mov r1, r1, lsl #0x1
    strh r1, [r0, #0x36]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov092_0221b0f0, . - func_ov092_0221b0f0
