.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_020befec

.global func_ov059_02210d90
func_ov059_02210d90:
    stmdb sp!, {r3, lr}
    mov r0, r1
    mov r1, #0x3
    bl func_020befec
    cmp r1, #0x0
    addlt r1, r1, #0x3
    add r0, r1, #0x1
    ldmia sp!, {r3, pc}
.size func_ov059_02210d90, . - func_ov059_02210d90
