; Matching retail form; see src/game/tile_layer_state_lifecycle.c.
.text
.extern MIi_CpuClearFast

    .global func_02029f2c
    .type func_02029f2c, @function
func_02029f2c: ; 0x02029f2c
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x1000
    strb r1, [r0, #0x31]
    add r1, r4, #0x4
    mov r0, #0x0
    mov r2, #0x1000
    bl MIi_CpuClearFast
    add r0, r4, #0x1000
    ldrb r2, [r0, #0x4]
    mov r1, #0x0
    bic r2, r2, #0x1f
    strb r2, [r0, #0x4]
    ldrb r2, [r0, #0x5]
    bic r2, r2, #0xf
    strb r2, [r0, #0x5]
    str r1, [r0, #0x10]
    str r1, [r0, #0x18]
    str r1, [r0, #0x1c]
    str r1, [r0, #0x20]
    str r1, [r0, #0x24]
    strh r1, [r0, #0x28]
    strh r1, [r0, #0x2a]
    strh r1, [r0, #0x2c]
    strh r1, [r0, #0x2e]
    str r1, [r0, #0x14]
    strb r1, [r0, #0x30]
    strh r1, [r0, #0x32]
    strh r1, [r0, #0x34]
    ldrb r1, [r0, #0x30]
    orr r1, r1, #0x1
    strb r1, [r0, #0x30]
    ldmia sp!, {r4, pc}
    .size func_02029f2c, . - func_02029f2c

