.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_scene_helpers.c.
.extern func_02074110

.global func_ov050_0220e294
func_ov050_0220e294:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    cmp r1, #0x0
    movne r1, #0x1
    strne r1, [r0, #0x20]
    ldrne r0, [r4, #0x18]
    strne r1, [r0, #0x20]
    ldmneia sp!, {r4, pc}
    bl func_02074110
    ldr r0, [r4, #0x18]
    bl func_02074110
    ldmia sp!, {r4, pc}
.size func_ov050_0220e294, . - func_ov050_0220e294
