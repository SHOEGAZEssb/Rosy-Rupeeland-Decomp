.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern func_ov071_02210184

.global func_ov071_022119bc
func_ov071_022119bc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    mov r5, r2
    mov r4, r0
    bl func_ov071_02210184
    ldr r1, [r6, #0x4]
    ldr r0, [r5, #0x4]
    sub r0, r1, r0
    str r0, [r4, #0x4]
    ldr r1, [r6, #0x8]
    ldr r0, [r5, #0x8]
    sub r0, r1, r0
    str r0, [r4, #0x8]
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov071_022119bc, . - func_ov071_022119bc
