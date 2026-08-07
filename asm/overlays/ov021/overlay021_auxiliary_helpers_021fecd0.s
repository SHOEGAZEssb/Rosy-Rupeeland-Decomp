    .text
/* Exact fallback; see src/overlays/ov021/overlay021_auxiliary_helpers.c. */
    .extern func_020062f8
    .extern func_ov001_021fca94
    .extern func_ov021_021feac8

.global func_ov021_021fecd0
func_ov021_021fecd0:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r1, [r4, #0x358]
    cmp r1, #0x0
    beq L_021fed28
    add r0, sp, #0x0
    bl func_ov001_021fca94
    add r1, sp, #0x0
    add r0, r4, #0x368
    bl func_ov021_021feac8
    ldr r0, [r4, #0x358]
    cmp r0, #0x0
    beq L_021fed14
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fed14:
    add r0, r4, #0x1c
    mov r1, #0x0
    add r0, r0, #0x400
    str r1, [r4, #0x358]
    bl func_020062f8
L_021fed28:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
    .size func_ov021_021fecd0, . - func_ov021_021fecd0

