    .text
/* Exact fallback; see src/overlays/ov020/overlay020_scene_runtime_helpers.c. */
    .extern func_020925a4
    .extern func_020925dc
    .extern func_020925f8
    .extern func_02092618
    .extern func_02092638
    .extern func_02092688

.global func_ov020_021fdca4
func_ov020_021fdca4:
    stmdb sp!, {r4, lr}
    ldr r3, L_021fdd78
    mov r4, r0
    ldrh r2, [r3, #0x0]
    mov r1, #0x1c
    mov r0, #0x0
    orr r2, r2, #0x8000
    strh r2, [r3, #0x0]
    str r1, [r4, #0x48]
    bl func_020925a4
    ldr r2, L_021fdd7c
    ldr r0, L_021fdd80
    ldrh r1, [r2, #0x0]
    add r0, r0, #0x208
    and r1, r1, #0x43
    orr r1, r1, #0xc10
    orr r1, r1, #0x1000
    strh r1, [r2, #0x0]
    ldrh r1, [r2, #0x2]
    and r1, r1, #0x43
    orr r0, r1, r0
    strh r0, [r2, #0x2]
    bl func_020925f8
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092638
    mov r0, #0x1a
    str r0, [r4, #0x4c]
    mov r0, #0x0
    bl func_020925dc
    ldr r1, L_021fdd84
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3800
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x3a00
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x6]
    and r0, r0, #0x43
    orr r0, r0, #0x218
    orr r0, r0, #0x1c00
    strh r0, [r1, #0x6]
    bl func_02092618
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092688
    ldmia sp!, {r4, pc}
L_021fdd78: .word 0x4000304
L_021fdd7c: .word 0x400000c
L_021fdd80: .word 0x1c10
L_021fdd84: .word 0x4001008
    .size func_ov020_021fdca4, . - func_ov020_021fdca4

