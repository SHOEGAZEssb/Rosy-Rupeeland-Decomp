.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern func_ov085_02213bf8

.global func_ov085_02213cbc
func_ov085_02213cbc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov085_02213bf8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, [r4, #0x1dc]
    ldr r0, [r4, #0x24]
    cmp r1, r0
    movlt r0, #0x7
    movge r0, #0x2
    strh r0, [r4, #0xd6]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov085_02213cbc, . - func_ov085_02213cbc
