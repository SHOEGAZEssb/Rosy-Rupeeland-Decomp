.text

/* Exact fallback for func_ov042_021fea78; see the documented portable C in
 * src/overlays/ov042/overlay042_record_helpers.c. */
.extern func_ov042_021fe9e4
.extern func_ov042_021fea08

    .global func_ov042_021fea78
func_ov042_021fea78:
    stmdb sp!, {r3, r4, r5, lr}
    mov r1, #0x64
    mov r5, r0
    sub r4, r1, #0x1
.L_021fea88:
    mov r0, r5
    mov r1, r4
    bl func_ov042_021fe9e4
    subs r4, r4, #0x1
    bpl .L_021fea88
    mov r0, #0x30
    sub r4, r0, #0x1
.L_021feaa4:
    mov r0, r5
    mov r1, r4
    bl func_ov042_021fea08
    subs r4, r4, #0x1
    bpl .L_021feaa4
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov042_021fea78, . - func_ov042_021fea78
