.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_ov075_02215910

.global func_ov075_022151bc
func_ov075_022151bc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x260]
    mov r4, r1
    orr r1, r2, #0x2
    str r1, [r5, #0x260]
    bl func_ov075_02215910
    mov r0, r5
    ldr r3, [r0, #0x0]
    mov r1, r4
    ldr r3, [r3, #0x108]
    mov r2, #0x1
    blx r3
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov075_022151bc, . - func_ov075_022151bc
