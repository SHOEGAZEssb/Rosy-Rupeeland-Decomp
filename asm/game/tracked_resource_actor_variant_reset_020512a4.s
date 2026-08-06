; Matching retail form; see src/game/tracked_resource_actor_variant_reset.c.
.text
    .global func_020512a4
func_020512a4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x4e]
    cmp r1, #0x19
    bne .L_020512cc
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xc4]
    blx r2
    b .L_020512f0
.L_020512cc:
    mov r0, #0x0
    str r0, [r4, #0x40]
    str r0, [r4, #0x3c]
    mov r0, #0x1000
    str r0, [r4, #0x44]
    ldr r1, [r4, #0x14]
    ldr r0, .L_02051310
    and r0, r1, r0
    str r0, [r4, #0x14]
.L_020512f0:
    ldr r0, [r4, #0x10]
    orr r0, r0, #0x1f0000
    str r0, [r4, #0x10]
    ldr r0, [r4, #0x1f4]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x1f4]
    ldmia sp!, {r4, pc}
.L_02051310: .word 0xff7fffbf
    .size func_020512a4, . - func_020512a4

