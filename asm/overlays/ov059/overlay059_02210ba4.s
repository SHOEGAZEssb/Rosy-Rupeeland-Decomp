.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_ov059_02210ab0

.global func_ov059_02210ba4
func_ov059_02210ba4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x0]
    cmp r1, #0x0
    beq .L_02210bbc
    bl func_ov059_02210ab0
.L_02210bbc:
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov059_02210ba4, . - func_ov059_02210ba4
