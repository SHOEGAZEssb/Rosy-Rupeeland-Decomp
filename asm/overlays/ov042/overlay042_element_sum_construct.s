.text
/* Exact fallback; see src/overlays/ov042/overlay042_late_helpers.c. */
.extern func_ov042_021fcf80
    .global func_ov042_02206fc0
func_ov042_02206fc0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    mov r5, r2
    mov r4, r0
    bl func_ov042_021fcf80
    ldr r1, [r6, #0x4]
    ldr r0, [r5, #0x4]
    add r0, r1, r0
    str r0, [r4, #0x4]
    ldr r1, [r6, #0x8]
    ldr r0, [r5, #0x8]
    add r0, r1, r0
    str r0, [r4, #0x8]
    ldmia sp!, {r4, r5, r6, pc}
    .size func_ov042_02206fc0, . - func_ov042_02206fc0
