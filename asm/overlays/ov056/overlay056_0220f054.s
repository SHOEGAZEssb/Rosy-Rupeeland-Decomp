.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern func_02004fe0
.extern func_02005058
.extern func_020050a4

.global func_ov056_0220f054
func_ov056_0220f054:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r0, sp, #0x0
    mov r4, r1
    bl func_02004fe0
    ldr r1, [r4, #0x4]
    add r0, r5, #0x98
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x4]
    ldr r1, [r4, #0x8]
    mov r2, #0x0
    mov r3, r1, lsl #0xc
    add r1, sp, #0x0
    add r0, r0, #0x800
    str r3, [sp, #0x8]
    str r2, [sp, #0xc]
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov056_0220f054, . - func_ov056_0220f054
