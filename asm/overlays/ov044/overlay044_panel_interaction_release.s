.text
.extern GraphicsSpriteState_ReleaseFromGroup

    .global func_ov044_0220bb60
func_ov044_0220bb60:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x40]
    mov r4, r1
    cmp r4, r0
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x38]
    add r0, r0, r4, lsl #0x5
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl GraphicsSpriteState_ReleaseFromGroup
    ldr r0, [r5, #0x38]
    mov r1, #0x0
    add r0, r0, r4, lsl #0x5
    str r1, [r0, #0x10]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov044_0220bb60, . - func_ov044_0220bb60
