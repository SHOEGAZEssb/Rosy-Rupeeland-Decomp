.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern func_02005070

.global func_ov085_02214248
func_ov085_02214248:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    add r0, r6, #0x98
    bl func_02005070
    mov r5, r0
    add r0, r6, #0x38
    bl func_02005070
    mov r4, r0
    add r0, r6, #0x88
    bl func_02005070
    add r0, r4, r0
    add r0, r5, r0
    cmp r0, #0x800
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov085_02214248, . - func_ov085_02214248
