.text
; Matching fallback for the portable implementation in src/overlays/ov068/overlay068_recovery.c.
.extern func_02003e38

.global func_ov068_02210044
func_ov068_02210044:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02210064
    bl func_02003e38
    mov r0, #0x0
    str r0, [r4, #0x0]
.L_02210064:
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldmia sp!, {r4, pc}
.size func_ov068_02210044, . - func_ov068_02210044
