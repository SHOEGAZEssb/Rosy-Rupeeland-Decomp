.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern GraphicsSpriteState_SetAnimationIndex

.global func_ov076_02213974
func_ov076_02213974:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x54]
    ldrsh r2, [r4, #0xda]
    ldrb r1, [r0, #0x38]
    cmp r2, r1
    beq .L_02213998
    and r1, r2, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02213998:
    ldr r2, [r4, #0x54]
    mov r1, #0x100
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x54]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x54]
    strh r1, [r0, #0x36]
    ldmia sp!, {r4, pc}
.size func_ov076_02213974, . - func_ov076_02213974
