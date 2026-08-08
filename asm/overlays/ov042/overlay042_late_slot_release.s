.text

/* Exact fallback for func_ov042_02205148; see the documented portable C in
 * src/overlays/ov042/overlay042_late_helpers.c. */

    .global func_ov042_02205148
func_ov042_02205148:
    add r3, r0, #0x4
    ldrsb r2, [r3, r1]
    cmp r2, #0x0
    bxlt lr
    mvn r2, #0x0
    strb r2, [r3, r1]
    add r3, r0, r1, lsl #0x1
    mov r2, r1, lsl #0x10
    ldr ip, [r0, #0x844]
    add r1, r3, #0x700
    strh ip, [r1, #0xc4]
    mov r1, r2, asr #0x10
    str r1, [r0, #0x844]
    bx lr
    .size func_ov042_02205148, . - func_ov042_02205148
