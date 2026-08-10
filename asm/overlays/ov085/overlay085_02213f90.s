.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern VecFx32Object_Assign
.extern func_ov085_02213b3c

.global func_ov085_02213f90
func_ov085_02213f90:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x2
    str r0, [r4, #0xd0]
    ldr r0, [r4, #0x22c]
    cmp r0, #0x0
    bne .L_02213fc4
    add r0, r4, #0x78
    add r1, r4, #0x214
    bl VecFx32Object_Assign
    mov r0, #0x0
    str r0, [r4, #0x210]
.L_02213fc4:
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, r4, #0x78
    ldr r2, [r2, #0xc8]
    blx r2
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    ldreq r0, [r4, #0x40]
    cmpeq r0, #0x0
    bne .L_02213ff4
    mov r0, r4
    bl func_ov085_02213b3c
.L_02213ff4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov085_02213f90, . - func_ov085_02213f90
