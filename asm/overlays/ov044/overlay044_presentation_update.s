.text
.extern SpriteMotionController_Show
.extern func_ov044_0220c80c

    .global func_ov044_0220c700
func_ov044_0220c700:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r3, [r4, #0xcc]
    cmp r3, #0x0
    beq .L_0220c738
    ldr r1, [r4, #0x228]
    mov r0, #0x18
    ldr r1, [r1, #0x44]
    ldr r2, [r1, #0x14]
    ldr r1, [r1, #0xc]
    sub r1, r2, r1
    mul r0, r1, r0
    add r0, r0, #0x20
    strh r0, [r3, #0x2e]
.L_0220c738:
    add r0, r4, #0x17c
    bl SpriteMotionController_Show
    mov r0, r4
    bl func_ov044_0220c80c
    ldmia sp!, {r4, pc}
.size func_ov044_0220c700, . - func_ov044_0220c700
