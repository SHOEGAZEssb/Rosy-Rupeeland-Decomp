; Matching retail form; see src/game/tracked_resource_actor_impulse_callbacks.c.
.extern func_0202d494
.extern func_020337d4
.extern func_02050260
.text
    .global func_020520b4
func_020520b4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020337d4
    mov r1, r4
    bl func_0202d494
    mov r0, r4
    bl func_02050260
    ldmia sp!, {r4, pc}
    .size func_020520b4, . - func_020520b4

    .global func_020520d4
func_020520d4:
    add r1, r0, #0x100
    ldrsh r2, [r1, #0xf8]
    add r2, r2, #0x1
    strh r2, [r1, #0xf8]
    ldr r2, [r0, #0x1fc]
    ldrsh r3, [r1, #0xf8]
    ldrsh r1, [r2, #0x28]
    sub r1, r1, #0x3c
    cmp r3, r1
    bxle lr
    ldr r1, [r0, #0x54]
    tst r3, #0x4
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x4
    streqh r0, [r1, #0x24]
    bx lr
    .size func_020520d4, . - func_020520d4
