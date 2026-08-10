.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.
.extern GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin

.global func_ov073_0220feb8
func_ov073_0220feb8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r3, [r4, #0x14]
    mov r0, #0x8
    str r3, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r5, r2
    ldr r0, [r4, #0x4]
    ldr r2, [r4, #0xc]
    ldr r3, [r4, #0x10]
    bl GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin
    mvn r0, #0x0
    cmp r5, r0
    ldrnesh r1, [r4, #0x44]
    ldrne r0, [r4, #0x4]
    addne r1, r5, r1
    strneh r1, [r0, #0x28]
    ldreq r2, [r4, #0x4]
    ldreqsh r1, [r4, #0x44]
    ldreqh r0, [r2, #0x28]
    addeq r0, r1, r0
    streqh r0, [r2, #0x28]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0x3a]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov073_0220feb8, . - func_ov073_0220feb8
