; Matching retail form; see src/game/tracked_resource_actor_timed_reset.c.
.text
    .global func_02051c90
func_02051c90:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x4e]
    cmp r1, #0x19
    mov r1, #0x0
    bne .L_02051cb4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xc4]
    blx r2
    ldmia sp!, {r3, pc}
.L_02051cb4:
    str r1, [r0, #0x40]
    str r1, [r0, #0x3c]
    mov r1, #0x1000
    str r1, [r0, #0x44]
    ldr r2, [r0, #0x14]
    ldr r1, .L_02051cd8
    and r1, r2, r1
    str r1, [r0, #0x14]
    ldmia sp!, {r3, pc}
.L_02051cd8: .word 0xff7fffbf
    .size func_02051c90, . - func_02051c90
