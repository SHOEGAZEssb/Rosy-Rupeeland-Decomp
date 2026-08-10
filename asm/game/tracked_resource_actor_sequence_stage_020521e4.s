; Matching retail form; see src/game/tracked_resource_actor_sequence_stage.c.
.extern GraphicsSpriteState_SetAnimationIndex
.text
    .global func_020521e4
func_020521e4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x100
    ldrsh r1, [r0, #0xf8]
    add r1, r1, #0x1
    strh r1, [r0, #0xf8]
    ldr r2, [r4, #0x1fc]
    ldrsh r1, [r0, #0xf8]
    ldrsh r2, [r2, #0x28]
    sub r0, r2, #0x3c
    cmp r1, r0
    movgt r2, #0x5
    bgt .L_02052228
    sub r0, r2, #0x78
    cmp r1, r0
    movgt r2, #0x4
    movle r2, #0x3
.L_02052228:
    ldr r0, [r4, #0x54]
    ldrb r1, [r0, #0x38]
    cmp r2, r1
    ldmeqia sp!, {r4, pc}
    and r1, r2, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
    .size func_020521e4, . - func_020521e4
