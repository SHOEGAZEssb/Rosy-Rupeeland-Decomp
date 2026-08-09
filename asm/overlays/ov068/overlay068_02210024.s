.text
; Matching fallback for the portable implementation in src/overlays/ov068/overlay068_recovery.c.
.extern func_ov068_02210044

.global func_ov068_02210024
func_ov068_02210024:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x0]
    cmp r1, #0x0
    beq .L_0221003c
    bl func_ov068_02210044
.L_0221003c:
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov068_02210024, . - func_ov068_02210024
