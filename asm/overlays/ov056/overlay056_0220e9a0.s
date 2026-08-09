.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern func_ov056_0220e9e0

.global func_ov056_0220e9a0
func_ov056_0220e9a0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, #0x0
    mov r7, r0
    mov r4, r5
.L_0220e9b0:
    mov r6, r4
.L_0220e9b4:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_ov056_0220e9e0
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_0220e9b4
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_0220e9b0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov056_0220e9a0, . - func_ov056_0220e9a0
