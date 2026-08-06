; Matching retail form; see src/game/sub_dual_layer_resource_renderer.c.
.text
.extern func_02029a40

    .global func_0202be68
    .type func_0202be68, @function
func_0202be68: ; 0x0202be68
    stmdb sp!, {r4, lr}
    mov r4, r1
    bl func_02029a40
    cmp r4, #0x0
    ldr r2, .L_0202bec8
    beq .L_0202bea4
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x3
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    ldmia sp!, {r4, pc}
.L_0202bea4:
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x3
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    ldmia sp!, {r4, pc}
.L_0202bec8: .word 0x4001000
    .size func_0202be68, . - func_0202be68
