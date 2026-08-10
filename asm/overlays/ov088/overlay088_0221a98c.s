.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern VecFx32Object_InitCopy

.global func_ov088_0221a98c
func_ov088_0221a98c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    add r1, r5, #0x18
    mov r4, r0
    bl VecFx32Object_InitCopy
    ldr r0, [r5, #0x238]
    ldr r1, [r5, #0x23c]
    ldrsh r0, [r0, #0x18]
    ldr r2, [r4, #0xc]
    add r0, r1, r0, lsl #0xc
    add r0, r2, r0
    str r0, [r4, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov088_0221a98c, . - func_ov088_0221a98c
