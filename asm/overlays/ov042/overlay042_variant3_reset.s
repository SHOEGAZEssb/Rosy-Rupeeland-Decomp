.text
.extern GraphicsSpriteState_SetAnimationIndex
.extern data_ov042_0220b6e4
.extern data_ov042_0220b6e8
    .global func_ov042_02209190
func_ov042_02209190:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4c]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x0
    str r0, [r4, #0x78]
    ldrb r2, [r4, #0x8e]
    ldr r1, .L_022091ec
    ldr r0, .L_022091f0
    ldr r1, [r1, r2, lsl #0x3]
    mov r1, r1, lsl #0xc
    str r1, [r4, #0x54]
    ldrb r1, [r4, #0x8e]
    ldr r0, [r0, r1, lsl #0x3]
    mov r0, r0, lsl #0xc
    str r0, [r4, #0x58]
    ldr r1, [r4, #0x4c]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldmia sp!, {r4, pc}
.L_022091ec: .word data_ov042_0220b6e4
.L_022091f0: .word data_ov042_0220b6e8
    .size func_ov042_02209190, . - func_ov042_02209190
