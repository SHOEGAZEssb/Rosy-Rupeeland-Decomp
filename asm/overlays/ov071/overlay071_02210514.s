.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern GraphicsSpriteState_SetAnimationIndex

.global func_ov071_02210514
func_ov071_02210514:
    stmdb sp!, {r3, lr}
    strh r1, [r0, #0xf8]
    mov r2, #0x0
    str r2, [r0, #0xfc]
    cmp r1, #0x4
    ldmneia sp!, {r3, pc}
    ldr r0, [r0, #0xec]
    mov r1, #0x1a
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldmia sp!, {r3, pc}
.size func_ov071_02210514, . - func_ov071_02210514
