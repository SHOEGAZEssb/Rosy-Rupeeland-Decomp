.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern func_02005030
.extern func_02005058

.global func_ov079_02213458
func_ov079_02213458:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    mov r4, r1
    add r0, sp, #0x0
    add r1, r5, #0x18
    bl func_02005030
    ldr r1, [r5, #0x1c]
    ldr r0, [r4, #0x1c]
    ldr r2, [sp, #0x4]
    sub r0, r1, r0
    add r0, r2, r0
    str r0, [sp, #0x4]
    ldr r1, [r5, #0x20]
    ldr r0, [r4, #0x20]
    ldr r2, [sp, #0x8]
    sub r0, r1, r0
    add r1, r2, r0
    str r1, [sp, #0x8]
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xd0]
    blx r2
    mov r1, #0x4000
    add r0, sp, #0x0
    str r1, [r5, #0x44]
    bl func_02005058
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov079_02213458, . - func_ov079_02213458
