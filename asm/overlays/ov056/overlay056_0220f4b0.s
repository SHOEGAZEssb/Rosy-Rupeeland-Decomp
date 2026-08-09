.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern GameFile_HasStatusFlag01
.extern func_020b44e8
.extern func_ov056_0220f58c

.global func_ov056_0220f4b0
func_ov056_0220f4b0:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0220f4dc
    cmp r0, #0x1
    beq .L_0220f4f8
    cmp r0, #0x2
    beq .L_0220f53c
    b .L_0220f54c
.L_0220f4dc:
    ldr r0, [r4, #0x0]
    bl GameFile_HasStatusFlag01
    cmp r0, #0x0
    bne .L_0220f54c
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    str r0, [r4, #0x4]
.L_0220f4f8:
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    blt .L_0220f524
    add r2, r4, #0x800
    ldrh r3, [r2, #0x16]
    add r0, r4, #0x10
    str r3, [sp, #0x0]
    ldrh r3, [r2, #0x14]
    ldr r2, [r4, #0x0]
    bl func_ov056_0220f58c
    bl func_020b44e8
.L_0220f524:
    mov r0, #0x1
    str r0, [r4, #0x810]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    b .L_0220f54c
.L_0220f53c:
    ldr r0, [r4, #0x810]
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_0220f550
.L_0220f54c:
    mov r0, #0x0
.L_0220f550:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.size func_ov056_0220f4b0, . - func_ov056_0220f4b0
