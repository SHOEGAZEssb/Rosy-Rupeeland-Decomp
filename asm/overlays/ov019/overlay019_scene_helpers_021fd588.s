    .text
/* Exact fallback; see src/overlays/ov019/overlay019_scene_helpers.c. */
    .extern data_021052fc
    .extern func_0200ea34

.global func_ov019_021fd588
func_ov019_021fd588:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    ldrne r0, [r0, #0x58]
    cmpne r0, #0x0
    beq L_021fd5bc
    ldr r1, L_021fd5c4
    ldr r0, L_021fd5c8
    ldrh r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl func_0200ea34
L_021fd5bc:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_021fd5c4: .word 0x4000006
L_021fd5c8: .word data_021052fc
    .size func_ov019_021fd588, . - func_ov019_021fd588
