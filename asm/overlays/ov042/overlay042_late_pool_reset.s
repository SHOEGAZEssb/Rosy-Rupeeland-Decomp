.text

/* Exact fallback for func_ov042_02205180; see the documented portable C in
 * src/overlays/ov042/overlay042_late_helpers.c. */
.extern func_ov042_02205148

    .global func_ov042_02205180
func_ov042_02205180:
    stmdb sp!, {r3, r4, r5, lr}
    mov r1, #0x40
    mov r5, r0
    sub r4, r1, #0x1
.L_02205190:
    mov r0, r5
    mov r1, r4
    bl func_ov042_02205148
    subs r4, r4, #0x1
    bpl .L_02205190
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov042_02205180, . - func_ov042_02205180
