.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern GraphicsSpriteState_SetAnimationIndex

.global func_ov076_02213740
func_ov076_02213740:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x54]
    mov r1, #0x5
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x54]
    mov r1, #0x0
    strh r1, [r0, #0x36]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    ldrb r0, [r4, #0x29c]
    orr r0, r0, #0x8
    strb r0, [r4, #0x29c]
    ldmia sp!, {r4, pc}
.size func_ov076_02213740, . - func_ov076_02213740
