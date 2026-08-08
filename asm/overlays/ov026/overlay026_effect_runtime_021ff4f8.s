.text

/* Exact fallback; see src/overlays/ov026/overlay026_effect_runtime.c. */
.extern func_02094d28


    .global func_ov026_021ff4f8
func_ov026_021ff4f8:
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x134]
    mov r1, #0xa
    ldr ip, [r0, #0x138]
    mul r2, r3, r1
    mul r3, ip, r1
    mov r1, #0x1
    bl func_02094d28
    ldmia sp!, {r3, pc}
.size func_ov026_021ff4f8, .-func_ov026_021ff4f8

